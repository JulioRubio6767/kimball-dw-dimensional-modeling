# 🏛️ Data Warehouse Empresarial: Modelado Dimensional Kimball y Pipeline ETL

🌐 **Idiomas / Languages:** [🇪🇸 Versión en Español](README.es.md) | [🇬🇧 English Version](README.md)

![SQL](https://img.shields.io/badge/SQL-Transact--SQL%20%7C%20PostgreSQL%20%7C%20SQLite-blue?logo=postgresql)
![Python](https://img.shields.io/badge/Python-ETL%20%26%20Pandas-yellow?logo=python)
![Arquitectura](https://img.shields.io/badge/Arquitectura-Esquema%20en%20Estrella%20(Kimball)-success)
![Jupyter](https://img.shields.io/badge/Notebooks-EDA%20%26%20Limpieza%20de%20Datos-orange?logo=jupyter)

Proyecto completo de nivel empresarial que implementa la metodología de **Modelado Dimensional de Ralph Kimball (Esquema en Estrella)**, análisis exploratorio de datos (EDA) y pipelines automatizados de extracción, transformación y carga (ETL).

---

## 📌 Arquitectura y Principios de Diseño

El propósito de este proyecto es desacoplar los datos operativos transaccionales (OLTP) hacia un esquema analítico optimizado (OLAP) de alto rendimiento para la toma de decisiones gerenciales.

```
[Datos Operativos / Ficheros Planos]
                ⬇️
   [EDA & Perfilado de Datos] (eda_final_entregable.ipynb)
                ⬇️
    [Pipeline ETL en Python] (etl_warehouse.ipynb)
                ⬇️
[Data Warehouse en Esquema Estrella] (modelo_kimball.sql)
       ├── Tablas de Hechos (Métricas del Negocio y Transacciones)
       └── Tablas de Dimensiones (Contexto: Tiempo, Ubicación, Establecimiento)
```

---

## 🔍 Aspectos Clave del Modelo (`modelo_kimball.sql`)

* **Tablas de Hechos (`FACT_TRANSACTIONS / FACT_LICENCIAS`):**
  * Registros a nivel de granularidad transaccional vinculados mediante claves foráneas subrogadas (*surrogate keys*).
  * Métricas de negocio aditivas y semiaditivas (tasas, superficie, aforo, tiempos operativos).
* **Dimensiones Conformadas:**
  * `DIM_TIEMPO`: Jerarquía temporal analítica (Año, Trimestre, Mes, Día de la semana, EsFinDeSemana).
  * `DIM_UBICACION`: Atributos geoespaciales (Distrito, Barrio, Código Postal, Coordenadas).
  * `DIM_ESTABLECIMIENTO`: Perfilado categórico de actividades comerciales y estado operativo.
* **Integridad e Indexación:** Definición rigurosa de claves primarias y foráneas, generación de claves artificiales (surrogate keys) e índices no agrupados para optimizar consultas agregadas.

---

## 📂 Contenido del Repositorio

* `modelo_kimball.sql`: Scripts DDL completos con la creación de tablas, definición de tipos, restricciones de integridad referencial e índices.
* `eda_final_entregable.ipynb`: Análisis exploratorio exhaustivo, tratamiento de valores nulos, detección de valores atípicos (*outliers*) y perfilado estadístico.
* `etl_warehouse.ipynb`: Pipeline ETL desarrollado en Python (Pandas) para extraer fuentes crudas, limpiar tipos de datos, generar claves subrogadas y cargar las dimensiones y hechos.

---

## 🚀 Cómo Ejecutar el Proyecto

### 1. Creación de la Base de Datos
Ejecuta el script SQL en tu motor relacional preferido (PostgreSQL, SQLite o SQL Server):
```bash
# Ejemplo con PostgreSQL:
psql -U tu_usuario -d warehouse_db -f modelo_kimball.sql
```

### 2. Ejecutar el Pipeline ETL
Abre y ejecuta el notebook de carga:
```bash
jupyter notebook etl_warehouse.ipynb
```

---

## 👤 Autor
**Julio Andrés Rubio Echeverría**  
*Analytics & Machine Learning Engineer*  
* [LinkedIn](https://www.linkedin.com/in/juliorubio-data/)
* [GitHub](https://github.com/JulioRubio6767)
