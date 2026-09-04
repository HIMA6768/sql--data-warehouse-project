
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





-- inserting transformed data in prd_info
truncate table silver.crm_prd_info;
insert into silver.crm_prd_info
(prd_id ,
prd_key,
cat_key ,
sls_prd_key ,
prd_name ,
prd_price ,
prd_line ,
prd_start_date ,
prd_end_date
)
select prd_id,
trim(prd_key) as prd_key,
replace(substring (prd_key,1,5),'-','_') as cat_key,
substring(prd_key,7,length(prd_key)) as sls_prd_key,

trim(prd_name) as prd_name,
coalesce(prd_price,0) as prd_price,
case
when trim(upper(prd_line))='M' then'Mountain'
when trim(upper(prd_line))='R' then'Road'
when trim(upper(prd_line))='T' then'Tourism'
when trim(upper(prd_line))='S' then'Sales others'
else 'NA'
 end as prd_line,

cast (prd_start_date as  date ) as prd_startdate,
cast(lead(prd_start_date)over(partition by prd_key order by prd_start_date asc )-1 as date )as end_date 
from bronze.crm_prd_info ;

select * from silver.crm_prd_info
