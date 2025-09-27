-- Script SQL para crear la tabla de usuarios en Supabase (PostgreSQL)
-- Ejecuta este script en el SQL Editor de Supabase

-- Crear la tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    identificacion VARCHAR(50) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    hora_registro TIME NOT NULL,
    zona_horaria VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Crear índice en la columna pais para optimizar consultas de agrupación
CREATE INDEX IF NOT EXISTS idx_pais ON usuarios(pais);

-- Crear índice en la columna fecha_registro para optimizar consultas por fecha
CREATE INDEX IF NOT EXISTS idx_fecha_registro ON usuarios(fecha_registro);

-- Crear índice en la columna identificacion para búsquedas rápidas
CREATE INDEX IF NOT EXISTS idx_identificacion ON usuarios(identificacion);

-- Habilitar RLS (Row Level Security) - opcional pero recomendado
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;

-- Crear política para permitir inserción de datos (ajustar según necesidades de seguridad)
CREATE POLICY "Permitir inserción pública" ON usuarios
    FOR INSERT
    WITH CHECK (true);

-- Crear política para permitir lectura de datos
CREATE POLICY "Permitir lectura pública" ON usuarios
    FOR SELECT
    USING (true);