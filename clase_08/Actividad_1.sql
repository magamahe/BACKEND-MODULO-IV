SELECT f.FacturaID AS IDFactura, f.FechaFactura AS FechaFactura, m.Compania AS Correo, c.Contacto AS NombreCliente, p.ProductoNombre AS NombreProducto,
ca.CategoriaNombre AS Categoria, p.PrecioUnitario AS PrecioUnitario, p.UnidadesPedidas AS Cantidad  
FROM facturas f
INNER JOIN clientes c 
ON f.ClienteID=c.ClienteID
INNER JOIN correos m
ON m.CorreoID=f.EnvioVia
INNER JOIN facturadetalle fd
ON f.FacturaID=fd.FacturaID
INNER JOIN productos p
ON p.ProductoID=fd.ProductoID
INNER JOIN categorias ca
ON ca.CategoriaID=p.CategoriaID;

SELECT c.CategoriaNombre AS Categoria, p.ProductoNombre AS Producto, p.PrecioUnitario AS PrecioUnitario
FROM categorias c
LEFT JOIN productos p 
ON c.CategoriaID=p.CategoriaID;

SELECT c.contacto AS Contacto, f.FacturaID AS Factura
FROM clientes c
LEFT JOIN facturas f
ON c.ClienteID=f.ClienteID
WHERE f.ClienteID IS NULL;

SELECT pd.ProductoNombre AS ProductoNombre, pv.Contacto AS Contacto, c.CategoriaNombre AS Nombre
FROM productos pd
LEFT JOIN proveedores pv
ON pd.ProveedorID=pv.ProveedorID
INNER JOIN categorias c
ON pd.CategoriaID=c.CategoriaID;

SELECT ca.CategoriaNombre, AVG (p.PrecioUnitario) AS Promedio
FROM categorias ca
INNER JOIN productos p
ON ca.categoriaID=p.categoriaID
GROUP BY ca.categoriaNombre;

SELECT c.Contacto AS Cliente, MAX(f.FechaFactura)
FROM clientes c
LEFT JOIN facturas f
ON c.ClienteID=f.ClienteID
GROUP BY c.Contacto;

SELECT c.Compania AS Correo, COUNT(f.FacturaID) AS CantidadFactura
FROM facturas f
RIGHT JOIN correos c
ON f.EnvioVia=c.CorreoID
GROUP BY c.Compania;