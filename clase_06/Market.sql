# Categorías y productos
# 1. Queremos tener un listado de todas las categorías.
SELECT *
FROM Categorias;

# 2. Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombrey Descripcion.
SELECT CategoriaNombre, Descripcion
FROM Categorias;

# 3. Obtener un listado de los productos.
SELECT *
FROM Productos;

# 4. ¿Existen productos discontinuados? (Discontinuado = 1).
SELECT *
FROM Productos
WHERE Discontinuado = 1;

# 5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
SELECT ProductoNombre, ProveedorID
FROM Productos
WHERE ProveedorID = 8;

# 6. Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT ProductoNombre, PrecioUnitario
FROM Productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

# 7. Se define que un producto hay que solicitarlo al proveedor si sus unidad en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT ProductoNombre, UnidadesEnStock, NivelReorden
FROM Productos
WHERE UnidadesEnStock < NivelReorden;

# 8. Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero
SELECT ProductoNombre, UnidadesEnStock, NivelReorden, UnidadesPedidas
FROM Productos
WHERE UnidadesEnStock < NivelReorden
  AND UnidadesPedidas = 0;
--
# Clientes
# 1. Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT ContactoNombre, CompaniaNombre, ContactoTitulo, Pais
FROM Clientes
ORDER BY Pais;

# 2. Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT ContactoNombre, CompaniaNombre, ContactoTitulo
FROM Clientes
WHERE ContactoTitulo = 'Owner';

# 3. El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT ContactoNombre, CompaniaNombre
FROM Clientes
WHERE ContactoNombre LIKE 'C%';

--

# Facturas
# 1. Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT *
FROM Facturas
ORDER BY FechaFactura ASC;

# 2. Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT *
FROM Facturas
WHERE PaisEnvio = 'USA'
  AND EnvioVia <> 3;
  
# 3. ¿El cliente 'GOURL' realizó algún pedido?
SELECT *
FROM Facturas
WHERE ClienteID = 'GOURL';

# 4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT *
FROM Facturas
WHERE EmpleadoID IN (2, 3, 5, 8, 9);

--

# Productos
# 1. Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
SELECT *
FROM Productos
ORDER BY PrecioUnitario DESC;

# 2. Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
SELECT ProductoNombre, PrecioUnitario
FROM Productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

# 3. Obtener un top 10 de los productos con más unidades en stock.
SELECT ProductoNombre, UnidadesEnStock
FROM Productos
ORDER BY UnidadesEnStock DESC
LIMIT 10;

# FacturaDetalle
# 1. Obtener un listado de FacturaID, Producto, Cantidad.
SELECT FacturaID, ProductoID, Cantidad
FROM FacturaDetalle;

# 2. Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad
FROM FacturaDetalle
ORDER BY Cantidad DESC;

# 3. Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
SELECT FacturaID, ProductoID, Cantidad
FROM FacturaDetalle
WHERE Cantidad BETWEEN 50 AND 100
ORDER BY Cantidad DESC;

# 4. En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura(FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT 
    FacturaID AS NroFactura,
    ProductoID AS Producto,
    (PrecioUnitario * Cantidad) AS Total
FROM FacturaDetalle;

