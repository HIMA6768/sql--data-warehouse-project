
-- inserting transformed data in customer_info
truncate table  silver.crm_cust_info;
insert into   silver.crm_cust_info 
(cust_id, 
    cust_key, 
    cust_firstname, 
    cust_lastname, 
    cust_marital_status, 
    cust_gender, 
    cust_create_date)
	
with rev_cust_info as 
(
select*,
ROW_NUMBER()
over (
 partition by cust_id 
 order by cust_create_date desc
) as rank
from bronze.crm_cust_info
)
select 
cust_id,
trim(cust_key) as cust_key,
trim(cust_firstname)as cust_firstname,
trim(cust_lastname) as cust_lastname,

case
when upper(cust_marital_status)='M' then 'Married'
when upper(cust_marital_status)='S' then 'Single'
else 'NA'
end as cust_marital_status,

case
when upper(cust_gender)='M' then 'Male'
when upper(cust_gender)='F' then 'Female'
else 'NA'
end as cust_gender,

cust_create_date

from rev_cust_info
where rank=1 and cust_id is not NULL;
