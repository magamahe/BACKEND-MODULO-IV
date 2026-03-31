use emarket;

# 1) Cálculo de edad
	#a) Crear un SP que muestre apellidos, nombres y edad de cada empleado, debe calcular la edad de los empleados a partir de la fecha de nacimiento y que tengan entre n y n años de edad.

DELIMITER $$

CREATE PROCEDURE sp_empleados_por_edad(
    IN edad_min INT,
    IN edad_max INT
)
BEGIN
    SELECT 
        Apellido,
        Nombre,
        TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE()) AS Edad
    FROM empleados
    WHERE TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE()) 
          BETWEEN edad_min AND edad_max;
END $$

DELIMITER ;

DROP PROCEDURE sp_empleados_por_edad;	
    # b) Ejecutar el SP indicando un rango de edad entre 50 y 60 años de edad.
CALL sp_empleados_por_edad(50, 60);

# 2) Actualización de productos
	# a) Crear un SP que reciba un porcentaje y un nombre de categoría y actualice los productos pertenecientes a esa categoría, incrementando las unidades pedidas según el porcentaje indicado. Por ejemplo: si un producto de la categoría Seafoodtiene 30 unidades pedidas, al invocar el SP con categoría Seafoody porcentaje 10%, el SP actualizará el valor de unidades pedidas con el nuevo valor 33.
	DELIMITER $$

CREATE PROCEDURE sp_actualizar_unidades(
    IN porcentaje INT,
    IN nombre_categoria VARCHAR(15)
)
BEGIN
    UPDATE productos p
    JOIN categorias c ON p.CategoriaID = c.CategoriaID
    SET p.UnidadesPedidas = p.UnidadesPedidas + (p.UnidadesPedidas * porcentaje / 100)
    WHERE c.CategoriaNombre = CONVERT(nombre_categoria USING utf8mb3) COLLATE utf8mb3_general_ci;
END $$

DELIMITER ;


DROP PROCEDURE sp_actualizar_unidades;
select * from categorias;
CALL sp_actualizar_unidades(30, "Condiments");

    # b) Listar los productos de la categoría Beverages para ver cuántas unidades pedidas hay de cada uno de ellos.
    SELECT p.ProductoNombre, p.UnidadesPedidas
	FROM productos p
	JOIN categorias c ON p.CategoriaID = c.CategoriaID
	WHERE c.CategoriaNombre = 'Beverages';
	
    # c) Invocar al SP con los valores Beveragescomo categoría y 15 como porcentaje.
    CALL sp_actualizar_unidades(15, 'Beverages');
	# d) Volver a listar los productos como en (a), y validar los resultados.
    SELECT p.ProductoNombre, p.UnidadesPedidas 
	FROM productos p
	JOIN categorias c ON p.CategoriaID = c.CategoriaID
	WHERE c.CategoriaNombre = 'Beverages';

SHOW FULL COLUMNS FROM categorias;
# 3) Actualización de empleados
	# a) Crear un SP que cree una tabla con los nombres, apellidos y teléfono de contacto de todos los empleados que hayan sido contratados 
    #con fecha anterior a una fecha dada.
	DROP PROCEDURE IF EXISTS sp_empleados_antiguos;

DELIMITER $$

CREATE PROCEDURE sp_empleados_antiguos( IN fecha_limite DATE)
BEGIN
    -- Borra la tabla si ya existe (para poder recrearla)
    DROP TABLE IF EXISTS empleados_antiguos;

    -- Crea la tabla con los datos filtrados
    CREATE TABLE empleados_antiguos AS
    SELECT 
        Nombre, Apellido, Telefono
    FROM empleados
    WHERE FechaContratacion < fecha_limite;
END $$

DELIMITER ;
    # b) Ejecutar el SP para generar una tabla de empleados con fecha de contratación anterior a 01/01/1994.
    CALL sp_empleados_antiguos('1994-01-01');
	# c) Consultar la tabla generada y validar los resultados
    SELECT * FROM empleados_antiguos;

