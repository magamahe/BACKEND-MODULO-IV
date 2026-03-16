-- CREAR BD
CREATE SCHEMA universolector;
-- USO BD
USE universolector;

-- SOCIO
CREATE TABLE socio (
codigo INT PRIMARY KEY,
dni INT,
apellido VARCHAR(50),
nombre VARCHAR(50),
direccion VARCHAR(100),
localidad VARCHAR(50));

-- SOCIOxTELEFONO
 CREATE TABLE socioxtelefono (
 codigo INT PRIMARY KEY,
 nroytelefono VARCHAR(100),
 codigosocio INT,
 FOREIGN KEY (codigosocio) REFERENCES socio(codigo));
 

 -- AUTOR
 CREATE TABLE autor (
 codigo INT PRIMARY KEY,
 apellido VARCHAR(50),
 nombre VARCHAR(50));
 
 -- EDITORIAL
 CREATE TABLE editorial (
 codigo INT PRIMARY KEY,
 razon_social VARCHAR(100),
 telefono VARCHAR(100));
 
 -- LIBRO
 CREATE TABLE libro (
 codigo INT PRIMARY KEY,
 ISBN VARCHAR(13),
 titulo VARCHAR(200),
 anio_escritura DATE,
 codigo_autor INT,
 anio_edicion DATE,
 codigo_editorial INT,
 FOREIGN KEY (codigo_autor) REFERENCES autor (codigo),
 FOREIGN KEY (codigo_editorial) REFERENCES editorial(codigo));
 
 -- VOLUMEN
 CREATE TABLE volumen (
 codigo INT PRIMARY KEY,
 codigo_libro INT,
 deteriorado BOOLEAN,
 FOREIGN KEY (codigo_libro) REFERENCES libro(codigo));
 
 DROP TABLE `universolector`.`volumen`;
 
 -- PRESTAMO
  CREATE TABLE prestamo (
 codigo INT PRIMARY KEY,
 codigo_socio INT,
 fecha DATETIME,
 fecha_devolucion DATE,
 fecha_tope DATE,
 FOREIGN KEY (codigo_socio) REFERENCES socio(codigo));
 
 -- PRESTAMOxVOLUMEN
 CREATE TABLE prestamoxvolumen (
 codigo INT PRIMARY KEY,
 codigo_prestamo INT,
 codigo_volumen INT,
 FOREIGN KEY (codigo_prestamo) REFERENCES prestamo(codigo),
 FOREIGN KEY (codigo_volumen) REFERENCES volumen(codigo));
 
-- INSERT--
-- SOCIO
INSERT INTO socio  VALUES
(2, 2988800,  'WILLIAMS', 'LINDA', '23 Workhaven Lane', 'Alberta'),
(1, 3000000,  'JOHNSON', 'PATRICIA','28 MySQL Boulevard', 'QLD'),

(3, 2500000,  'JONES', 'BARBARA','1411 Lillydale Drive', 'QLD'),
(4, 32980002,  'BUTLER', 'LOIS', '1688 Okara Way', 'Northwest Border'),
(5, 2313909,  'HAYES', 'ROBIN', '262 A Corua (La Coru Dhaka', 'Dhaka');
 
 SELECT * FROM socio
 DELETE FROM socio
 WHERE codigo = 2;
 
-- AUTOR
INSERT INTO autor  VALUES
(1, 'García', 'Mario'),
(2, 'Pérez', 'Lucía'),
(3, 'Smith', 'John'),
(4, 'Martínez', 'Ana'),
(5, 'Khan', 'Aisha');

-- EDITORIAL
INSERT INTO editorial VALUES
(1, 'Editorial Alfa', '5411-4567890'),
(2, 'Ediciones Beta', '5411-1234567'),
(3, 'Gamma Books', '5411-9876543'),
(4, 'Delta Publishing', '5411-1122334'),
(5, 'Omega Editorial', '5411-5566778');

-- LIBRO
INSERT INTO libro 
(codigo, ISBN, titulo, anio_escritura, codigo_autor, anio_edicion, codigo_editorial) VALUES
(1, '9780306406157', 'El universo en expansión', '1980-05-12', 1, '1981-03-20', 1),
(2, '9780679783275', 'La sombra del viento', '2001-02-15', 2, '2002-06-10', 2),
(3, '9780140449136', 'Crónicas de un lector', '1995-09-01', 3, '1996-01-25', 1),
(4, '9780061120084', 'El eco de las palabras', '2010-11-30', 4, '2011-04-18', 3),
(5, '9788497592208', 'Memorias de papel', '1987-07-07', 5, '1988-09-14', 2);

-- VOLUMEN
INSERT INTO volumen VALUES
(1, 1, FALSE),
(2, 2, TRUE),
(3, 3, FALSE),
(4, 4, FALSE),
(5, 5, TRUE);

-- PRESTAMO
INSERT INTO prestamo  VALUES
(1, 1, '2025-01-10 14:30:00', '2025-01-20', '2025-01-25'),
(3, 3, '2025-03-12 16:45:00', '2025-03-22', '2025-03-27'),
(4, 4, '2025-04-01 09:15:00', '2025-04-11', '2025-04-16'),
(5, 5, '2025-05-18 18:00:00', '2025-05-28', '2025-06-02');

-- PRESTAMOXVOLUMEN
INSERT INTO prestamoxvolumen  VALUES
(1, 1, 1),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

SELECT *FROM prestamo;

DELETE FROM volumen
WHERE codigo = 1;

SELECT * FROM socio;

UPDATE socio
SET direccion ="Monroe 860"
WHERE codigo = 3;
