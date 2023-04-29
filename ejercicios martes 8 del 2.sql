/* Alberto Moisés Gerardo Lemus Alvarado
2021062
IN5BM
grupo 1
*/
USE test 

/*
ejemplo siclo while 
mostrar los numeros del 1 al 5
utilizando el ciclo while
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejemplo_while $$
CREATE PROCEDURE sp_ejemplo_while()
BEGIN
	DECLARE i TINYINT UNSIGNED;
    SET i = 0;
    WHILE i < 5 DO 
		SET i=i+1;
        SELECT i;
    END WHILE;
    
END $$
DELIMITER ;

CALL sp_ejemplo_while();

-- FUNCIONES

/*
Ejemplo 1
Hacer una funcion que permita multiplicar dos numeros
*/

DELIMITER $$
DROP FUNCTION IF EXISTS fn_multiplicar $$
CREATE FUNCTION fn_multiplicar(numero1 INT, numero2 INT)
RETURNS INT
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE resultado INT DEFAULT 0;
    SET resultado=numero1*numero2;
	RETURN resultado;
END $$
DELIMITER ;
SET @result = fn_multiplicar(2,6);
SELECT @result;

/*
EJERCICIO 2
CREAR una funcion que calcule el area de un circulo 
recibira los valores necesarios para calcular el area
y debe devolver un numero real, mostrar el resultado en pantalla
*/

DELIMITER $$
DROP FUNCTION IF EXISTS fn_circulo $$
CREATE FUNCTION fn_circulo(radio INT)
RETURNS DECIMAL(6,2)
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE area DECIMAL(6,2);
    SET area = pi() * pow(radio,2);
    RETURN area;
END $$
DELIMITER ;

SELECT fn_circulo(5)

/*
EJERCICIO 3
Crear una aplicacion que nos calcule el area de un triangulo
recibira los valores necesarios para calcular area 
este devolvera un numero real
mostrar el resultado en pantalla
*/

DELIMITER $$
DROP FUNCTION IF EXISTS fn_area_triangulo $$
CREATE FUNCTION fn_area_triangulo(base INT, altura INT)
RETURNS DECIMAL(6,2)
READS SQL DATA DETERMINISTIC
BEGIN 
	DECLARE area DECIMAL;
    SET area = base*altura/2;
    RETURN area;
END $$
DELIMITER ;

SELECT fn_area_triangulo(15,15);

/*
EJERCICIO 4
crear una funcion que nos devuelva un numero entero aleatorio
donde pasamos como parametros entre que numero queremos que genere 
muestre este numero por pantalla
*/

DELIMITER $$
DROP FUNCTION IF EXISTS fn_aleatorio $$
CREATE FUNCTION fn_aleatorio(inicial INT, final INT)
RETURNS INT
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = RAND()*(final-inicial)+inicial;
    RETURN resultado;
END $$
DELIMITER ;
SELECT fn_aleatorio(100,500);


/*
EJERCICIO 5
devolver el mayor de N numeros aleatorios
*/

DELIMITER $$
DROP FUNCTION IF EXISTS fn_aleatorio_mayor $$
CREATE FUNCTION fn_aleatorio_mayor(limite INT)
RETURNS VARCHAR(255)
READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE mayor, i, num INT;
    DECLARE resultado VARCHAR(255) DEFAULT " ";
    SET mayor = 0;
    SET i= 0;
    REPEAT
		SET i=i+1;
		SET num=RAND()*100;
        SET resultado=CONCAT(resultado,num," | ");
        IF num > mayor THEN
			SET mayor = num;
		END IF;
		UNTIL i = limite
    END REPEAT;
    SET resultado = CONCAT(resultado, "El mayor es: ", mayor );
    RETURN resultado;
END $$
DELIMITER ;
SELECT fn_aleatorio_mayor(9);
















