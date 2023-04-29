DROP DATABASE IF EXISTS db_control_estudiante_in5bm;
CREATE DATABASE IF NOT EXISTS db_control_estudiante_in5bm;
USE db_control_estudiante_in5bm;



DROP TABLE IF EXISTS estudiantes;
CREATE TABLE IF NOT EXISTS estudiantes(
    id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    email VARCHAR(60),
    telefono VARCHAR(8),
    saldo DECIMAL(6,2),
    PRIMARY KEY(id)
);



INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Moises Gerardo","Lemus Alvarado","MoisesLemus155@gmail.com","15551515",9999.99);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Josue Benjamin","Hernandez de Leon","Bensio@gmail.com","15624895",184.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Mauricio ","Hernandez","M4u@gmail.com","74859623",654.78);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Jose Miguel","De los Reyes Alvarado","JoseMiguel@gmail.com","45546556",485.50);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Haile","Stainfild","HaileS@gmail.com","45852563",1000.99);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Elizabeth ","Olsen de Lemus","OlsenLemus@gmail.com","99865412",9999.99);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Genesis Abril","Lemus","GAbril","14253685",8456.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Michael Gabriel","Perez Hernandez","MichiPerez@gmail.com","75395146",415.50);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Randy","Martinez Reina","RandyR1@gmail.com","12345678",753.50);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo)
    VALUES("Jenifer","Lawrence","JLawrence@gmail.com","87654321",8752.50);