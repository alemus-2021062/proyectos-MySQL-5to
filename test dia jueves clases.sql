/* Alberto Moisés Gerardo Lemus Alvarado
2021062
IN5BM
grupo 1
*/
USE test;

-- crear un procedimiento almacenado que reciba dos numeros y decir si son iguales o no
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio1 $$
CREATE PROCEDURE sp_ejercicio1(IN numero1 INT, IN numero2 INT)
BEGIN
IF numero1=numero2 THEN
	SELECT "Son iguales" AS resultado;
ELSE
	SELECT "No son iguales" AS resultado;
END IF;
END $$
DELIMITER ;
CALL sp_ejercicio1(2,5);

-- crear un procedimiento almacenado que reciba dos numeros (dos parametros) y decir cual es el mayor 

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio2 $$
CREATE PROCEDURE sp_ejercicio2(IN numero1 INT, IN numero2 INT)
BEGIN
IF numero1=numero2 THEN
	SELECT "Los numeros son iguales";
ELSEIF numero1<numero2 THEN
	SELECT "El segundo numero es mayor" AS resultado;
ELSE 
	SELECT "El primer numero es mayor";
END IF;
END $$
DELIMITER ;

CALL sp_ejercicio2(2,1);

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio3 $$
CREATE PROCEDURE sp_ejercicio3(IN _forma_pago VARCHAR(45))
BEGIN
	DECLARE forma_pago ENUM("efectivo","con tarjeta","transferencia");
    SET forma_pago = _forma_pago;
    CASE forma_pago
	WHEN "efectivo" THEN
		SELECT "la forma de pago es efectivo";
	WHEN "con tarjeta" THEN
		SELECT "forma de pago tarjeta";
	ELSE
		SELECT "la forma de pago es transferencia";
END CASE;
    
END $$
DELIMITER ;

CALL sp_ejercicio3("con tarjeta");

/*
Crear un procedimiento almacenado que reciba un numero del 1 al 3
y muestre los valores "efectivo", "con tarjeta", "transferencia"
segun corresponda utilizando un ENUM y la estructura CASE.
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio4 $$
CREATE PROCEDURE sp_ejercicio4(IN _forma_pago INT)
BEGIN
	DECLARE forma_pago ENUM("efectivo","con tarjeta","transferencia");
    SET forma_pago = _forma_pago;
    CASE forma_pago
	WHEN "efectivo" THEN
		SELECT "la forma de pago es efectivo" AS resultado;
	WHEN "con tarjeta" THEN
		SELECT "forma de pago tarjeta" AS resultado;
	ELSE
		SELECT "la forma de pago es transferencia" AS resultado;
END CASE;
    
END $$
DELIMITER ;

CALL sp_ejercicio4(1);

/*
pedir una nota numerica entre 0 y 10 y mostrar dicha nota de la forma: cero, uno, dos
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio5 $$
CREATE PROCEDURE sp_ejercicio5(IN nota_numerica INT)
BEGIN
    CASE nota_numerica
		WHEN 0 THEN
			SELECT "cero" AS resultado;
		WHEN 1 THEN
			SELECT "uno" AS resultado;
		WHEN 2 THEN
			SELECT "dos" AS resultado;
		WHEN 3 THEN
			SELECT "tres" AS resultado;
		WHEN 4 THEN
			SELECT "cuatro" AS resultado;
		WHEN 5 THEN
			SELECT "cinco" AS resultado;
		WHEN 6 THEN
			SELECT "seis" AS resultado;
		WHEN 7 THEN
			SELECT "siete" AS resultado;
		WHEN 8 THEN
			SELECT "ocho" AS resultado;
		WHEN 9 THEN
			SELECT "nueve" AS resultado;
		WHEN 10 THEN
			SELECT "diez" AS resultado;
		ELSE
			SELECT "valor no valido" AS resultado;
	END CASE;
    
END $$
DELIMITER ;

CALL sp_ejercicio5(5);

-- comandos LOOP, LEAVE e ITERATE

-- ejercicio con LOOP

/*
Contador
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio6 $$
CREATE PROCEDURE sp_ejercicio6()
BEGIN
	DECLARE i TINYINT UNSIGNED;
	SET i = 0;
    
	miBucle: LOOP
    
    SET i = i +1;
	SELECT "El valor de i es: " + i AS i;
    
    IF i = 4 THEN
		LEAVE miBucle;
    END IF;
    END LOOP miBucle;
	
	
END $$
DELIMITER ;

CALL sp_ejercicio6()


DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio7 $$
CREATE PROCEDURE sp_ejercicio7()
BEGIN
	DECLARE i TINYINT UNSIGNED;
	SET i = 0;
    
	miBucle: LOOP
    
    SET i = i +1;
    
    IF i =3 THEN
		ITERATE mibucle;
	END IF;
    SELECT "El valor de i es: " + i AS i;
    IF i = 4 THEN
		LEAVE miBucle;
    END IF;
    END LOOP miBucle;
	
	
END $$
DELIMITER ;

CALL sp_ejercicio7()

/*
crear un procedimiento almacenado que reciba dos parametros 
correspondiente al valor inicial y final de una serie de numeros
que debe mostrar en pantalla a expresion de los numeros pares

*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio8 $$
CREATE PROCEDURE sp_ejercicio8(IN numero_inicial INT, IN numero_final INT)
BEGIN
	DECLARE i TINYINT UNSIGNED;
	SET i = numero_inicial;
    
	miBucle: LOOP
	SET i = i +1;
    IF i % 2=0 THEN
		ITERATE mibucle;
	END IF;
    
    
    SELECT "El valor de i es: " + i AS i;
    
    IF i = numero_final THEN
		LEAVE miBucle;
    END IF;
    END LOOP miBucle;

END $$
DELIMITER ;

CALL sp_ejercicio8(3,11);

-- REPEAT UNTIL similar al DO WHILE 

/*
EJEMPLO REPEAT UNTIL
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio9 $$
CREATE PROCEDURE sp_ejercicio9()
BEGIN
	DECLARE i TINYINT UNSIGNED;
    SET i=0;
	miCiclo:REPEAT
		SET i=i+1;
		SELECT i AS contador;
		UNTIL i = 4
    
    END REPEAT miCiclo;
END $$
DELIMITER ;

CALL sp_ejercicio9();



DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio10 $$
CREATE PROCEDURE sp_ejercicio10(IN numero1 INT, IN numero2 INT)
BEGIN
	DECLARE i TINYINT UNSIGNED;
    SET i=numero1;
	miCiclo:REPEAT
    
       IF i%2=0 THEN
		SELECT i AS contador;
	END IF;
    
    SET i = i+ 1;
    
    UNTIL i = numero2 + 1
    
    END REPEAT miCiclo;
END $$
DELIMITER ;

CALL sp_ejercicio10(3,12);
