
-- Alberto Moisés Gerardo Lemus Alvarado
-- Código ténico: IN5BM
-- Grupo: 1/2


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
	id INT NOT NULL AUTO_INCREMENT,
	nombre_autor VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE editoriales (
	id INT NOT NULL AUTO_INCREMENT,
	nombre_editorial VARCHAR(30) NOT NULL,
	direccion VARCHAR (100) NOT NULL,
	telefono VARCHAR (15) NOT NULL, 
 	PRIMARY KEY (id)
);

CREATE TABLE temas (
	id INT NOT NULL AUTO_INCREMENT,
	nombre_tema VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE socios (
	id INT NOT NULL AUTO_INCREMENT,
	nombre_completo VARCHAR(60) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	correo VARCHAR(25) NULL DEFAULT 'Sin correo',
	telefono VARCHAR(15) NOT NULL,
	foto VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE libros (
	id INT NOT NULL AUTO_INCREMENT,
	isbn VARCHAR(20) NOT NULL UNIQUE,
	titulo VARCHAR(65) NOT NULL,
	numero_ejemplar TINYINT NOT NULL,
	autor_id INT NOT NULL,
	editorial_id INT NOT NULL,
	tema_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (editorial_id) REFERENCES editoriales (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (tema_id) REFERENCES temas (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE prestamos (
	id INT NOT NULL AUTO_INCREMENT,
	fecha_prestamo DATE NOT NULL,
	fecha_entrega DATE NOT NULL,
	socio_id INT NOT NULL,
	libro_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (socio_id) REFERENCES socios (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (libro_id) REFERENCES libros (id) ON DELETE CASCADE ON UPDATE CASCADE
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


USE biblioteca;

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

UPDATE libros SET titulo = "El Lenguaje de Programación C" WHERE id = 1;
UPDATE libros SET titulo = "Sistemass de Comunicaciones" WHERE id = 15;
UPDATE libros SET titulo = "Marketing de Guerra" WHERE id = 21;

DELETE FROM autores WHERE id = 7;
DELETE FROM libros WHERE id = 22;


-- join implicito
select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.correo, s.telefono
from prestamos as p, socios as s where p.socio_id=s.id;

-- join explicito
select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.correo, s.telefono
from prestamos as p inner join socios as s on p.socio_id=s.id;
-- contar, agrupar y ordenar

select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.correo, s.telefono, count(s.id) as numero_prestamos
from prestamos as p, socios as s where p.socio_id=s.id group by s.id order by p.id;

select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.correo, s.telefono, count(s.id) as numero_prestamos
from prestamos as p inner join socios as s on p.socio_id=s.id group by s.id order by p.id;

-- SOCIO QUE HA REALIZADO MAS PRESTAMOS
select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.correo, s.telefono, count(s.id) as numero_prestamos
from prestamos as p, socios as s where p.socio_id=s.id group by s.id order by numero_prestamos desc limit 0,1;

select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.correo, s.telefono, count(s.id) as numero_prestamos
from prestamos as p, socios as s where p.socio_id=s.id group by s.id order by numero_prestamos asc limit 0,1;

-- SOCIO QUE NO HA REALIZADO PRESTAMOS
select s.id, s.nombre_completo from socios as s where s.id not in(select p.socio_id from prestamos as p); -- subconsulta

-- LIBROS QUE NO HAN SIDO PRESTADOS USANDO SUBCONSULTAS
select l.id, l.isbn, l.titulo from libros as l where l.id not in (select p.libro_id from prestamos as p); 

-- TOTAL DE LIBROS (EJEMPLARES) DE LA BIBLIOTECA

select Sum(l.numero_ejemplar) as total_lbros from libros as l;

-- LIBRO CON MAYOR Y MENOR NUMERO DE EJEMPLAR
select libros.titulo, libros.numero_ejemplar from libros where libros.numero_ejemplar =
(Select max(libros.numero_ejemplar) from libros);

-- libro con menor numero ejemplar
select libros.titulo, libros.numero_ejemplar from libros where libros.numero_ejemplar =
(Select min(libros.numero_ejemplar) from libros); 

-- EL NUMERO DE LIBROS POR TEMAS
select libros.id, temas.nombre_tema, sum(libros.numero_ejemplar) as total_por_temas
from libros,temas where libros.tema_id = temas.id group by temas.id;

-- utilizando join explicito
select l.id, t.nombre_tema, sum(l.numero_ejemplar) as total_por_temas
from libros l join temas t on l.tema_id = t.id group by t.id;

-- buscar todos los titulos que contengan la palabra fundamentos
select libros.isbn,libros.titulo from libros where titulo like "%Fundamentos%";

-- unir 3 tablas
select s.nombre_completo, l.titulo, p.fecha_prestamo, p.fecha_entrega from socios as s 
inner join prestamos as p 
inner join libros as l on s.id=p.socio_id and l.id=p.libro_id;

-- -------------------27-01-2021-------------
select s.id,s.nombre_completo, s.correo from socios as s where correo = "";

select s.id,s.nombre_completo, s.correo from socios as s where correo is null;

select s.id,s.nombre_completo, s.correo from socios as s where correo = "Sin correo";

select s.id,s.nombre_completo, s.correo from socios as s where correo = "" or correo is null or correo = "Sin correo";

-- toda la informacion sobre los prestamos que han realizado los socios 
-- implementando join explicito de las siguientes tablas: 
-- prestamos, socios, libros, autores, editoriales y temas.

Select p.id, p.fecha_prestamo, p.fecha_entrega, s.nombre_completo, s.telefono,
l.isbn, l.titulo, a.nombre_autor, e.nombre_editorial,t.nombre_tema
from prestamos as p inner join socios as s inner join libros as l inner join autores as a inner join editoriales as e inner join temas as t
on s.id=p.socio_id and l.id=p.libro_id and a.id=l.autor_id and e.id=l.editorial_id and t.id=l.tema_id order by p.id asc;






