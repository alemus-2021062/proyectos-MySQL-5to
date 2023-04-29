DROP DATABASE IF EXISTS practica_javafx;
CREATE DATABASE practica_javafx
DEFAULT CHARACTER SET utf8;
USE practica_javafx;

DROP TABLE IF EXISTS personajes;
CREATE TABLE personajes(
	llave INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255),
    poder VARCHAR(255),
    nivel_poder INTEGER,
    etico VARCHAR(16),
    PRIMARY KEY (llave)
);

DROP TABLE IF EXISTS aspirantes;
CREATE TABLE aspirantes(
	id INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    edad INTEGER,
    poder VARCHAR(255),
    PRIMARY KEY (id)
);

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_personajes_create $$
CREATE PROCEDURE sp_personajes_create(
	IN _nombre VARCHAR(255),
    IN _poder VARCHAR(255),
    IN _nivel_poder INTEGER,
    IN _etico VARCHAR(16)
)
BEGIN
	INSERT INTO personajes(nombre, poder, nivel_poder, etico)
    VALUES(_nombre, _poder, _nivel_poder, _etico);
END $$
DELIMITER ;

CALL sp_personajes_create("Vengador","Fuerza, volar, rayos bionicos, piel resistente",10,"anti-heroe");
CALL sp_personajes_create("Noctambulo","Fuerza, piel resistente",8,"heroe");
CALL sp_personajes_create("Soldier Boy","Fuerza, rayo quita poderes, piel resistente",10,"anti-heroe");
CALL sp_personajes_create("Queen Mave","Fuerza, piel resistente",10,"heroe");

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_personajes_read $$
CREATE PROCEDURE sp_personajes_read()
BEGIN
	select p.llave, p.nombre, p.poder, p.nivel_poder, p.etico FROM personajes AS p;
END $$
DELIMITER ;
CALL sp_personajes_read();

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_personajes_delete $$
CREATE PROCEDURE sp_personajes_delete(IN _llave INTEGER)
BEGIN
	DELETE FROM personajes WHERE llave = _llave;
END $$
DELIMITER ;
CALL sp_personajes_delete(2);









