USE test

/*Mostrar la palabra "joven si la edad es menor o igual a 30 años"*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_condicional1 $$
CREATE PROCEDURE sp_condicional1(IN edad INT)
BEGIN 
	IF edad <= 30 THEN 
		SELECT "Joven" AS resultado;
	ELSE 
		SELECT "Adulto" AS resultado;
	END IF;
END $$
DELIMITER ;

CALL sp_condicional1(20);

/* Mostrar "niño" si la edad es menor o igual a 12 años 
Joven si es menor o igual a 30 y 
si no de lo contrario mostrara adulto*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_condicional12 $$
CREATE PROCEDURE sp_condicional2(IN edad INT)
BEGIN 
	IF edad <=12 THEN
		SELECT "niño" AS resultado;
	ELSEIF edad <=30 THEN
		SELECT "Joven" AS resultado;
	ELSE 
		SELECT "Adulto" AS resultado;
	END IF;
END $$
DELIMITER ;

CALL sp_condicional2(15);











