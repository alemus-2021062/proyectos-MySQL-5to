DROP DATABASE IF EXISTS control_academico_in5bm ;
CREATE DATABASE IF NOT EXISTS control_academico_in5bm
DEFAULT CHARACTER SET utf8 ;
use control_academico_in5bm ;

DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
carne VARCHAR(16) NOT NULL,
nombre1 VARCHAR(15),
nombre2 VARCHAR(15),
nombre3 VARCHAR(15),
apellido1 VARCHAR(15),
apellido2 VARCHAR(15),
PRIMARY KEY (carne)
);

DROP TABLE IF EXISTS instructores;
CREATE TABLE instructores(
id INTEGER NOT NULL,
nombre1 VARCHAR(15),
nombre2 VARCHAR(15),
nombre3 VARCHAR(15),
apellido1 VARCHAR(15),
apellido2 VARCHAR(15),
direccion VARCHAR(45),
email VARCHAR(45),
telefono VARCHAR(8),
fecha_nacimiento DATE,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS salones; 
CREATE TABLE salones(
codigo_salon VARCHAR(5) NOT NULL,
descripcion VARCHAR(45),
capacidad_maxima INTEGER,
edificio VARCHAR(15),
nivel INTEGER,
PRIMARY KEY (codigo_salon)
);

DROP TABLE IF EXISTS carreras_tecnicas;
CREATE TABLE carreras_tecnicas(
codigo_tecnico VARCHAR(6) NOT NULL,
carrera VARCHAR(45),
grado VARCHAR(10),
seccion CHAR(1),
jornada VARCHAR(10),
PRIMARY KEY (codigo_tecnico)
);

DROP TABLE IF EXISTS horarios;
CREATE TABLE horarios(
id INTEGER NOT NULL,
horario_inicio TIME,
horario_final TIME,
lunes TINYINT(1),
martes TINYINT(1),
miercoles TINYINT(1),
jueves TINYINT(1),
viernes TINYINT(1),
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS cursos;
CREATE TABLE cursos(
id INTEGER NOT NULL,
nombre_cursos VARCHAR(255),
ciclo YEAR,
cupo_maximo INTEGER,
cupo_minimo INTEGER,
carrera_tecnica_id VARCHAR(128),
horario_id INTEGER,
instructor_id INTEGER,
salon_id VARCHAR(5),
PRIMARY KEY (id),
FOREIGN KEY (carrera_tecnica_id) REFERENCES carreras_tecnicas(codigo_tecnico) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (horario_id) REFERENCES horarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (instructor_id) REFERENCES instructores(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (salon_id) REFERENCES salones(codigo_salon) ON DELETE CASCADE ON  UPDATE CASCADE

);

DROP TABLE IF EXISTS asignaciones_alumnos;
CREATE TABLE asignaciones_alumnos(
id VARCHAR(45) NOT NULL,
alumno_id VARCHAR(16),
curso_id INTEGER,
fecha_asignacion DATETIME,
PRIMARY KEY (id),
FOREIGN KEY (alumno_id) REFERENCES alumnos(carne) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE ON UPDATE CASCADE
);


insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');
insert into alumnos (carne, nombre1, nombre2, nombre3, apellido1, apellido2) values ('', '', '', '', '', '');



insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');
insert into instructores (id , nombre1, nombre2, nombre3, apellido1, apellido2, email, fecha_nacimiento) values ('', '', '', '', '', '', '', '');



insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');
insert into salones (codigo_salon, descripcion, capacidad_maxima, edificio, nivel) values ('', '', '', '', '');




insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');
insert into carreras_tecnicas (codigo_tecnico, carrera, grado, seccion, jornada) values ('', '', '', '', '');



insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');
insert into horarios (id, horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes) values ('', '', '', '', '', '', '', '');

insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');
insert into cursos (id, nombre_cursos, ciclos, cupo_maximo, cupo_minimo, carrera_tecnica_id, horario_id, instructor_id, salon_id) values ('', '', '', '', '', '', '', '', '');

insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');
insert into asignaciones_alumnos (id, alumno_id, curso_id, fecha_asignacion) values ('', '', '', '');









