-- CREATE EXTENSION IF NOT EXISTS file_fdw;

-- truncate and load method 
create or replace PROCEDURE bronze.load_bronze() 
language plpgsql
as 
$$

DECLARE 
starttime TIMESTAMP ;
endtime TIMESTAMP;

        
begin

raise notice '=====================================================================';
raise notice 'LOADING Started...';
raise notice '=====================================================================';

starttime:= clock_timestamp();
raise notice '-------- loading crm_cust_info -----';

truncate table bronze.crm_cust_info;
copy bronze.crm_cust_info 
from program 'curl -sl "https://raw.githubusercontent.com/HIMA6768/sql--data-warehouse-project/main/datasets/source_crm/cust_info.csv"'
DELIMITER ','
csv HEADER;

endtime:= clock_timestamp();
raise notice 'time taken .... %',(endtime-starttime);

starttime:= clock_timestamp();
raise notice '--------loading crm_prd_info ----------';

truncate table bronze.crm_prd_info;
copy bronze.crm_prd_info 
from program 'curl -sl "https://raw.githubusercontent.com/HIMA6768/sql--data-warehouse-project/main/datasets/source_crm/prd_info.csv"'
DELIMITER ','
csv HEADER;

endtime:= clock_timestamp();
raise notice 'time taken .... %',(endtime-starttime);



starttime:= clock_timestamp();
raise notice '--------loading crm_sales_info ----------';

truncate table bronze.crm_sales_info;
copy bronze.crm_sales_info
from program 'curl -sl "https://raw.githubusercontent.com/HIMA6768/sql--data-warehouse-project/main/datasets/source_crm/sales_details.csv"'
DELIMITER ','
csv HEADER;

endtime:= clock_timestamp();
raise notice 'time taken .... %',(endtime-starttime);


starttime:= clock_timestamp();
raise notice '--------loading erp_cust ----------';

truncate table bronze.erp_cust;
copy bronze.erp_cust 
from program 'curl -sl "https://raw.githubusercontent.com/HIMA6768/sql--data-warehouse-project/main/datasets/source_erp/CUST_AZ12.csv"'
DELIMITER ','
csv HEADER;

endtime:= clock_timestamp();
raise notice 'time taken .... %',(endtime-starttime);



starttime:= clock_timestamp();
raise notice '--------loading erp_location ----------';

truncate table bronze.erp_location;
copy bronze.erp_location
from program 'curl -sl "https://raw.githubusercontent.com/HIMA6768/sql--data-warehouse-project/main/datasets/source_erp/LOC_A101.csv"'
DELIMITER ','
csv HEADER;

endtime:= clock_timestamp();
raise notice 'time taken .... %',(endtime-starttime);



starttime:= clock_timestamp();
raise notice '--------loading erp_px_cat ----------';

truncate table bronze.erp_px_cat;
copy bronze.erp_px_cat
from program 'curl -sl "https://raw.githubusercontent.com/HIMA6768/sql--data-warehouse-project/main/datasets/source_erp/PX_CAT_G1V2.csv"'
DELIMITER ','
csv HEADER;

endtime:= clock_timestamp();
raise notice 'time taken .... %',(endtime-starttime);



end

$$


call bronze.load_bronze();


