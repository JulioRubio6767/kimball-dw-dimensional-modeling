# 🏛️ Enterprise Data Warehouse: Kimball Dimensional Modeling & ETL Pipeline

🌐 **Idiomas / Languages:** [🇪🇸 Versión en Español](README.es.md) | [🇬🇧 English Version](README.md)


![SQL](https://img.shields.io/badge/SQL-Transact--SQL%20%7C%20PostgreSQL%20%7C%20SQLite-blue?logo=postgresql)
![Python](https://img.shields.io/badge/Python-ETL%20%26%20Pandas-yellow?logo=python)
![Architecture](https://img.shields.io/badge/Architecture-Star%20Schema%20(Kimball)-success)
![Jupyter](https://img.shields.io/badge/Notebooks-EDA%20%26%20Data%20Wrangling-orange?logo=jupyter)

A complete, production-grade Data Warehousing project implementing **Ralph Kimball's Dimensional Modeling methodology (Star Schema)**, exploratory data analysis (EDA), and automated ETL loading pipelines.

---

## 📌 Architecture & Design Principles

The objective of this project is to decouple transactional operational data (OLTP) into an optimized, high-performance analytical schema (OLAP) for executive decision-making.

```
[Operational Data / Flat Files]
             ⬇️
   [EDA & Data Profiling] (eda_final_entregable.ipynb)
             ⬇️
    [Python ETL Pipeline] (etl_warehouse.ipynb)
             ⬇️
[Star Schema Data Warehouse] (modelo_kimball.sql)
       ├── Fact Tables (Metrics & Business Transactions)
       └── Dimension Tables (Context: Time, Location, Licensing, Entities)
```

---

## 🔍 Schema Highlights (`modelo_kimball.sql`)

* **Fact Table (`FACT_TRANSACTIONS / FACT_LICENCIAS`):**
  * Granular transaction records with surrogate keys foreign relationships.
  * Additive and semi-additive business metrics (fees, surface area, capacity, operational duration).
* **Conformed Dimensions:**
  * `DIM_TIEMPO`: Temporal hierarchy (Year, Quarter, Month, Weekday, IsWeekend).
  * `DIM_UBICACION`: Spatial attributes (District, Neighborhood, Postal Code, Coordinates).
  * `DIM_ESTABLECIMIENTO`: Categorical profiling of commercial activities and status.
* **Integrity & Indexing:** Primary key / Foreign key constraints, surrogate key generation, and non-clustered indexes on dimension lookups.

---

## 📂 Repository Contents

* `modelo_kimball.sql`: DDL scripts containing database schema creation, table definitions, constraints, and data integrity checks.
* `eda_final_entregable.ipynb`: Comprehensive Exploratory Data Analysis, missing value treatments, outlier detection, and statistical profiling.
* `etl_warehouse.ipynb`: Automated Python-based ETL pipeline extracting raw sources, transforming data types, generating surrogate keys, and populating dimension/fact tables.

---

## 🚀 How to Run the Pipeline

### 1. Database Setup
Execute the DDL script against your database engine (PostgreSQL, SQLite, or SQL Server):
```bash
# Example with PostgreSQL:
psql -U your_user -d warehouse_db -f modelo_kimball.sql
```

### 2. Run the ETL Pipeline
Open and execute `etl_warehouse.ipynb` or run via Python:
```bash
jupyter notebook etl_warehouse.ipynb
```

---

## 👤 Author
**Julio Andrés Rubio Echeverría**  
*Analytics & Machine Learning Engineer*  
* [LinkedIn](https://www.linkedin.com/in/juliorubio-data/)
* [GitHub](https://github.com/JulioRubio6767)
