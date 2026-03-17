use musimundos;
#===================
# Tabla: Clientes
#===================
# 1. Crear un storedprocedureque solicite como parámetros de entrada el nombre de un país y una ciudad, 
# y que devuelva como resultado la información de contacto de todos los clientes de ese país y ciudad. 
# En el caso que el parámetro de ciudad esté vacío, se debe devolver todos los clientes del país indicado.

DELIMITER $$

CREATE PROCEDURE clientes_por_pais_ciudad( IN p_pais VARCHAR(50), IN p_ciudad VARCHAR(50))
BEGIN
    IF p_ciudad = '' THEN
        SELECT id, primer_nombre, apellido, telefono, email, pais, ciudad
        FROM clientes
        WHERE pais = p_pais;
    ELSE
        SELECT id, primer_nombre, apellido, telefono, email, pais, ciudad
        FROM clientes
        WHERE pais = p_pais
        AND ciudad = p_ciudad;
	END IF;

END$$

DELIMITER ;
# BORRAR
DROP PROCEDURE IF EXISTS clientes_por_pais_ciudad;

# 2. Invocar el procedimiento para obtener la información de los clientes de Brasilia en Brazil.
CALL clientes_por_pais_ciudad('Brazil','Brasilia');

# 3. Invocar el procedimiento para obtener la información de todos los clientes de Brazil.
CALL clientes_por_pais_ciudad('Brazil','');

# ===============
# Tabla: Generos
# ===============
#1. Crear un storedprocedure que reciba como parámetro un nombre de género musical y lo inserte en la tabla de géneros. 
# Además, el storedprocedure debe devolver el id de género que se insertó.
# • TIP! Para calcular el nuevo id incluir la siguiente línea dentro del bloque de código del SP: 
# SET nuevoid= (SELECT MAX(id) FROM generos) + 1;

DROP PROCEDURE IF EXISTS insertar_genero;

DELIMITER $$

CREATE PROCEDURE insertar_genero( IN p_nombre VARCHAR(50))

BEGIN
    DECLARE nuevoid INT;
    SET nuevoid = (SELECT MAX(id) FROM generos) + 1;
    INSERT INTO generos (id, nombre)
    VALUES (nuevoid, p_nombre);

    SELECT nuevoid AS id_genero_insertado;

END$$

DELIMITER ;

# 2. Invocar el storedprocedurecreado para insertar el género Funk. ¿Qué id devolvió el SP ? 
# Consultar la tabla de géneros para ver los cambios.
CALL insertar_genero('Funk');
# Devuelve 26

# 3. Repetir el paso anterior insertando esta vez el género Tango.
CALL insertar_genero('Tango');
# devuelve 27

SELECT * 
FROM generos;
