
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


-- inserting transformed data in sales_info
truncate table silver.crm_sales_info;
insert into silver.crm_sales_info
select 
trim(sls_order_num) as sls_order_num,
trim(sls_product_key)as sls_product_key,
sls_cust_id,
case
when length(sls_order_dt)<8 then  cast(cast (cast ( sls_ship_dt as int )-1 as varchar) as date)
else cast (sls_order_dt as date)
end as sls_order_dt,
cast(sls_ship_dt as date) as sls_ship_dt,
cast(sls_due_dt as date) as sls_due_dt,
case 
when sls_sales <=0 or sls_sales is null  then abs(sls_price)/sls_quantity 
else sls_sales 
end as sls_sales,
sls_quantity,
case 
when sls_price is null then abs(sls_sales*sls_quantity)
else abs(sls_price) 
end as sls_price
from bronze.crm_sales_info;



-- inserting transformed data in erp_cust
truncate table silver.erp_cust;
insert into silver.erp_cust
select 
case 
when trim(cust_id) like 'NAS%' then trim(substring(cust_id,4,length(cust_id)))
else trim(cust_id)
end as cust_id,
case
when cst_bdate > now() then null
else cst_bdate
end as cust_bdate,
case
when trim(upper(cust_gender)) in ('F','FEMALE') then 'Female'
when trim(upper(cust_gender)) in ('M','MALE') then 'Male'
else 'NA'
end as cust_gender
from bronze.erp_cust;



-- inserting transfromed value in erp_location
Truncate table silver.erp_location;
insert into silver.erp_location
select 
replace(cust_id,'-','') as cust_id,
case 
when trim(cust_country) ='' or  trim(cust_country) is null  then 'NA'
when trim(upper(cust_country))='DE' then 'GERMANY'
when trim(upper(cust_country)) in ('US','USA') then 'UNITED STATES'
else trim(upper(cust_country))
end as cust_country
from bronze.erp_location;
