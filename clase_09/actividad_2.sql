# SPOTIFY
use spotifydb;

# 1. Mostrar la cantidad de canciones que pertenecen a ambos géneros pop y rock cuyo nombre contiene la letra “m”.

SELECT COUNT(DISTINCT c.id) AS cantidad_canciones
FROM cancion c
JOIN cancion_genero cg ON c.id = cg.id_cancion
JOIN genero g ON cg.id_genero = g.id
WHERE (g.nombre = 'Pop' OR g.nombre = 'Rock')
AND c.titulo LIKE '%m%';

# 2. Listar todas las canciones que pertenezcan a más de una playlist. Incluir en el listado el nombre de la canción, el código y 
# a cuántas playlists pertenecen.
SELECT c.id, c.titulo, COUNT(pc.id_playlist) AS cantidad_playlists
FROM cancion c
JOIN playlist_cancion pc ON c.id = pc.id_cancion
GROUP BY c.id, c.titulo
HAVING COUNT(pc.id_playlist) > 1;

# 3. Generar un reporte con el nombre del artista y el nombre de la canción que no pertenecen a ninguna lista, 
# ordenados alfabéticamente por el nombre del artista.
SELECT a.nombre AS artista, c.titulo AS cancion
FROM cancion c
JOIN album al ON c.id_album = al.id
JOIN artista a ON al.id_artista = a.id
LEFT JOIN playlist_cancion pc ON c.id = pc.id_cancion
WHERE pc.id_cancion IS NULL
ORDER BY a.nombre;

# 4. Modificar el país de todos los usuarios con el código postal “7600” a “Argentina”.
SELECT * FROM usuario;
# Error Code 1175 en MySQL significa que está activado Safe Update Mode. Para poder hacerlo.
SET SQL_SAFE_UPDATES = 0;

UPDATE usuario
SET pais = 'Argentina'
WHERE cod_postal = '7600';

# 5. Listar todos los álbumes que tengan alguna canción que posea más de un género.
SELECT DISTINCT al.titulo
FROM album al
JOIN cancion c ON al.id = c.id_album
JOIN cancion_genero cg ON c.id = cg.id_cancion
GROUP BY al.id, al.titulo, c.id
HAVING COUNT(cg.id_genero) > 1;

# 6. Crear un índice agrupado para las canciones cuyo identificador sea el ID.
CREATE INDEX idx_cancion_id
ON cancion(id);

SHOW INDEX FROM cancion;

