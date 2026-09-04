drop table  if exists silver.crm_cust_info;
create table silver.crm_cust_info
(
  cust_id int,
  cust_key varchar(30),
  cust_firstname varchar(20),
  cust_lastname varchar(20),
  cust_marital_status varchar(20),
  cust_gender varchar(20),
  cust_create_date date,
  dwh_info timestamptz default clock_timestamp()
  
);

drop table if exists silver.crm_prd_info;
create table silver.crm_prd_info
(
prd_id int,
prd_key varchar(20),
cat_key varchar(20),
sls_prd_key varchar(20),
prd_name varchar(50),
prd_price int,
prd_line varchar(20),
prd_start_date date,
prd_end_date date,
dwh_info timestamptz default clock_timestamp()
);

drop table if exists silver.crm_sales_info;
create table silver.crm_sales_info
(
sls_order_num varchar(20),
sls_product_key varchar(20),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales int,
sls_quantity int,
sls_price int,
dwh_info timestamptz default clock_timestamp()
);



drop table if exists silver.erp_cust;
create table silver.erp_cust
(
cust_id varchar(20),
cst_bdate date,
cust_gender varchar(10),
dwh_info timestamptz default clock_timestamp()
);

drop table if exists silver.erp_location;
create table silver.erp_location
(
cust_id varchar(20),
cust_country varchar (20),
dwh_info timestamptz default clock_timestamp()
);

drop table if exists silver.erp_px_cat;
create table silver.erp_px_cat
(
pid varchar(10),
cat varchar (20),
subcat varchar(50),
maintainance varchar(20),
dwh_info timestamptz default clock_timestamp()
);











