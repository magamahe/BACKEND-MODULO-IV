-- =====================================
-- BORRAR Y CREAR BASE
-- =====================================
DROP DATABASE IF EXISTS spotifydb;
CREATE DATABASE spotifydb;
USE spotifydb;

-- =====================================
-- TABLA USUARIO
-- =====================================
CREATE TABLE usuario (
 id INT PRIMARY KEY AUTO_INCREMENT,
 email VARCHAR(100) NOT NULL,
 password VARCHAR(100) NOT NULL,
 fecha_nac DATE,
 sexo VARCHAR(10),
 cod_postal VARCHAR(10),
 pais VARCHAR(50),
 fecha_mod_password DATE
);

-- =====================================
-- TABLA ARTISTA
-- =====================================
CREATE TABLE artista (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(100) NOT NULL,
 imagen VARCHAR(255)
);

-- =====================================
-- TABLA DISCOGRAFICA
-- =====================================
CREATE TABLE discografica (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(100) NOT NULL,
 pais VARCHAR(50)
);

-- =====================================
-- TABLA ALBUM
-- =====================================
CREATE TABLE album (
 id INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(100) NOT NULL,
 anio YEAR,
 portada VARCHAR(255),
 id_artista INT,
 id_discografica INT,
 FOREIGN KEY (id_artista) REFERENCES artista(id),
 FOREIGN KEY (id_discografica) REFERENCES discografica(id)
);

-- =====================================
-- TABLA CANCION
-- =====================================
CREATE TABLE cancion (
 id INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(100) NOT NULL,
 duracion INT,
 reproducciones INT DEFAULT 0,
 likes INT DEFAULT 0,
 id_album INT,
 FOREIGN KEY (id_album) REFERENCES album(id)
);

-- =====================================
-- TABLA GENERO
-- =====================================
CREATE TABLE genero (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL
);

-- =====================================
-- TABLA CANCION_GENERO
-- =====================================
CREATE TABLE cancion_genero (
 id INT PRIMARY KEY AUTO_INCREMENT,
 id_cancion INT,
 id_genero INT,
 FOREIGN KEY (id_cancion) REFERENCES cancion(id),
 FOREIGN KEY (id_genero) REFERENCES genero(id)
);

-- =====================================
-- TABLA PLAYLIST
-- =====================================
CREATE TABLE playlist (
 id INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(100) NOT NULL,
 fecha_creacion DATE,
 eliminada BOOLEAN DEFAULT FALSE,
 fecha_eliminacion DATE,
 id_usuario INT,
 FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- =====================================
-- TABLA PLAYLIST_CANCION
-- =====================================
CREATE TABLE playlist_cancion (
 id INT PRIMARY KEY AUTO_INCREMENT,
 id_playlist INT,
 id_cancion INT,
 FOREIGN KEY (id_playlist) REFERENCES playlist(id),
 FOREIGN KEY (id_cancion) REFERENCES cancion(id)
);

-- =====================================
-- USUARIOS
-- =====================================
INSERT INTO usuario VALUES
(1,'ana@gmail.com','1234','1995-05-10','F','7600','Chile','2026-01-01'),
(2,'juan@gmail.com','abcd','1990-03-22','M','28001','España','2026-01-10'),
(3,'lisa@gmail.com','pass','2000-07-15','F','7600','Brasil','2026-02-01');

-- =====================================
-- ARTISTAS
-- =====================================
INSERT INTO artista VALUES
(1,'Coldplay','coldplay.jpg'),
(2,'Taylor Swift','taylor.jpg'),
(3,'Imagine Dragons','imagine.jpg');

-- =====================================
-- DISCOGRAFICAS
-- =====================================
INSERT INTO discografica VALUES
(1,'Sony Music','USA'),
(2,'Universal Music','UK'),
(3,'Warner Music','USA');

-- =====================================
-- ALBUMES
-- =====================================
INSERT INTO album VALUES
(1,'Parachutes',2000,'para.jpg',1,1),
(2,'1989',2014,'1989.jpg',2,2),
(3,'Evolve',2017,'evolve.jpg',3,3);

-- =====================================
-- CANCIONES
-- =====================================
INSERT INTO cancion VALUES
(1,'Yellow',260,500000,300000,1),
(2,'Blank Space',240,800000,500000,2),
(3,'Believer',210,900000,600000,3),
(4,'Magic',230,400000,250000,1),
(5,'Style',220,600000,450000,2),
(6,'Monster',210,700000,480000,3);

-- =====================================
-- GENEROS
-- =====================================
INSERT INTO genero VALUES
(1,'Pop'),
(2,'Rock'),
(3,'Alternative');

-- =====================================
-- CANCION GENERO
-- =====================================
INSERT INTO cancion_genero VALUES
(1,1,2),
(2,2,1),
(3,3,3),
(4,4,1),
(5,4,2),
(6,5,1),
(7,6,1),
(8,6,2);

-- =====================================
-- PLAYLIST
-- =====================================
INSERT INTO playlist VALUES
(1,'Favoritas','2026-02-01',FALSE,NULL,1),
(2,'Gym Mix','2026-02-02',FALSE,NULL,2),
(3,'Relax','2026-02-03',TRUE,'2026-02-10',3),
(4,'Top Hits','2026-03-01',FALSE,NULL,1),
(5,'Rock Mix','2026-03-02',FALSE,NULL,2);

-- =====================================
-- PLAYLIST CANCION
-- =====================================
INSERT INTO playlist_cancion VALUES
(1,1,1),
(2,1,2),
(3,2,3),
(4,2,1),
(5,3,1),
(6,4,4),
(7,4,5),
(8,5,4);