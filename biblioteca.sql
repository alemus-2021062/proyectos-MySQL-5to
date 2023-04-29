
-- Alberto Moisés Gerardo Lemus Alvarado 
-- IN5BM
-- Grupo 1/2

CREATE DATABASE IF NOT EXISTS biblioteca 
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

USE biblioteca;

DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS socios;
DROP TABLE IF EXISTS temas;
DROP TABLE IF EXISTS editoriales;
DROP TABLE IF EXISTS autores;
DROP TABLE IF EXISTS actualizaciones_libros;

CREATE TABLE autores (
	id_autor INT NOT NULL AUTO_INCREMENT,
	nombre_autor VARCHAR(60) NOT NULL,
	PRIMARY KEY (id_autor)
);

CREATE TABLE editoriales (
	id_editorial INT NOT NULL AUTO_INCREMENT,
	nombre_editorial VARCHAR(30) NOT NULL,
	direccion VARCHAR (100) NOT NULL,
	telefono VARCHAR (15) NOT NULL, 
 	PRIMARY KEY (id_editorial)
);

CREATE TABLE temas (
	id_tema INT NOT NULL AUTO_INCREMENT,
	nombre_tema VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_tema)
);

CREATE TABLE socios (
	id_socio INT NOT NULL AUTO_INCREMENT,
	nombre_completo VARCHAR(60) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	correo VARCHAR(25) NULL DEFAULT 'Sin correo',
	telefono VARCHAR(15) NOT NULL,
	foto VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_socio)
);

CREATE TABLE libros (
	id_libro INT NOT NULL AUTO_INCREMENT,
	isbn VARCHAR(20) NOT NULL UNIQUE,
	titulo VARCHAR(65) NOT NULL,
	numero_ejemplar TINYINT NOT NULL,
	autor_id INT NOT NULL,
	editorial_id INT NOT NULL,
	tema_id INT NOT NULL,
	PRIMARY KEY (id_libro),
	FOREIGN KEY (autor_id) REFERENCES autores (id_autor) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (editorial_id) REFERENCES editoriales (id_editorial) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (tema_id) REFERENCES temas (id_tema) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE prestamos (
	id_prestamo INT NOT NULL AUTO_INCREMENT,
	fecha_prestamo DATE NOT NULL,
	fecha_entrega DATE NOT NULL,
	socio_id INT NOT NULL,
	libro_id INT NOT NULL,
	PRIMARY KEY (id_prestamo),
	FOREIGN KEY (socio_id) REFERENCES socios (id_socio) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (libro_id) REFERENCES libros (id_libro) ON DELETE CASCADE ON UPDATE CASCADE
);

 CREATE TABLE actualizaciones_libros (
	isbn_anterior VARCHAR(20) NOT NULL,
	titulo_anterior VARCHAR(65) NOT NULL,
	numero_ejemplar_anterior TINYINT NOT NULL,
	isbn_nuevo VARCHAR(20) NOT NULL,
	titulo_nuevo VARCHAR(65) NOT NULL,
	numero_ejemplar_nuevo TINYINT NOT NULL,
	usuario VARCHAR(15) NOT NULL,
	fecha_modificacion DATETIME NOT NULL
);

INSERT INTO autores VALUES (NULL, "Fernando López Segura");
INSERT INTO autores VALUES (NULL, "Eduardo Cruz Ruiz");
INSERT INTO autores VALUES (NULL, "Lilian Valecia Carrillo");
INSERT INTO autores VALUES (NULL, "Juan Carlos Segundo Elias");
INSERT INTO autores VALUES (NULL, "Jair Cuellar Artega");
INSERT INTO autores VALUES (NULL, "Karla Rojas García");
INSERT INTO autores VALUES (NULL, "ke ffhg fff");

INSERT INTO editoriales VALUES (NULL, "Trillas", "AV. 20 DE NOVIEMBRE #61 Col. Centro", "23456789");
INSERT INTO editoriales VALUES (NULL, "Pearson", "AV. INDEPENDENCIA #956 COL. PIRAGUA", "56565655");
INSERT INTO editoriales VALUES (NULL, "McGrawHill", "AV. 5 DE MAYO #67 COL. TUXTEPEC", "32222224");
INSERT INTO editoriales VALUES (NULL, "AlfaOmega", "BLVD. BENITO JUAREZ #78 COL. TUXTEPEC", "87876887");
INSERT INTO editoriales VALUES (NULL, "Thomsomp", "ADOLFO LOPEZ MATEOS #12 COL. TUXTEPEC", "12345678");
INSERT INTO editoriales VALUES (NULL, "Libertad", "AV. MANCILLA ESQ. ALDAMA COL. LAZARO CARDENAS", "98654332");

INSERT INTO temas VALUES (NULL, "Programación");
INSERT INTO temas VALUES (NULL, "Biología");
INSERT INTO temas VALUES (NULL, "Economía / Marketing");
INSERT INTO temas VALUES (NULL, "Administración de empresas");
INSERT INTO temas VALUES (NULL, "Química");
INSERT INTO temas VALUES (NULL, "Ingeniería");

INSERT INTO socios VALUES (NULL, "Alfredo Hernández Mendoza", "Dirección 1", "alfred123@gmail.com", "12345678", 'foto_1.png');
INSERT INTO socios VALUES (NULL, "Juan Alberto Ramírez Sandoval", "Dirección 2", "juanal_66@hotmail.com", "91847567", 'foto_2.png');
INSERT INTO socios VALUES (NULL, "Enrique Alberto García Aguado", "Dirección 3", "", "22885534", 'foto_3.png');
INSERT INTO socios VALUES (NULL, "Esmeralda López Cabrera", "Dirección 4", "esme27_p@yahoo.com.mx", "45263489", 'foto_4.png');
INSERT INTO socios VALUES (NULL, "Janeth Soto Cruz", "Dirección 5", "janeth11@hotmail.com", "64829164", 'foto_5.png');
INSERT INTO socios VALUES (NULL, "Marco Antonio Pérez Díaz", "Dirección 6", "makr@gmail.com", "88335522", 'foto_6.png');

INSERT INTO libros VALUES (NULL, "1234567891", "El Lengu de Prgramación C", 27, 1, 4, 1);
INSERT INTO libros VALUES (NULL, "1357935799", "Fundamentos de Programación", 12, 1, 6, 1);
INSERT INTO libros VALUES (NULL, "1010345655", "The Book of Ruby", 9, 1, 5, 1);
INSERT INTO libros VALUES (NULL, "3456789212", "Programación en C/C++", 25, 1, 3, 1);
INSERT INTO libros VALUES (NULL, "7578799145", "Introducción a la teoría general de la administración", 45, 6, 2, 4);
INSERT INTO libros VALUES (NULL, "3238845533", "Administración Moderna", 12, 6, 1, 4);
INSERT INTO libros VALUES (NULL, "5267174899", "Generación de Modelos de Negocio", 16, 6, 1, 4);
INSERT INTO libros VALUES (NULL, "2456789011", "Fundamentos de Administración Financiera", 99, 6, 1, 4);
INSERT INTO libros VALUES (NULL, "3454565890", "Invitación a la Biología", 11, 3, 1, 2);
INSERT INTO libros VALUES (NULL, "2224579900", "Biología molecular de la célula", 14, 3, 1, 2);
INSERT INTO libros VALUES (NULL, "0988277777", "Biología: ciencia y naturaleza", 22, 3, 1, 2);
INSERT INTO libros VALUES (NULL, "6372653847", "Atlas de Biología", 1, 3, 1, 2);
INSERT INTO libros VALUES (NULL, "9823525255", "Sistemass de Control para Ingeniería", 5, 4, 1, 6);
INSERT INTO libros VALUES (NULL, "2324611234", "Circuitos Eléctricos", 10, 4, 1, 6);
INSERT INTO libros VALUES (NULL, "7774828288", "Sismas de Comunicaciones", 7, 4, 1, 6);
INSERT INTO libros VALUES (NULL, "2343454577", "Química General", 2, 5, 1, 5);
INSERT INTO libros VALUES (NULL, "5568883333", "Química Orgánica", 3, 5, 1, 5);
INSERT INTO libros VALUES (NULL, "1111166988", "Principios de Economía", 1, 2, 1, 3);
INSERT INTO libros VALUES (NULL, "0044523255", "La riqueza de las naciones", 4, 2, 1, 3);
INSERT INTO libros VALUES (NULL, "5767676722", "Economía y Sociedad", 17, 2, 1, 3);
INSERT INTO libros VALUES (NULL, "3235567986", "Marketi de Guerra", 1, 2, 1, 3);
INSERT INTO libros VALUES (NULL, "32358667986", "sdsdsadsa", 1, 2, 1, 3);

INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-25", 1, 6);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-24", 4, 4);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-27", 5, 1);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-01-14", 1, 2);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-25", 3, 3);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-25", 1, 5);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-31", 4, 3);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-12-28", 5, 19);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-02-20", 4, 5);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-02-21", 1, 12);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-25", 1, 15);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-24", 4, 4);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-27", 5, 1);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-01-14", 1, 7);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-25", 3, 8);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-25", 1, 9);
INSERT INTO prestamos VALUES (NULL, NOW(), "2016-12-31", 4, 10);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-12-28", 5, 11);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-02-20", 4, 18);
INSERT INTO prestamos VALUES (NULL, NOW(), "2017-02-21", 1, 20);

UPDATE libros SET titulo = "El Lenguaje de Programación C" WHERE id_libro = 1;
UPDATE libros SET titulo = "Sistemass de Comunicaciones" WHERE id_libro = 15;
UPDATE libros SET titulo = "Marketing de Guerra" WHERE id_libro = 21;

DELETE FROM autores WHERE id_autor = 7;
DELETE FROM libros WHERE id_libro = 22;