CREATE DATABASE IF NOT EXISTS administracion3
DEFAULT CHARACTER SET utf8  
DEFAULT COLLATE utf8_general_ci;

USE administracion3;

DROP TABLE IF EXISTS libros, editoriales;

 CREATE TABLE libros (
	id INT UNSIGNED AUTO_INCREMENT,
	titulo VARCHAR(40) NOT NULL,
	autor VARCHAR(30) NOT NULL DEFAULT 'Desconocido',
	codigo_editorial TINYINT UNSIGNED NOT NULL,
	precio DECIMAL(5,2) UNSIGNED,
	cantidad SMALLINT UNSIGNED DEFAULT 0,
	PRIMARY KEY (id)
 );

CREATE TABLE editoriales (
	id TINYINT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO editoriales (nombre) VALUES ('Paidos');
INSERT INTO editoriales (nombre) VALUES ('Emece');
INSERT INTO editoriales (nombre) VALUES ('Planeta'); 
INSERT INTO editoriales (nombre) VALUES ('Sudamericana');

INSERT INTO libros (titulo, autor,codigo_editorial,precio,cantidad)
  VALUES ('El Aleph','Borges',3,43.5,200);
INSERT INTO libros (titulo, autor,codigo_editorial,precio,cantidad)
  VALUES ('Alicia en el pais de las maravillas','Lewis Carroll',2,33.5,100);
INSERT INTO libros (titulo, autor,codigo_editorial,precio,cantidad)
  VALUES ('Aprenda PHP','Mario Perez',1,55.8,50);
INSERT INTO libros (titulo, autor,codigo_editorial,precio,cantidad)
  VALUES ('Java en 10 minutos','Juan Lopez',1,88,150);
INSERT INTO libros (titulo, autor,codigo_editorial,precio,cantidad)
  VALUES ('Alicia a traves del espejo','Lewis Carroll',1,15.5,80);
INSERT INTO libros (titulo, autor,codigo_editorial,precio,cantidad)
  VALUES ('Cervantes y el quijote','Borges- Bioy Casares',3,25.5,300);
  
  -- mostrar los titulos y nombres de las editoriales de los libros
  -- incluso de aquellos editoriales que no tienen libros
  
  select editoriales.nombre, libros.titulo 
  from libros right join editoriales
  on editoriales.id = libros.codigo_editorial;
