/* 
Actividad de aprendizaje.
Funciones almacenadas
Temario: A

Curso: Taller II
Catedrático: Jorge Pérez.

	Nombre alumno: Alberto Moises Gerardo Lemus Alvarado
	Carné:	2021062
	Sección: IN5BM
    Grupo: 1
	Fecha: 10/02/2022
    
*/

DROP DATABASE IF EXISTS db_funciones_moises_lemus;
CREATE DATABASE db_funciones_moises_lemus;

USE db_funciones_moises_lemus;

CREATE TABLE resultados (
	id INT AUTO_INCREMENT NOT NULL,
    area DECIMAL(10,2),
    impares VARCHAR(45),
    menor INT,
    PRIMARY KEY pk_funciones_Id (id)
);

-- INSTRUCCIONES:

-- 1. Crear un procedimiento almacenado para insertar registros en la tabla Resultados

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio1_create $$
CREATE PROCEDURE sp_ejercicio1_create(
	IN _id INT,
    IN _area DECIMAL(10,2),
    IN _impares VARCHAR(45),
    IN _menor INT
)
BEGIN
	INSERT INTO resultados(
		id,
		area,
		impares,
		menor
    )
    VALUES(
		_id,
        _area,
        _impares,
        _menor
    );
END $$
DELIMITER ;


-- 2. Crear una función para calcular el área de un triangulo.

DELIMITER $$
DROP FUNCTION IF EXISTS fn_area_triangulo $$
CREATE FUNCTION fn_area_triangulo(
	base INT, 
	altura INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA DETERMINISTIC
BEGIN 
	DECLARE area DECIMAL;
    SET area = base*altura/2;
    RETURN area;
END $$
DELIMITER ;

SELECT fn_area_triangulo(5,15);

-- 3. Crear una función que acumule en una variable todos los números impares del 1 al N.

DELIMITER $$
DROP FUNCTION IF EXISTS fn_numeros_impares1 $$
CREATE FUNCTION fn_numeros_impares1(limite INT)
RETURNS VARCHAR(255)
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE i INT;
    DECLARE resultado VARCHAR(255) DEFAULT " ";
    SET i=0;
   miCiclo:REPEAT
		SET i=i+1;
		IF i % 2=0 THEN
			ITERATE miCiclo;
		END IF;
		SET resultado=CONCAT(resultado,i, " | ");
		UNTIL i=limite
    END REPEAT miCiclo;
    SET resultado=CONCAT(resultado);
    RETURN resultado;
END $$
DELIMITER ;

SELECT fn_numeros_impares1(9)

-- ---------------------------------------------------------------------------------

DELIMITER $$
DROP FUNCTION IF EXISTS fn_numeros_impares2 $$
CREATE FUNCTION fn_numeros_impares2(limite INT)
RETURNS VARCHAR(255)
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE acumulador VARCHAR(45) DEFAULT " ";
    DECLARE contador INT DEFAULT 0;
    
    REPEAT
		SET contador = contador +1;
        IF contador % 2 != 0 THEN
			SET acumulador = CONCAT(acumulador, contador, " | ");
		END IF;
		UNTIL contador = limite
	END REPEAT;
    RETURN acumulador;
END $$
DELIMITER ;

SELECT fn_numeros_impares2(10)

-- 4. Crear una función para calcular el número menor de 4 números enteros.

DELIMITER $$
DROP FUNCTION IF EXISTS fn_numero_menor $$
CREATE FUNCTION fn_numero_menor(
	num1 INT, 
    num2 INT, 
    num3 INT, 
    num4 INT
)
RETURNS INT
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE menor, resultado INT;
    SET menor=0;
     IF num1 < num2 THEN
		SET menor = num1;
	ELSEIF num2<num3 THEN
		SET menor=num2;
	ELSEIF num3<num4 THEN
		SET menor=num3;
	ELSE
		SET menor=num4;
    END IF;
    SET resultado= menor;
    RETURN resultado;
END $$
DELIMITER ;

SELECT fn_numero_menor(5,2,8,4);


-- 5. Llamar al procedimiento almacenado creado anteriormente para insertar el resultado de las funciones en la tabla Resultados

CALL sp_ejercicio1_create(1,fn_area_triangulo(10,21),fn_numeros_impares1(7), fn_numero_menor(5,2,8,4) );

-- 6. Crear un procedimiento almacenado que muestre los datos ingresados

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio6_read $$
CREATE PROCEDURE sp_ejercicio6_read()
BEGIN
	SELECT
		id,
		area,
		impares,
		menor
	FROM 
		resultados;
END $$
DELIMITER ;

CALL sp_ejercicio6_read();

-- -----------------------------------------------------------------------------------

DELIMITER $$
DROP FUNCTION IF EXISTS fn_numero_menor_2 $$
CREATE FUNCTION fn_numero_menor_2(
	num1 INT, 
    num2 INT, 
    num3 INT, 
    num4 INT
)
RETURNS INT
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE menor, resultado INT;
	IF num1 < num2 AND num1 < num3 AND num1 < num4 THEN
		SET menor = num1;
	ELSEIF num2 < num1 AND num2 < num3 AND num2 < num4 THEN
		SET menor = num2;
	ELSEIF num3 < num1 AND num3 < num2 AND num3 < num4 THEN
		SET menor = num3;
	ELSE 
		SET menor = num4;
	END IF;
    SET resultado = menor;
    RETURN resultado;
END $$
DELIMITER ;

SELECT fn_numero_menor_2(18,17,16,15);



















