USE `extra_joins`;

# 1. Obtener los artistas que han actuado en una o más películas.
SELECT DISTINCT a.nombre, a.apellido
FROM artista a
INNER JOIN artista_x_pelicula axp 
ON a.id = axp.artista_id;

# 2. Obtener las películas donde han participado más de un artista según nuestra base de datos.
SELECT p.titulo, COUNT(axp.artista_id) AS cantidad_artistas
FROM pelicula p
INNER JOIN artista_x_pelicula axp 
ON p.id = axp.pelicula_id
GROUP BY p.id, p.titulo
HAVING cantidad_artistas > 1;

# 3. Obtener aquellos artistas que han actuado en alguna película, incluso aquellos que aún no lo han hecho, según nuestra base de datos.
SELECT a.nombre, a.apellido, p.titulo
FROM artista a
LEFT JOIN artista_x_pelicula axp 
ON a.id = axp.artista_id
LEFT JOIN pelicula p 
ON axp.pelicula_id = p.id;

# 4. Obtener las películas que no se le han asignado artistas en nuestra base de datos.
SELECT p.titulo
FROM pelicula p
LEFT JOIN artista_x_pelicula axp 
ON p.id = axp.pelicula_id
WHERE axp.pelicula_id IS NULL;

# 5. Obtener aquellos artistas que no han actuado en alguna película, según nuestra base de datos.
SELECT a.nombre, a.apellido
FROM artista a
LEFT JOIN artista_x_pelicula axp 
ON a.id = axp.artista_id
WHERE axp.artista_id IS NULL;

# 6. Obtener aquellos artistas que han actuado en dos o más películas según nuestra base de datos.
SELECT a.nombre, a.apellido, COUNT(axp.pelicula_id) AS total_peliculas
FROM artista a
INNER JOIN artista_x_pelicula axp  
ON a.id = axp.artista_id
GROUP BY a.id, a.nombre, a.apellido
HAVING total_peliculas >= 2;

# 7. Obtener aquellas películas que tengan asignado uno o más artistas, incluso aquellas que aún no le han asignado un artista en nuestra base de datos.
SELECT p.titulo, a.nombre, a.apellido
FROM pelicula p
LEFT JOIN artista_x_pelicula axp 
ON p.id = axp.pelicula_id
LEFT JOIN artista a 
ON axp.artista_id = a.id;

