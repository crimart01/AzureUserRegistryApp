-- Script SQL para crear tabla de países y modificar tabla usuarios
-- Ejecuta este script en el SQL Editor de Supabase DESPUÉS del script database_setup.sql

-- Crear tabla de países
CREATE TABLE IF NOT EXISTS paises (
    id SERIAL PRIMARY KEY,
    codigo_iso2 VARCHAR(2) UNIQUE,
    codigo_iso3 VARCHAR(3) UNIQUE,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    nombre_ingles VARCHAR(100),
    continente VARCHAR(50),
    activo BOOLEAN DEFAULT true,
    orden INT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Crear índices para optimizar búsquedas
CREATE INDEX IF NOT EXISTS idx_paises_nombre ON paises(nombre);
CREATE INDEX IF NOT EXISTS idx_paises_activo ON paises(activo);
CREATE INDEX IF NOT EXISTS idx_paises_orden ON paises(orden);

-- Habilitar RLS (Row Level Security)
ALTER TABLE paises ENABLE ROW LEVEL SECURITY;

-- Crear política para permitir lectura pública de países
CREATE POLICY "Permitir lectura pública de países" ON paises
    FOR SELECT
    USING (true);

-- Insertar todos los países
INSERT INTO paises (codigo_iso2, codigo_iso3, nombre, nombre_ingles, continente, orden) VALUES
('AF', 'AFG', 'Afganistán', 'Afghanistan', 'Asia', 1),
('AL', 'ALB', 'Albania', 'Albania', 'Europa', 2),
('DE', 'DEU', 'Alemania', 'Germany', 'Europa', 3),
('AD', 'AND', 'Andorra', 'Andorra', 'Europa', 4),
('AO', 'AGO', 'Angola', 'Angola', 'África', 5),
('AG', 'ATG', 'Antigua y Barbuda', 'Antigua and Barbuda', 'América', 6),
('SA', 'SAU', 'Arabia Saudita', 'Saudi Arabia', 'Asia', 7),
('DZ', 'DZA', 'Argelia', 'Algeria', 'África', 8),
('AR', 'ARG', 'Argentina', 'Argentina', 'América', 9),
('AM', 'ARM', 'Armenia', 'Armenia', 'Asia', 10),
('AU', 'AUS', 'Australia', 'Australia', 'Oceanía', 11),
('AT', 'AUT', 'Austria', 'Austria', 'Europa', 12),
('AZ', 'AZE', 'Azerbaiyán', 'Azerbaijan', 'Asia', 13),
('BS', 'BHS', 'Bahamas', 'Bahamas', 'América', 14),
('BD', 'BGD', 'Bangladés', 'Bangladesh', 'Asia', 15),
('BB', 'BRB', 'Barbados', 'Barbados', 'América', 16),
('BH', 'BHR', 'Baréin', 'Bahrain', 'Asia', 17),
('BE', 'BEL', 'Bélgica', 'Belgium', 'Europa', 18),
('BZ', 'BLZ', 'Belice', 'Belize', 'América', 19),
('BJ', 'BEN', 'Benín', 'Benin', 'África', 20),
('BY', 'BLR', 'Bielorrusia', 'Belarus', 'Europa', 21),
('MM', 'MMR', 'Birmania', 'Myanmar', 'Asia', 22),
('BO', 'BOL', 'Bolivia', 'Bolivia', 'América', 23),
('BA', 'BIH', 'Bosnia y Herzegovina', 'Bosnia and Herzegovina', 'Europa', 24),
('BW', 'BWA', 'Botsuana', 'Botswana', 'África', 25),
('BR', 'BRA', 'Brasil', 'Brazil', 'América', 26),
('BN', 'BRN', 'Brunéi', 'Brunei', 'Asia', 27),
('BG', 'BGR', 'Bulgaria', 'Bulgaria', 'Europa', 28),
('BF', 'BFA', 'Burkina Faso', 'Burkina Faso', 'África', 29),
('BI', 'BDI', 'Burundi', 'Burundi', 'África', 30),
('BT', 'BTN', 'Bután', 'Bhutan', 'Asia', 31),
('CV', 'CPV', 'Cabo Verde', 'Cape Verde', 'África', 32),
('KH', 'KHM', 'Camboya', 'Cambodia', 'Asia', 33),
('CM', 'CMR', 'Camerún', 'Cameroon', 'África', 34),
('CA', 'CAN', 'Canadá', 'Canada', 'América', 35),
('QA', 'QAT', 'Catar', 'Qatar', 'Asia', 36),
('TD', 'TCD', 'Chad', 'Chad', 'África', 37),
('CL', 'CHL', 'Chile', 'Chile', 'América', 38),
('CN', 'CHN', 'China', 'China', 'Asia', 39),
('CY', 'CYP', 'Chipre', 'Cyprus', 'Europa', 40),
('VA', 'VAT', 'Ciudad del Vaticano', 'Vatican City', 'Europa', 41),
('CO', 'COL', 'Colombia', 'Colombia', 'América', 42),
('KM', 'COM', 'Comoras', 'Comoros', 'África', 43),
('KP', 'PRK', 'Corea del Norte', 'North Korea', 'Asia', 44),
('KR', 'KOR', 'Corea del Sur', 'South Korea', 'Asia', 45),
('CI', 'CIV', 'Costa de Marfil', 'Ivory Coast', 'África', 46),
('CR', 'CRI', 'Costa Rica', 'Costa Rica', 'América', 47),
('HR', 'HRV', 'Croacia', 'Croatia', 'Europa', 48),
('CU', 'CUB', 'Cuba', 'Cuba', 'América', 49),
('DK', 'DNK', 'Dinamarca', 'Denmark', 'Europa', 50),
('DM', 'DMA', 'Dominica', 'Dominica', 'América', 51),
('EC', 'ECU', 'Ecuador', 'Ecuador', 'América', 52),
('EG', 'EGY', 'Egipto', 'Egypt', 'África', 53),
('SV', 'SLV', 'El Salvador', 'El Salvador', 'América', 54),
('AE', 'ARE', 'Emiratos Árabes Unidos', 'United Arab Emirates', 'Asia', 55),
('ER', 'ERI', 'Eritrea', 'Eritrea', 'África', 56),
('SK', 'SVK', 'Eslovaquia', 'Slovakia', 'Europa', 57),
('SI', 'SVN', 'Eslovenia', 'Slovenia', 'Europa', 58),
('ES', 'ESP', 'España', 'Spain', 'Europa', 59),
('US', 'USA', 'Estados Unidos', 'United States', 'América', 60),
('EE', 'EST', 'Estonia', 'Estonia', 'Europa', 61),
('ET', 'ETH', 'Etiopía', 'Ethiopia', 'África', 62),
('PH', 'PHL', 'Filipinas', 'Philippines', 'Asia', 63),
('FI', 'FIN', 'Finlandia', 'Finland', 'Europa', 64),
('FJ', 'FJI', 'Fiyi', 'Fiji', 'Oceanía', 65),
('FR', 'FRA', 'Francia', 'France', 'Europa', 66),
('GA', 'GAB', 'Gabón', 'Gabon', 'África', 67),
('GM', 'GMB', 'Gambia', 'Gambia', 'África', 68),
('GE', 'GEO', 'Georgia', 'Georgia', 'Asia', 69),
('GH', 'GHA', 'Ghana', 'Ghana', 'África', 70),
('GD', 'GRD', 'Granada', 'Grenada', 'América', 71),
('GR', 'GRC', 'Grecia', 'Greece', 'Europa', 72),
('GT', 'GTM', 'Guatemala', 'Guatemala', 'América', 73),
('GN', 'GIN', 'Guinea', 'Guinea', 'África', 74),
('GQ', 'GNQ', 'Guinea Ecuatorial', 'Equatorial Guinea', 'África', 75),
('GW', 'GNB', 'Guinea-Bisáu', 'Guinea-Bissau', 'África', 76),
('GY', 'GUY', 'Guyana', 'Guyana', 'América', 77),
('HT', 'HTI', 'Haití', 'Haiti', 'América', 78),
('HN', 'HND', 'Honduras', 'Honduras', 'América', 79),
('HU', 'HUN', 'Hungría', 'Hungary', 'Europa', 80),
('IN', 'IND', 'India', 'India', 'Asia', 81),
('ID', 'IDN', 'Indonesia', 'Indonesia', 'Asia', 82),
('IQ', 'IRQ', 'Irak', 'Iraq', 'Asia', 83),
('IR', 'IRN', 'Irán', 'Iran', 'Asia', 84),
('IE', 'IRL', 'Irlanda', 'Ireland', 'Europa', 85),
('IS', 'ISL', 'Islandia', 'Iceland', 'Europa', 86),
('MH', 'MHL', 'Islas Marshall', 'Marshall Islands', 'Oceanía', 87),
('SB', 'SLB', 'Islas Salomón', 'Solomon Islands', 'Oceanía', 88),
('IL', 'ISR', 'Israel', 'Israel', 'Asia', 89),
('IT', 'ITA', 'Italia', 'Italy', 'Europa', 90),
('JM', 'JAM', 'Jamaica', 'Jamaica', 'América', 91),
('JP', 'JPN', 'Japón', 'Japan', 'Asia', 92),
('JO', 'JOR', 'Jordania', 'Jordan', 'Asia', 93),
('KZ', 'KAZ', 'Kazajistán', 'Kazakhstan', 'Asia', 94),
('KE', 'KEN', 'Kenia', 'Kenya', 'África', 95),
('KG', 'KGZ', 'Kirguistán', 'Kyrgyzstan', 'Asia', 96),
('KI', 'KIR', 'Kiribati', 'Kiribati', 'Oceanía', 97),
('KW', 'KWT', 'Kuwait', 'Kuwait', 'Asia', 98),
('LA', 'LAO', 'Laos', 'Laos', 'Asia', 99),
('LS', 'LSO', 'Lesoto', 'Lesotho', 'África', 100),
('LV', 'LVA', 'Letonia', 'Latvia', 'Europa', 101),
('LB', 'LBN', 'Líbano', 'Lebanon', 'Asia', 102),
('LR', 'LBR', 'Liberia', 'Liberia', 'África', 103),
('LY', 'LBY', 'Libia', 'Libya', 'África', 104),
('LI', 'LIE', 'Liechtenstein', 'Liechtenstein', 'Europa', 105),
('LT', 'LTU', 'Lituania', 'Lithuania', 'Europa', 106),
('LU', 'LUX', 'Luxemburgo', 'Luxembourg', 'Europa', 107),
('MK', 'MKD', 'Macedonia del Norte', 'North Macedonia', 'Europa', 108),
('MG', 'MDG', 'Madagascar', 'Madagascar', 'África', 109),
('MY', 'MYS', 'Malasia', 'Malaysia', 'Asia', 110),
('MW', 'MWI', 'Malaui', 'Malawi', 'África', 111),
('MV', 'MDV', 'Maldivas', 'Maldives', 'Asia', 112),
('ML', 'MLI', 'Malí', 'Mali', 'África', 113),
('MT', 'MLT', 'Malta', 'Malta', 'Europa', 114),
('MA', 'MAR', 'Marruecos', 'Morocco', 'África', 115),
('MU', 'MUS', 'Mauricio', 'Mauritius', 'África', 116),
('MR', 'MRT', 'Mauritania', 'Mauritania', 'África', 117),
('MX', 'MEX', 'México', 'Mexico', 'América', 118),
('FM', 'FSM', 'Micronesia', 'Micronesia', 'Oceanía', 119),
('MD', 'MDA', 'Moldavia', 'Moldova', 'Europa', 120),
('MC', 'MCO', 'Mónaco', 'Monaco', 'Europa', 121),
('MN', 'MNG', 'Mongolia', 'Mongolia', 'Asia', 122),
('ME', 'MNE', 'Montenegro', 'Montenegro', 'Europa', 123),
('MZ', 'MOZ', 'Mozambique', 'Mozambique', 'África', 124),
('NA', 'NAM', 'Namibia', 'Namibia', 'África', 125),
('NR', 'NRU', 'Nauru', 'Nauru', 'Oceanía', 126),
('NP', 'NPL', 'Nepal', 'Nepal', 'Asia', 127),
('NI', 'NIC', 'Nicaragua', 'Nicaragua', 'América', 128),
('NE', 'NER', 'Níger', 'Niger', 'África', 129),
('NG', 'NGA', 'Nigeria', 'Nigeria', 'África', 130),
('NO', 'NOR', 'Noruega', 'Norway', 'Europa', 131),
('NZ', 'NZL', 'Nueva Zelanda', 'New Zealand', 'Oceanía', 132),
('OM', 'OMN', 'Omán', 'Oman', 'Asia', 133),
('NL', 'NLD', 'Países Bajos', 'Netherlands', 'Europa', 134),
('PK', 'PAK', 'Pakistán', 'Pakistan', 'Asia', 135),
('PW', 'PLW', 'Palaos', 'Palau', 'Oceanía', 136),
('PS', 'PSE', 'Palestina', 'Palestine', 'Asia', 137),
('PA', 'PAN', 'Panamá', 'Panama', 'América', 138),
('PG', 'PNG', 'Papúa Nueva Guinea', 'Papua New Guinea', 'Oceanía', 139),
('PY', 'PRY', 'Paraguay', 'Paraguay', 'América', 140),
('PE', 'PER', 'Perú', 'Peru', 'América', 141),
('PL', 'POL', 'Polonia', 'Poland', 'Europa', 142),
('PT', 'PRT', 'Portugal', 'Portugal', 'Europa', 143),
('GB', 'GBR', 'Reino Unido', 'United Kingdom', 'Europa', 144),
('CF', 'CAF', 'República Centroafricana', 'Central African Republic', 'África', 145),
('CZ', 'CZE', 'República Checa', 'Czech Republic', 'Europa', 146),
('CG', 'COG', 'República del Congo', 'Republic of the Congo', 'África', 147),
('CD', 'COD', 'República Democrática del Congo', 'Democratic Republic of the Congo', 'África', 148),
('DO', 'DOM', 'República Dominicana', 'Dominican Republic', 'América', 149),
('RW', 'RWA', 'Ruanda', 'Rwanda', 'África', 150),
('RO', 'ROU', 'Rumania', 'Romania', 'Europa', 151),
('RU', 'RUS', 'Rusia', 'Russia', 'Europa', 152),
('WS', 'WSM', 'Samoa', 'Samoa', 'Oceanía', 153),
('KN', 'KNA', 'San Cristóbal y Nieves', 'Saint Kitts and Nevis', 'América', 154),
('SM', 'SMR', 'San Marino', 'San Marino', 'Europa', 155),
('VC', 'VCT', 'San Vicente y las Granadinas', 'Saint Vincent and the Grenadines', 'América', 156),
('LC', 'LCA', 'Santa Lucía', 'Saint Lucia', 'América', 157),
('ST', 'STP', 'Santo Tomé y Príncipe', 'Sao Tome and Principe', 'África', 158),
('SN', 'SEN', 'Senegal', 'Senegal', 'África', 159),
('RS', 'SRB', 'Serbia', 'Serbia', 'Europa', 160),
('SC', 'SYC', 'Seychelles', 'Seychelles', 'África', 161),
('SL', 'SLE', 'Sierra Leona', 'Sierra Leone', 'África', 162),
('SG', 'SGP', 'Singapur', 'Singapore', 'Asia', 163),
('SY', 'SYR', 'Siria', 'Syria', 'Asia', 164),
('SO', 'SOM', 'Somalia', 'Somalia', 'África', 165),
('LK', 'LKA', 'Sri Lanka', 'Sri Lanka', 'Asia', 166),
('SZ', 'SWZ', 'Suazilandia', 'Eswatini', 'África', 167),
('ZA', 'ZAF', 'Sudáfrica', 'South Africa', 'África', 168),
('SD', 'SDN', 'Sudán', 'Sudan', 'África', 169),
('SS', 'SSD', 'Sudán del Sur', 'South Sudan', 'África', 170),
('SE', 'SWE', 'Suecia', 'Sweden', 'Europa', 171),
('CH', 'CHE', 'Suiza', 'Switzerland', 'Europa', 172),
('SR', 'SUR', 'Surinam', 'Suriname', 'América', 173),
('TH', 'THA', 'Tailandia', 'Thailand', 'Asia', 174),
('TZ', 'TZA', 'Tanzania', 'Tanzania', 'África', 175),
('TJ', 'TJK', 'Tayikistán', 'Tajikistan', 'Asia', 176),
('TL', 'TLS', 'Timor Oriental', 'East Timor', 'Asia', 177),
('TG', 'TGO', 'Togo', 'Togo', 'África', 178),
('TO', 'TON', 'Tonga', 'Tonga', 'Oceanía', 179),
('TT', 'TTO', 'Trinidad y Tobago', 'Trinidad and Tobago', 'América', 180),
('TN', 'TUN', 'Túnez', 'Tunisia', 'África', 181),
('TM', 'TKM', 'Turkmenistán', 'Turkmenistan', 'Asia', 182),
('TR', 'TUR', 'Turquía', 'Turkey', 'Asia', 183),
('TV', 'TUV', 'Tuvalu', 'Tuvalu', 'Oceanía', 184),
('UA', 'UKR', 'Ucrania', 'Ukraine', 'Europa', 185),
('UG', 'UGA', 'Uganda', 'Uganda', 'África', 186),
('UY', 'URY', 'Uruguay', 'Uruguay', 'América', 187),
('UZ', 'UZB', 'Uzbekistán', 'Uzbekistan', 'Asia', 188),
('VU', 'VUT', 'Vanuatu', 'Vanuatu', 'Oceanía', 189),
('VE', 'VEN', 'Venezuela', 'Venezuela', 'América', 190),
('VN', 'VNM', 'Vietnam', 'Vietnam', 'Asia', 191),
('YE', 'YEM', 'Yemen', 'Yemen', 'Asia', 192),
('DJ', 'DJI', 'Yibuti', 'Djibouti', 'África', 193),
('ZM', 'ZMB', 'Zambia', 'Zambia', 'África', 194),
('ZW', 'ZWE', 'Zimbabue', 'Zimbabwe', 'África', 195)
ON CONFLICT (nombre) DO NOTHING;

-- Modificar tabla usuarios para agregar FK a países
-- Primero, agregar la columna pais_id si no existe
ALTER TABLE usuarios ADD COLUMN IF NOT EXISTS pais_id INTEGER;

-- Actualizar registros existentes con el ID del país basado en el nombre
UPDATE usuarios u
SET pais_id = p.id
FROM paises p
WHERE u.pais = p.nombre;

-- Crear la foreign key
ALTER TABLE usuarios
ADD CONSTRAINT fk_usuarios_pais
FOREIGN KEY (pais_id)
REFERENCES paises(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Crear índice en la columna pais_id para mejorar performance
CREATE INDEX IF NOT EXISTS idx_usuarios_pais_id ON usuarios(pais_id);

-- OPCIONAL: Una vez migrados los datos, podrías eliminar la columna pais antigua
-- ALTER TABLE usuarios DROP COLUMN pais;
-- Pero es recomendable mantenerla por compatibilidad temporal