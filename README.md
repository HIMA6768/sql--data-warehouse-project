# 🚀 Enterprise SQL Data Warehouse & Lakehouse Project

[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Architecture](https://img.shields.io/badge/Architecture-Medallion-orange?style=for-the-badge&logo=databricks&logoColor=white)](https://www.databricks.com/glossary/medallion-architecture)
[![Naming Convention](https://img.shields.io/badge/Standard-Snake_Case-green?style=for-the-badge)](https://github.com/HIMA6768/sql--data-warehouse-project)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

---

## 📖 The Story & Vision

Welcome to the **Enterprise SQL Data Warehouse** project! Modern organizations face a massive bottleneck: data arrives from disparate sources (CRM, ERP, Webhooks) in messy, unstructured, and error-prone formats. 

This project implements a robust **Modern Medallion Architecture (Bronze, Silver, Gold layers)** to ingest raw operational data, systematically clean and conform it, and finally model it into high-performance dimensional structures (Star Schema) optimized for Business Intelligence and analytical reporting.

---

## 🏗️ Data Architecture & Pipeline Flow

The data flows through three distinct analytical tiers, ensuring absolute data integrity, traceability, and business readiness.

```mermaid
flowchart TD
    subgraph Sources [Source Systems]
        CRM[CRM System]
        ERP[ERP System]
    end

    subgraph Bronze Layer [Bronze: Raw Ingestion]
        B_Table[raw_crm_customer / raw_erp_orders]
    end

    subgraph Silver Layer [Silver: Cleaned & Conformed]
        S_Table[Standardized & Deduplicated Entities]
    end

    subgraph Gold Layer [Gold: Dimensional Star Schema]
        G_Dim1[dim_customer]
        G_Dim2[dim_product]
        G_Fact[fact_sales]
    end

    CRM --> B_Table
    ERP --> B_Table
    B_Table -->|Type Casting & Validation| S_Table
    S_Table -->|Star Schema Modeling| G_Dim1
    S_Table -->|Star Schema Modeling| G_Dim2
    G_Dim1 --> G_Fact
    G_Dim2 --> G_Fact
