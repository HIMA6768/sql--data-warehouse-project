

---

# **Data Warehouse Naming Conventions**

## **General Principles**

* **Naming Conventions:** Use `snake_case`, with lowercase letters and underscores (`_`) to separate words.


* **Language:** Use English for all names.


* **Avoid Reserved Words:** Do not use SQL reserved words as object names.



---

## **Table Naming Conventions**

### **Bronze Rules**

* All names must start with the source system name, and table names must match their original names without renaming.


* **Pattern:** `<sourcesystem>_<entity>`

* `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).


* `<entity>`: Exact table name from the source system.


* *Example:* `crm_customer_info` (Customer information from the CRM system).





### **Silver Rules**

* All names must start with the source system name, and table names must match their original names without renaming.


* **Pattern:** `<sourcesystem>_<entity>`

* `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).


* `<entity>`: Exact table name from the source system.


* *Example:* `crm_customer_info` (Customer information from the CRM system).





### **Gold Rules**

* All names must use meaningful, business-aligned names for tables, starting with the category prefix.


* **Pattern:** `<category>_<entity>`

* `<category>`: Describes the role of the table, such as `dim` or `fact`.


* `<entity>`: Descriptive name of the table, aligned with the business domain.


* *Examples:*
* `dim_customers` (Dimension table for customer data)


* `fact_sales` (Fact table containing sales transactions)




### **Surrogate Keys**

* All primary keys in dimension tables must use the suffix `_key`.


* **Pattern:** `<table_name>_key`

* `<table_name>`: Refers to the name of the table or entity the key belongs to.


* *Example:* `customer_key` (Surrogate key in the `dim_customers` table).





### **Technical Columns**

* All technical columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.


* **Pattern:** `dwh_<column_name>`

* `dwh`: Prefix exclusively for system-generated metadata.


* *Example:* `dwh_load_date` (System-generated column used to store the date when the record was loaded).





---

## **Stored Procedure Naming Conventions**

* All stored procedures used for loading data must follow the pattern: `load_<layer>`.


* `<layer>`: Represents the layer being loaded, such as `bronze`, `silver`, or `gold`.


* *Examples:*
* `load_bronze` (Stored procedure for loading data into the Bronze layer)


* `load_silver` (Stored procedure for loading data into the Silver layer)



