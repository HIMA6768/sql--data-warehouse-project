create view gold.dim_customer as

select
row_number() over( order by ci.cust_id) as customer_key,
ci.cust_id as customer_id,
ci.cust_key as customer_number,
ci.cust_firstname as first_name,
ci.cust_lastname as last_name,
cd.cst_bdate as birth_date,
case 
when ci.cust_gender!=cd.cust_gender and ci.cust_gender ='NA' and  cd.cust_gender !='NA' then  cd.cust_gender
else ci.cust_gender
end as gender,
ci.cust_marital_status as marital_status,
cl.cust_country as country,
ci.cust_create_date as create_date
from silver.crm_cust_info  ci
left join silver.erp_cust   cd
on ci.cust_key= cd.cust_id
left join silver.erp_location cl
on ci.cust_key= cl.cust_id;

