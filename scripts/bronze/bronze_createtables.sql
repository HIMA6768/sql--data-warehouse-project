drop table  if exists bronze.crm_cust_info;
create table bronze.crm_cust_info
(
  cust_id int,
  cust_key varchar(30),
  cust_firstname varchar(20),
  cust_lastname varchar(20),
  cust_marital_status varchar(2),
  cust_gender varchar(2),
  cust_create_date date
  
);

drop table if exists bronze.crm_prd_info;
create table bronze.crm_prd_info
(
prd_id int,
prd_key varchar(30),
prd_name varchar(100),
prd_price int,
prd_line varchar(5),
prd_start_date date,
prd_end_date date
);

drop table if exists bronze.crm_sales_info;
create table bronze.crm_sales_info
(
sls_order_num varchar(20),
sls_product_key varchar(30),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales int,
sls_quantity int,
sls_price int

);



drop table if exists bronze.erp_cust;
create table bronze.erp_cust
(
cust_id varchar(20),
cst_bdate date,
cust_gender varchar(10)
);

drop table if exists bronze.erp_location;
create table bronze.erp_location
(
cust_id varchar(20),
cust_country varchar (20)
);

drop table if exists bronze.erp_px_cat;
create table bronze.erp_px_cat
(
pid varchar(10),
cat varchar (20),
subcat varchar(30),
maintainanance varchar(10)
);













