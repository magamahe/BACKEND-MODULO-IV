use movies_db

# 1. Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT s.title AS TituloSerie, g.name AS Genero
FROM series s
JOIN genres g 
ON s.genre_id = g.id;

# 2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT 
e.title AS Episodio,
a.first_name AS Nombre,
a.last_name AS Apellido
FROM episodes e
JOIN actor_episode ae 
ON e.id = ae.episode_id
JOIN actors a 
ON ae.actor_id = a.id;

# 3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
SELECT DISTINCT
a.first_name AS Nombre,
a.last_name AS Apellido
FROM actor_movie ma 
JOIN actors a
ON a.id = ma.actor_id
JOIN movies m 
ON ma.movie_id = m.id
WHERE m.title LIKE 'La Guerra de las galaxias%';

# 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT 
g.name AS Genero,
COUNT(*) AS CantidadPeliculas
FROM movies m
JOIN genres g
ON m.genre_id = g.id
GROUP BY g.name;

