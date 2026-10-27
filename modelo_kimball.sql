-- =========================================================================
-- SCRIPT DE MODELADO FÍSICO: DATA WAREHOUSE (METODOLOGÍA KIMBALL)
-- Motor destino: SQLite / SQL Server
-- Descripción: Modelo dimensional en Estrella (Star Schema) para análisis
--              de Terrazas y Licencias Locales (Actividad 1 - UNIR).
-- Autor: Julio
-- =========================================================================

-- 1. DROP DE TABLAS PREVIAS (Para mantener idempotencia en la ejecución)
DROP TABLE IF EXISTS Fact_Terrazas;
DROP TABLE IF EXISTS Dim_Situacion;
DROP TABLE IF EXISTS Dim_Ubicacion;

-- =========================================================================
-- 2. CREACIÓN DE TABLAS DE DIMENSIÓN (CATÁLOGOS)
-- =========================================================================

-- DIMENSIÓN: Ubicación (Normalización de los barrios y distritos)
CREATE TABLE Dim_Ubicacion (
    ID_Ubicacion INTEGER PRIMARY KEY AUTOINCREMENT, -- Surrogate Key
    desc_distrito_local VARCHAR(100) NOT NULL,
    desc_barrio_local VARCHAR(100) NOT NULL
);

-- DIMENSIÓN: Situación de Licencia (Catálogo de estados legales)
CREATE TABLE Dim_Situacion (
    ID_Situacion INTEGER PRIMARY KEY AUTOINCREMENT, -- Surrogate Key
    desc_tipo_licencia VARCHAR(150) NOT NULL,
    desc_tipo_situacion_licencia VARCHAR(50) NOT NULL
);

-- Inserción de "Miembro Desconocido" (Técnica Kimball para valores huérfanos)
INSERT INTO Dim_Situacion (ID_Situacion, desc_tipo_licencia, desc_tipo_situacion_licencia)
VALUES (-1, 'Sin Licencia Registrada', 'N/A');

-- =========================================================================
-- 3. CREACIÓN DE LA TABLA DE HECHOS (FACT TABLE)
-- =========================================================================

-- TABLA DE HECHOS: Terrazas (Métricas de superficie y cruces transaccionales)
CREATE TABLE Fact_Terrazas (
    id_terraza INTEGER PRIMARY KEY,           -- LLave Degenerada (ID original)
    id_local INTEGER NOT NULL,                -- ID de negocio (Local comercial)
    ID_Ubicacion INTEGER NOT NULL,            -- FK a Dimensión Ubicación
    ID_Situacion INTEGER NOT NULL DEFAULT -1, -- FK a Dimensión Situación (Por defecto -1 si es huérfana)
    Superficie_ES DECIMAL(10,2) DEFAULT 0.0,  -- Medida cuantitativa (Superficie 1)
    Superficie_RA DECIMAL(10,2) DEFAULT 0.0,  -- Medida cuantitativa (Superficie 2)
    Superficie_TO DECIMAL(10,2) DEFAULT 0.0,  -- Medida derivada (Superficie Total)
    
    -- Restricciones de integridad referencial
    FOREIGN KEY (ID_Ubicacion) REFERENCES Dim_Ubicacion(ID_Ubicacion)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Situacion) REFERENCES Dim_Situacion(ID_Situacion)
        ON DELETE SET DEFAULT ON UPDATE CASCADE
);

-- =========================================================================
-- FIN DEL SCRIPT
-- =========================================================================
