DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejemplo1 $$
CREATE PROCEDURE sp_ejemplo1()
BEGIN
	SELECT "hola mundo";
END $$
DELIMITER ;

CALL sp_ejemplo1();


DELIMITER $$
CREATE PROCEDURE sp_variables_usuario()
BEGIN
	SET @var1 = @var1*2;
END $$
DELIMITER ;
SET @var1 = 20;

CALL sp_variables_usuario();
SELECT @var1;

/* ---------------------EJERCICIO---------------------
1. crear una varieble de usuario que almacene un texto
2. asignar un nombre a dicha variable ejemplo Juan
3. crear un procedimiento almacenado donde concatenen
   la variable de usuario con el texto "y carolina"
4. Fuera del procedimiento almacenado mostrar el valor de la 
   variable usuario
5. El resultado del ejemplo: Juan y Carolina
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_variable_usuario_ejercicio $$
CREATE PROCEDURE sp_variable_usuario_ejercicio()
BEGIN
	SET @var2 =CONCAT(@var2, " y Carolina");
END $$
DELIMITER ;

SET @var2 = "Juan";
CALL sp_variable_usuario_ejercicio();
SELECT @var2;








