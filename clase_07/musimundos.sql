# 1. Listar las canciones cuya duración sea mayor a 2 minutos. (2 minutos = 120.000 milisegundos)
SELECT Nombre, Milisegundos
FROM Canciones
WHERE Milisegundos > 120000;

# 2. Listar las canciones cuyo nombre comience con una vocal.
SELECT Nombre
FROM Canciones
WHERE Nombre LIKE 'A%'
   OR Nombre LIKE 'E%'
   OR Nombre LIKE 'I%'
   OR Nombre LIKE 'O%'
   OR Nombre LIKE 'U%';

# 3. Listar las canciones ordenadas por compositor en forma descendente. 
# Luego, por nombre en forma ascendente. Incluir únicamente aquellas canciones que tengan compositor.
SELECT Nombre, Compositor
FROM Canciones
WHERE Compositor IS NOT NULL
ORDER BY Compositor DESC, Nombre ASC;

# 4. 
	# a) Listar la cantidad de canciones de cada compositor.
		SELECT Compositor, COUNT(*) AS CantidadCanciones
		FROM Canciones
		GROUP BY Compositor;
        
        #excluye compositores vacios que no son NULL
        SELECT Compositor, COUNT(*) AS CantidadCanciones
		FROM Canciones
		WHERE TRIM(Compositor) <> ''
		GROUP BY Compositor;
              
	# b) Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
		SELECT Compositor, COUNT(*) AS CantidadCanciones
		FROM Canciones
		WHERE TRIM(Compositor) <> ''
		GROUP BY Compositor
		HAVING COUNT(*) > 10;
# 5. 
	# a) Listar el total facturado agrupado por ciudad.
		SELECT ciudad_de_facturacion, SUM(total) AS TotalFacturado
		FROM Facturas
		GROUP BY ciudad_de_facturacion;
	
    # b) Modificar el listado del punto (a) mostrando únicamente las ciudad de Canadá.
		SELECT ciudad_de_facturacion, SUM(total) AS TotalFacturado
		FROM Facturas
		WHERE pais_de_facturacion = 'Canada'
		GROUP BY ciudad_de_facturacion;
        
	# c) Modificar el listado del punto (a) mostrando únicamente las ciudad con una facturación mayor a 38.
		SELECT ciudad_de_facturacion, SUM(total) AS TotalFacturado
		FROM Facturas
		GROUP BY ciudad_de_facturacion
		HAVING SUM(Total) > 38;
    # d) Modificar el listado del punto (a) agrupando la facturación por país, luego por ciudad.
		SELECT pais_de_facturacion, ciudad_de_facturacion, SUM(total) AS TotalFacturado
		FROM Facturas
		GROUP BY pais_de_facturacion, ciudad_de_facturacion
		ORDER BY pais_de_facturacion, ciudad_de_facturacion;
# 6. 
	# a) Listar la duración mínima, máxima y promedio de las canciones.
		SELECT 
		MIN(Milisegundos) AS DuracionMinima,
		MAX(Milisegundos) AS DuracionMaxima,
		AVG(Milisegundos) AS DuracionPromedio
		FROM Canciones;
        
	# b) Modificar el punto (a) mostrando la información agrupada por género.
		SELECT 
		g.Nombre AS Genero,
		MIN(c.Milisegundos) AS DuracionMinima,
		MAX(c.Milisegundos) AS DuracionMaxima,
		AVG(c.Milisegundos) AS DuracionPromedio
		FROM Canciones c
		JOIN Generos g ON c.id_genero = g.id
		GROUP BY g.nombre;
