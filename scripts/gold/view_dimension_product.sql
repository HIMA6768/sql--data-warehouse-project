create  view gold.dim_product as
select 
row_number() over(order by pi.prd_id) as product_key,
pi.prd_id as product_id,
pi.prd_name as product_name,
pi.prd_price as product_price,
pi.prd_line as product_line,
pi.sls_prd_key as product_no,
pc.cat as category,
pc.subcat as subcategory,
pi.prd_start_date as startdate,
pc.maintainance as maintainance
from silver.crm_prd_info pi
left join silver.erp_px_cat  pc
on pi.cat_key=pc.pid
