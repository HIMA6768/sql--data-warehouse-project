# **Gold Layer Data Catalog**

## **1. Dimension Table: `gold.dim_product`**
Stores detailed descriptive attributes of products, optimized for filtering and grouping in analytical queries.

| Column Name | Data Type | Constraint / Key | Description |
| :--- | :--- | :--- | :--- |
| `product_key` | `BIGINT` | Primary Key (Surrogate) | Unique surrogate key generated for each product record. |
| `product_id` | `INTEGER` | Natural Key | Original product identifier from the source system. |
| `product_name` | `VARCHAR(50)` | Descriptive | Full name of the product. |
| `product_price` | `INTEGER` | Measure / Attribute | Base listing price of the product. |
| `product_line` | `VARCHAR(20)` | Descriptive | Product line classification (e.g., Road, Sales others). |
| `product_no` | `VARCHAR(20)` | Descriptive | Unique product model or part number code. |
| `category` | `VARCHAR(20)` | Descriptive | High-level category classification (e.g., Components, Accessories). |
| `subcategory` | `VARCHAR(50)` | Descriptive | Subcategory classification (e.g., Road Frames, Helmets). |
| `startdate` | `DATE` | SCD Tracking | Effective start date for the product record version. |
| `maintainance` | `VARCHAR(20)` | Descriptive | Maintenance indicator flag (Yes / No). |
| `enddate` | `DATE` | SCD Tracking | Effective end date for the product record version (Null if active). |

---

## **2. Dimension Table: `gold.dim_customer`**
Stores descriptive attributes of customers for segmentation and demographic analysis.

| Column Name | Data Type | Constraint / Key | Description |
| :--- | :--- | :--- | :--- |
| `customer_key` | `BIGINT` | Primary Key (Surrogate) | Unique surrogate key generated for each customer record. |
| `customer_id` | `INTEGER` | Natural Key | Original customer identifier from the source system. |
| `customer_number` | `VARCHAR(30)` | Descriptive | Business-facing unique customer number code (e.g., `AW00011000`). |
| `first_name` | `VARCHAR(20)` | Descriptive | Customer's first name. |
| `last_name` | `VARCHAR(20)` | Descriptive | Customer's last name. |
| `birth_date` | `DATE` | Descriptive | Customer's date of birth. |
| `gender` | `VARCHAR(20)` | Descriptive | Customer's gender (`Male`, `Female`). |
| `marital_status` | `VARCHAR(20)` | Descriptive | Customer's marital status (`Single`, `Married`). |
| `country` | `VARCHAR(20)` | Descriptive | Customer's country of residence. |
| `create_date` | `DATE` | Audit / Date | Date when the customer record was created in the data warehouse. |

---

## **3. Fact Table: `gold.fact_sales`**
Contains quantitative transactional metrics and foreign keys linking to the product and customer dimensions.

| Column Name | Data Type | Constraint / Key | Description |
| :--- | :--- | :--- | :--- |
| `orderno` | `VARCHAR(20)` | Descriptive | Sales order transaction number (e.g., `SO43697`). |
| `customer_key` | `BIGINT` | Foreign Key | Links to `dim_customer.customer_key`. |
| `product_key` | `BIGINT` | Foreign Key | Links to `dim_product.product_key`. |
| `order_date` | `DATE` | Date Key | The exact date when the sales order was placed. |
| `ship_date` | `DATE` | Date Key | The date when the order items were shipped. |
| `due_date` | `DATE` | Date Key | The payment or delivery due date for the order. |
| `quantity` | `INTEGER` | Measure (Additive) | Number of units purchased in the line item. |
| `price` | `INTEGER` | Measure | Unit price of the product at the time of sale. |
| `amount` | `INTEGER` | Measure (Additive) | Total transaction line amount (quantity * price). |