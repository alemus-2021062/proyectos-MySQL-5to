/*
Nombre: Christofer Geovanni Quel Guerra 
Carne: 2021006
Nombre: Alberto Moisés Gerardo Lemus Alvarado
Carne: 2021062
Graupo Tecnico: IN5BM 
*/

DROP DATABASE IF EXISTS db_control_academico_in5bm ;
CREATE DATABASE IF NOT EXISTS db_control_academico_in5bm
DEFAULT CHARACTER SET utf8 ;
use db_control_academico_in5bm ;

DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
carne VARCHAR(7) NOT NULL,
nombre1 VARCHAR(15)NOT NULL,
nombre2 VARCHAR(15),
nombre3 VARCHAR(15),
apellido1 VARCHAR(15)NOT NULL,
apellido2 VARCHAR(15),
PRIMARY KEY (carne)
);

DROP TABLE IF EXISTS instructores;
CREATE TABLE instructores(
id INTEGER NOT NULL,
nombre1 VARCHAR(15)NOT NULL,
nombre2 VARCHAR(15),
nombre3 VARCHAR(15),
apellido1 VARCHAR(15)NOT NULL,
apellido2 VARCHAR(15),
direccion VARCHAR(45),
email VARCHAR(45)NOT NULL,
telefono VARCHAR(8)NOT NULL,
fecha_nacimiento DATE,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS salones; 
CREATE TABLE salones(
codigo_salon VARCHAR(5) NOT NULL,
descripcion VARCHAR(45),
capacidad_maxima INTEGER NOT NULL,
edificio VARCHAR(15),
nivel INTEGER,
PRIMARY KEY (codigo_salon)
);

DROP TABLE IF EXISTS carreras_tecnicas;
CREATE TABLE carreras_tecnicas(
codigo_tecnico VARCHAR(6) NOT NULL,
carrera VARCHAR(45) NOT NULL,
grado VARCHAR(10) NOT NULL,
seccion CHAR(1) NOT NULL,
jornada VARCHAR(10) NOT NULL,
PRIMARY KEY (codigo_tecnico)
);

DROP TABLE IF EXISTS horarios;
CREATE TABLE horarios(
id INTEGER NOT NULL AUTO_INCREMENT,
horario_inicio TIME NOT NULL,
horario_final TIME NOT NULL,
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
nombre_cursos VARCHAR(255) NOT NULL,
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
id INT NOT NULL AUTO_INCREMENT,
alumno_id VARCHAR(16),
curso_id INTEGER,
fecha_asignacion DATETIME,
PRIMARY KEY (id),
FOREIGN KEY (alumno_id) REFERENCES alumnos(carne) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS rol;
CREATE TABLE IF NOT EXISTS rol (
	id INT NOT NULL,
    descripcion VARCHAR(50),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario(
user VARCHAR(25) NOT NULL,
pass VARCHAR(255) NOT NULL,
nombre VARCHAR(50) NOT NULL,
rol_id INT NOT NULL,
PRIMARY KEY (user),
CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES rol(id)
);

	#------------------------------------PROCEDIMIENTOS DE ROL Y USUARIO----------------------------

INSERT INTO rol (id, descripcion) VALUES (1, "Administrador");
INSERT INTO rol (id, descripcion) VALUES (2, "Estandar");

INSERT INTO usuario (user, pass, nombre, rol_id) VALUES ("root", "admin", "Moises Lemus", 1);
INSERT INTO usuario (user, pass, nombre, rol_id) VALUES ("kinal", "12345", "Alberto Lemus", 2);

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_usuario_read $$
CREATE PROCEDURE sp_usuario_read()
BEGIN
	SELECT u.user, u.pass, u.nombre, u.rol_id FROM usuario as u;
END $$
DELIMITER ;

CALL sp_usuario_read;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_rol_read $$
CREATE PROCEDURE sp_rol_read()
BEGIN
	SELECT r.id, r.descripcion FROM rol as r;
END $$
DELIMITER ;

CALL sp_rol_read;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_validar2_read $$
CREATE PROCEDURE sp_validar2_read(IN _user VARCHAR(25), IN _pass VARCHAR(255))
BEGIN
	SELECT user, pass, IF(_user = usuario.user,"Exito","ERRONEO")FROM usuario;
	#if(_user = usuario.user AND _pass = usuario.pass) THEN(SELECT "Exito"); else(SELECT "Erroneo"); end if; 
    
    
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_validar_read $$
CREATE PROCEDURE sp_validar_read(IN _user VARCHAR(25), IN _pass VARCHAR(255))
BEGIN

SELECT u.user, u.pass FROM usuario as u Where _user = u.user AND _pass = u.pass;
    
    
END $$
DELIMITER ;

CALL sp_validar_read("root", "admin");

	#---------------------------------------------Tabla alumnos-----------------------------------------
#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_create $$
CREATE PROCEDURE sp_alumnos_create(
	in _carne VARCHAR(7),
    in _nombre1 varchar(15),
    in _nombre2 varchar(15),
    in _nombre3 VARCHAR(15),
    in _apellido1 VARCHAR(15),
    in _apellido2 VARCHAR(15)
    )
BEGIN
	insert into alumnos (
		carne,
        nombre1,
        nombre2,
        nombre3,
        apellido1,
        apellido2
	) values(
    _carne,
    _nombre1,
    _nombre2,
    _nombre3,
    _apellido1,
    _apellido2
    );
END $$
DELIMITER ;

CALL sp_alumnos_create("2021001", "Alberto", "Angel", "Luz", "Pacheco", "Del monte");
CALL sp_alumnos_create("2021002", "Enrique", "Nidio", "Chavo", "Arados", "Avila");
CALL sp_alumnos_create("2021003", "Jose", "Jose", "Rosales", "Rosales", "Guerra");
CALL sp_alumnos_create("2021004", "Alex", "Juancho", "Mario", "Morales", "Arada");
CALL sp_alumnos_create("2021005", "Javier", "Abril", "Sanda", "Coral", "Monter");
CALL sp_alumnos_create("2021006", "Andres", "Williams", "Peter", "Pacheco", "De la villa");
CALL sp_alumnos_create("2021007", "Jorge", "Pedro", "Pedro", "Flores", "Hernandez");
CALL sp_alumnos_create("2021008", "Carlos", "Andana", "Marino", "Escarrilla", "Coral");
CALL sp_alumnos_create("2021009", "Francisco", "Abel", "Coral", "Hernandez", "De Leon");
CALL sp_alumnos_create("2021010", "Paco", "Jesus", "Jose", "Perez", "Juarez");
CALL sp_alumnos_create("2021011", "Paquito", "Marc", "", "Spector", "Lockly");
CALL sp_alumnos_create("2021012","Josue","Eddy","","Aquino","de Leon");
CALL sp_alumnos_create("2021015", "Genesis", "Fernanda", "Abril", "Garcia", "Lemus");

#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_read $$
CREATE PROCEDURE sp_alumnos_read()
BEGIN
	select alumnos.carne,
        alumnos.nombre1,
        alumnos.nombre2,
        alumnos.nombre3,
        alumnos.apellido1,
        alumnos.apellido2
	from
		alumnos;
    
END $$
DELIMITER ;

call sp_alumnos_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_read_by_id $$
CREATE PROCEDURE sp_alumnos_read_by_id(IN _carne VARCHAR(7))
BEGIN
	select 
    alumnos.carne,
    alumnos.nombre1,
    alumnos.nombre2,
    alumnos.nombre3,
    alumnos.apellido1,
    alumnos.apellido2
    FROM
		alumnos
        WHERE _carne = alumnos.carne;
END $$
DELIMITER ;

call sp_alumnos_read_by_id(2021001);

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_reporte$$
CREATE PROCEDURE sp_alumnos_reporte()
BEGIN 
	SELECT
		a.carne,
        CONCAT(
			a.nombre1," ",
            IF(a.nombre2 IS NULL," ",a.nombre2)," ",
            IF(a.nombre3 IS NULL," ",a.nombre3)
        )AS nombres,
        CONCAT(
			a.apellido1," ",
            IF(a.apellido2 IS NULL," ",a.apellido2)
        )AS apellidos
        
    FROM 
		alumnos AS a;
END $$
DELIMITER ;
CALL sp_alumnos_reporte;

#Update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_update $$
CREATE PROCEDURE sp_alumnos_update(
	in _carne VARCHAR(7),
    in _nombre1 varchar(15),
    in _nombre2 varchar(15),
    in _nombre3 VARCHAR(15),
    in _apellido1 VARCHAR(15),
    in _apellido2 VARCHAR(15)
    )
BEGIN
	update
		alumnos
	SET
		nombre1 = _nombre1,
        nombre2 = _nombre2,
        nombre3 = _nombre3,
        apellido1 = _apellido1,
        apellido2 = _apellido2
	WHERE
		alumnos.carne = _carne;
END $$
DELIMITER ;

call sp_alumnos_update("2021001", "Josue", "Angel", "Gabriel", "Valle", "Del monte");

call sp_alumnos_read();

#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_delete $$
CREATE PROCEDURE sp_alumnos_delete(
	in _carne VARCHAR(7)
    )
BEGIN
	DELETE from
		alumnos
	WHERE
		carne = _carne;
END $$
DELIMITER ;

call sp_alumnos_delete("2021011");


#------------------------------------------Instructores-------------------------------------
#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_create $$
CREATE PROCEDURE sp_instructores_create(
	in _id integer,
    in _nombre1 varchar(15),
    in _nombre2 varchar(15),
    in _nombre3 VARCHAR(15),
    in _apellido1 VARCHAR(15),
    in _apellido2 VARCHAR(15),
    in _direccion VARCHAR(45),
    in _email VARCHAR(45),
    in _telefono varchar(8),
    in _fecha_nacimiento date
    )
BEGIN
	insert into instructores (
		id ,
		nombre1 ,
		nombre2 ,
		nombre3 ,
		apellido1 ,
		apellido2 ,
		direccion ,
		email,
		telefono ,
		fecha_nacimiento
	) values(
		_id,
		_nombre1 ,
		_nombre2 ,
		_nombre3 ,
		_apellido1 ,
		_apellido2 ,
		_direccion ,
		_email ,
        _telefono,
		_fecha_nacimiento 
    );
END $$
DELIMITER ;

CALL sp_instructores_create(11, "Marcos", "Abdul", "Cruz", "Flores", "Flores", "villa lobos 1 6-70", "instructor1@gmail.com", "46373214", '1989-02-1');
CALL sp_instructores_create(22, "Milton", "Pacay", "Ixcoj", "Andana", "Segundo", "Villa nueva 4-66", "instructor2@gmail.com", "36478467", '2000-05-2');
CALL sp_instructores_create(33, "Aron", "Estefano", "Moises", "River", "De Coral", "Trebol 66-5", "instructor3@gmail.com", "36748468", '1975-03-5');
CALL sp_instructores_create(44, "Santiago", "Julio", "Geovanni", "Santana", "Centino", "Monte Maria 45.3", "instructor4@gmail.com", "38742933", '1998-03-5');
CALL sp_instructores_create(55, "Julio", "Miguel", "Esanu", "Verdoso", "De los bosques", "Villa Lobos 2 56-8", "instructor5@gmail.com", "54830217", '1950-06-21');
CALL sp_instructores_create(66, "Cristian", "Estuardo", "Coral", "Perez", "Asanum", "Villa lobos 1 3-42", "instructor6@gmail.com", "23846473", '1993-08-6');
CALL sp_instructores_create(77, "Christopher", "Sergio", "Amada", "Bobie", "Sanabria", "San Jose 22-2", "instructor7@gmail.com", "53225656", '1998-12-5');
CALL sp_instructores_create(88, "Josue", "Cesar", "Bart", "Simpson", "Flores", "Villa Nueva 33-3", "instructor8@gmail.com", "12345678", '1981-04-11');
CALL sp_instructores_create(99, "Manun", "Luis", "Java", "Escobar", "Arados", "Jose Villa 23-4",  "instructor9@gmail.com", "28437480", '1979-04-3');
CALL sp_instructores_create(110, "Phoenix", "Donaldo", "Roman", "Wright", "Azul", "San Juan 34-5",  "instructor10gmail.com", "28488289", '1999-11-30');
CALL sp_instructores_create(111, "Marc", "Steven", "", "Spector", "Grant", "Villa Lobos 34-5",  "instructor11gmail.com", "86591852", '1998-9-20');

#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_read $$
CREATE PROCEDURE sp_instructores_read()
BEGIN
	select instructores.id ,
		instructores.nombre1 ,
		instructores.nombre2 ,
		instructores.nombre3 ,
		instructores.apellido1 ,
		instructores.apellido2 ,
		instructores.direccion ,
		instructores.email,
		instructores.telefono ,
		instructores.fecha_nacimiento
	from
		instructores;
    
END $$
DELIMITER ;

call sp_instructores_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_read_by_id $$
CREATE PROCEDURE sp_instructores_read_by_id(IN _id INTEGER)
BEGIN
	select * FROM
		instructores
	WHERE _id = instructores.id;
END $$
DELIMITER ;

call sp_instructores_read_by_id(11);

DELIMITER $$
DROP PROCEDURE IF EXISTS  sp_instructores_reporte$$
CREATE PROCEDURE sp_instructores_reporte()
BEGIN 
	SELECT 
		i.id,
        CONCAT(
			i.nombre1," ",
            IF(i.nombre2 IS NULL," ",i.nombre2)," ",
            IF(i.nombre3 IS NULL," ",i.nombre3)," ",
            i.apellido1," ",
            IF(i.apellido2 IS NULL," ",i.apellido2)
        )AS nombre_completo,
        IF(i.direccion IS NULL," ",i.direccion) AS direccion,
        i.email,
        i.telefono,
        IF(i.fecha_nacimiento IS NULL," ",i.fecha_nacimiento) AS fecha_nacimiento
	FROM 
		instructores AS i;
END $$
DELIMITER ;
CALL sp_instructores_reporte;

#Update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_update $$
CREATE PROCEDURE sp_instructores_update(
	in _id integer,
    in _nombre1 varchar(15),
    in _nombre2 varchar(15),
    in _nombre3 VARCHAR(15),
    in _apellido1 VARCHAR(15),
    in _apellido2 VARCHAR(15),
    in _direccion VARCHAR(45),
    in _email VARCHAR(45),
    in _telefono varchar(8),
    in _fecha_nacimiento date
    )
BEGIN
	update
		instructores
	SET
		nombre1 = _nombre1,
        nombre2 = _nombre2,
        nombre3 = _nombre3,
        apellido1 = _apellido1,
        apellido2 = _apellido2,
        direccion = _direccion,
        email = _email,
        telefono = _telefono,
        fecha_nacimiento = _fecha_nacimiento
	WHERE
		instructores.id = _id;
END $$
DELIMITER ;

call sp_instructores_update(11, "Joseph", "Lamur", "Young", "Flores", "Son", "villa Nueva 5-66", "instructor120@gmail.com", "45254966", '1990-04-21');

#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_delete $$
CREATE PROCEDURE sp_instructores_delete(
	in _id integer
    )
BEGIN
	DELETE from
		instructores
	WHERE
		instructores.id = _id;
END $$
DELIMITER ;

call sp_instructores_delete(111);

#-----------------------------------------------------------Salones--------------------------------------------
#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_create $$
CREATE PROCEDURE sp_salones_create(
	in _codigo_salon VARCHAR(5),
    in _descripcion varchar(45),
    in _capacidad_maxima integer,
    in _edificio VARCHAR(15),
    in _nivel integer
    )
BEGIN
	insert into salones (
		codigo_salon,
        descripcion,
        capacidad_maxima,
        edificio,
        nivel
	) values(
	_codigo_salon, 
	_descripcion ,
	_capacidad_maxima, 
	_edificio ,
	_nivel 
    );
END $$
DELIMITER ;

CALL sp_salones_create("K11", "Salon de Biologia", 20, "San Pablos", 1);
CALL sp_salones_create("A1", "Salon de Computacion", 34, "Edificio A", 1);
CALL sp_salones_create("B2", "Salon de Matematicas", 23, "Edificio A", 1);
CALL sp_salones_create("C3", "Salon de Naturales", 12, "Edificio B", 2);
CALL sp_salones_create("D4", "Salon de Musica", 20, "Edificio C", 1);
CALL sp_salones_create("E5", "Salon de Sociales", 11, "Edificio A", 1);
CALL sp_salones_create("F6", "Salon de Estadistica", 22, "Edificio B", 2);
CALL sp_salones_create("G7", "Salon de Ingles", 10, "Edificio B", 1);
CALL sp_salones_create("H8", "Salon de Teatro", 23, "Edificio C", 3);
CALL sp_salones_create("I9", "Salon de Quimica", 10, "Edificio A", 2);
CALL sp_salones_create("J0", "Salon de Lengua y Literatura", 10, "Edificio D", 1);
CALL sp_salones_create("L12", "Salon de Carpinteria",45,"Edificio D",2);

#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_read $$
CREATE PROCEDURE sp_salones_read()
BEGIN
	select salones.codigo_salon,
        salones.descripcion,
        salones.capacidad_maxima,
        salones.edificio,
        salones.nivel
	from
		salones;
    
END $$
DELIMITER ;

call sp_salones_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_read_by_id $$
CREATE PROCEDURE sp_salones_read_by_id(IN _codigo_salon VARCHAR(5))
BEGIN
	select * FROM
		salones
        WHERE _codigo_salon = salones.codigo_salon;
END $$
DELIMITER ;

call sp_salones_read_by_id("K11");

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_reporte $$
CREATE PROCEDURE sp_salones_reporte()
BEGIN 
	SELECT 
		s.codigo_salon,
        IF(s.nivel IS NULL," ",s.nivel) AS nivel,
        IF(s.edificio IS NULL," ",s.edificio) AS edificio,
        s.capacidad_maxima,
        IF(s.descripcion IS NULL," ",s.descripcion) AS descripcion
    FROM 
		salones AS s;
END $$
DELIMITER ;
CALL sp_salones_reporte;

#update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_update $$
CREATE PROCEDURE sp_salones_update(
	in _codigo_salon VARCHAR(5),
    in _descripcion varchar(45),
    in _capacidad_maxima integer,
    in _edificio VARCHAR(15),
    in _nivel integer
    )
BEGIN
	update
		salones
	SET
		codigo_salon = _codigo_salon,
        descripcion = _descripcion,
        capacidad_maxima = _capacidad_maxima,
        edificio = _edificio,
        nivel = _nivel
	WHERE
		codigo_salon = _codigo_salon;
END $$
DELIMITER ;

call sp_salones_update("K11", "Salon de Sociales", 24, "San Pato", 2);


#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_delete $$
CREATE PROCEDURE sp_salones_delete(
	in _codigo_salon VARCHAR(5)
    )
BEGIN
	DELETE from
		salones
	WHERE
		salones.codigo_salon = _codigo_salon;
END $$
DELIMITER ;

call sp_salones_delete("k11");

#--------------------------------------------------carreras tecnicas-----------------------------------------

#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_create $$
CREATE PROCEDURE sp_carreras_tecnicas_create(
	in _codigo_tecnico VARCHAR(6),
    in _carrera varchar(45),
    in _grado varchar(10),
    in _seccion char(1),
    in _jornada VARCHAR(10)
    )
BEGIN
	insert into carreras_tecnicas (
		codigo_tecnico, 
		carrera, 
		grado, 
		seccion, 
		jornada 
	) values(
		_codigo_tecnico,
		_carrera,
		_grado,
		_seccion,
		_jornada 
    );
END $$
DELIMITER ;

CALL sp_carreras_tecnicas_create("34Q1", "Arqueologo", "2ro", 'B', "Vespertina");
CALL sp_carreras_tecnicas_create("33E4", "Informatico", "3ro", 'A', "Matutina");
CALL sp_carreras_tecnicas_create("21R5", "Arquitecto", "2do", 'B', "Vespertina");
CALL sp_carreras_tecnicas_create("45T6", "Actor/Actriz", "1ro", 'A', "Matutina");
CALL sp_carreras_tecnicas_create("87W1", "Profesor", "4to", 'C', "Vespertina");
CALL sp_carreras_tecnicas_create("85F6", "Filosofo", "2do", 'F', "Matutina");
CALL sp_carreras_tecnicas_create("52F3", "Musico", "1ro", 'A', "Vespertina");
CALL sp_carreras_tecnicas_create("36J9", "Cientifico", "3ro", 'A', "Vespertina");
CALL sp_carreras_tecnicas_create("12Y6", "Constructor", "2do", 'C', "Vespertina");
CALL sp_carreras_tecnicas_create("55U8", "Medico", "1ro", 'D', "Matutina");
CALL sp_carreras_tecnicas_create("06O5", "Doctor", "1ro", 'E', "Matutina");
CALL sp_carreras_tecnicas_create("11MO", "Electricista", "1ro", 'E', "Matutina");


#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_read $$
CREATE PROCEDURE sp_carreras_tecnicas_read()
BEGIN
	select carreras_tecnicas.codigo_tecnico, 
		carreras_tecnicas.carrera, 
		carreras_tecnicas.grado, 
		carreras_tecnicas.seccion, 
		carreras_tecnicas.jornada 
	from
		carreras_tecnicas;
    
END $$
DELIMITER ;

call sp_carreras_tecnicas_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_read_by_id $$
CREATE PROCEDURE sp_carreras_tecnicas_read_by_id(IN _codigo_tecnico VARCHAR(5))
BEGIN
	select * FROM
		carreras_tecnicas
        WHERE _codigo_tecnico = carreras_tecnicas.codigo_tecnico;
END $$
DELIMITER ;

call sp_carreras_tecnicas_read_by_id("34Q1");

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_reporte$$
CREATE PROCEDURE sp_carreras_tecnicas_reporte()
BEGIN 
	SELECT
		c.codigo_tecnico,
        c.carrera,
        c.grado,
        c.seccion,
        c.jornada
    FROM 
		carreras_tecnicas AS c;
END $$
DELIMITER ;
CALL sp_carreras_tecnicas_reporte;


#Update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_update $$
CREATE PROCEDURE sp_carreras_tecnicas_update(
	in _codigo_tecnico VARCHAR(6),
    in _carrera varchar(45),
    in _grado varchar(10),
    in _seccion char(1),
    in _jornada VARCHAR(10)
    )
BEGIN
	update
		carreras_tecnicas
	SET
		carrera = _carrera,
        grado = _grado,
        grado = _grado ,
        seccion = _seccion,
        jornada = _jornada
	WHERE
		codigo_tecnico = _codigo_tecnico;
END $$
DELIMITER ;

call sp_carreras_tecnicas_update("34Q1", "Musico", "3ro", 'B', "Vespertina");


#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_delete $$
CREATE PROCEDURE sp_carreras_tecnicas_delete(
	in _codigo_tecnico VARCHAR(6)
    )
BEGIN
	DELETE from
		carreras_tecnicas
	WHERE
		codigo_tecnico = _codigo_tecnico;
END $$
DELIMITER ;

call sp_carreras_tecnicas_delete("34Q1");

#------------------------------------------------horarios------------------------------------------------
#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_create $$
CREATE PROCEDURE sp_horarios_create(
    in _horario_inicio TIME,
    in _horario_final TIME, 
    in _lunes TINYINT(1),
    in _martes TINYINT(1),
    in _miercoles TINYINT(1),
    in _jueves TINYINT(1),
    in _viernes TINYINT(1)
    )
BEGIN
	insert into horarios (
		horario_inicio, 
		horario_final, 
		lunes, 
		martes, 
		miercoles, 
		jueves, 
		viernes 
	) values(
		_horario_inicio, 
		_horario_final, 
		_lunes, 
		_martes, 
		_miercoles, 
		_jueves, 
		_viernes
    );
END $$
DELIMITER ;

CALL sp_horarios_create('7:00' , '12:00', 0 , 1 , 1, 0, 1);
CALL sp_horarios_create('1:00', '6:00', 0, 1, 1, 0, 0);
CALL sp_horarios_create('9:30', '3:00', 0, 1, 0, 1, 0);
CALL sp_horarios_create('3:00', '5:00', 0, 1, 1, 1, 0);
CALL sp_horarios_create('8:10', '12:00', 1, 0, 1, 0, 1);
CALL sp_horarios_create('3:00', '8:30', 1, 1, 0, 0, 1);
CALL sp_horarios_create('2:30', '7:00', 1, 0, 0, 1, 1);
CALL sp_horarios_create('1:50', '6:10', 0, 1, 1, 0, 0);
CALL sp_horarios_create('6:30', '10:00', 1, 1, 1, 1, 0);
CALL sp_horarios_create('5:00', '10:00', 0, 1, 1, 1, 1);
CALL sp_horarios_create('6:00' , '13:00', 1 , 0 , 1, 1, 1);
CALL sp_horarios_create('7:00' , '14:00', 1 , 1 , 1, 1, 1);


#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_read $$
CREATE PROCEDURE sp_horarios_read()
BEGIN
	select horarios.id, 
		horarios.horario_inicio, 
		horarios.horario_final, 
		horarios.lunes, 
		horarios.martes, 
		horarios.miercoles, 
		horarios.jueves, 
		horarios.viernes
	from
		horarios;
    
END $$
DELIMITER ;

call sp_horarios_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_read_by_id $$
CREATE PROCEDURE sp_horarios_read_by_id(IN _id INTEGER)
BEGIN
	select * FROM
		horarios
        WHERE _id = horarios.id;
END $$
DELIMITER ;

call sp_horarios_read_by_id(2);

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_reporte$$
CREATE PROCEDURE sp_horarios_reporte()
BEGIN 
	SELECT 
		h.id,
		h.horario_inicio, 
        h.horario_final,
		IF(h.lunes IS NULL," ", IF(h.lunes IS TRUE,"Si", "No") ) AS lunes,
		IF(h.martes IS NULL," ", IF(h.martes IS TRUE,"Si", "No") ) AS martes,
		IF(h.miercoles IS NULL," ", IF(h.miercoles IS TRUE,"Si", "No") ) AS miercoles,
		IF(h.jueves IS NULL," ",IF(h.jueves IS TRUE,"Si", "No") ) AS jueves,
		IF(h.viernes IS NULL," ",IF(h.viernes IS TRUE,"Si", "No") )AS viernes
    FROM 
		horarios AS h;
END $$
DELIMITER ;

CALL sp_horarios_reporte;

#Update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_update $$
CREATE PROCEDURE sp_horarios_update(
	in _id integer,
    in _horario_inicio TIME,
    in _horario_final TIME, 
    in _lunes TINYINT(1),
    in _martes TINYINT(1),
    in _miercoles TINYINT(1),
    in _jueves TINYINT(1),
    in _viernes TINYINT(1)
    )
BEGIN
	update
		horarios
	SET
		id = _id,
        horario_inicio = _horario_inicio,
        horario_final = _horario_final,
        lunes = _lunes,
        martes = _martes,
        miercoles = _miercoles,
        jueves = _jueves,
        viernes = _viernes
	WHERE
		horarios.id = _id;
END $$
DELIMITER ;

call sp_horarios_update(2, '6:30' , '13:30', 0 , 1 , 0, 1, 1);


#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_delete $$
CREATE PROCEDURE sp_horarios_delete(
	in _id integer
    )
BEGIN
	DELETE from
		horarios
	WHERE
		horarios.id = _id;
END $$
DELIMITER ;

call sp_horarios_delete(12);

#--------------------------------------------Cursos-----------------------------------------

#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_create $$
CREATE PROCEDURE sp_cursos_create(
	in _id INTEGER,
    in _nombre_cursos VARCHAR(255),
    in _ciclo YEAR,
    in _cupo_maximo INTEGER,
    in _cupo_minimo INTEGER,
    in _carrera_tecnica_id VARCHAR(128),
    in _horario_id INTEGER,
    in _instructor_id INTEGER,
    in _salon_id VARCHAR(5)
    )
BEGIN
	insert into cursos (
		id, 
		nombre_cursos, 
		ciclo, 
		cupo_maximo, 
		cupo_minimo, 
		carrera_tecnica_id, 
		horario_id, 
		instructor_id, 
		salon_id 
	) values(
		_id, 
		_nombre_cursos, 
		_ciclo, 
		_cupo_maximo, 
		_cupo_minimo, 
		_carrera_tecnica_id, 
		_horario_id, 
		_instructor_id, 
		_salon_id
    );
END $$
DELIMITER ;

CALL sp_cursos_create(100, "Informatica I",'2021', 25, 20, "33E4", 1, 11, "A1");
CALL sp_cursos_create(101, "Matematica II", '2010', 50, 25, "21R5", 2, 22, "B2");
CALL sp_cursos_create(102, "Naturales I", '2005', 22, 12, "45T6", 3, 33, "C3");
CALL sp_cursos_create(103, "Musica I", '2017', 10, 7, "87W1", 4, 44, "D4");
CALL sp_cursos_create(104, "Sociales Ii", '2016',  12, 6, "85F6", 5, 55, "E5");
CALL sp_cursos_create(105, "Estadistico I", '2020',  30, 15, "52F3", 6, 66, "F6");
CALL sp_cursos_create(106, "Ingles Avanzado", '2020', 20, 15, "36J9", 7, 77, "G7");
CALL sp_cursos_create(107, "Teatro III", '2019',  9, 6, "12Y6", 8, 88, "H8");
CALL sp_cursos_create(108, "Quimica I", '2010', 10, 5, "55U8", 9, 99, "I9");
CALL sp_cursos_create(109, "Lengua y Literatura II", '2010',  10, 10, "06O5", 10, 110, "J0");
CALL sp_cursos_create(110, "Informatica II",'2019', 20, 15, "11MO", 11, 110, "A1");

#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_read $$
CREATE PROCEDURE sp_cursos_read()
BEGIN
	select cursos.id, 
		cursos.nombre_cursos, 
		cursos.ciclo, 
		cursos.cupo_minimo,
		cursos.cupo_maximo,  
		cursos.carrera_tecnica_id, 
		cursos.horario_id, 
		cursos.instructor_id, 
		cursos.salon_id
	from
		cursos;
    
END $$
DELIMITER ;

call sp_cursos_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_read_by_id $$
CREATE PROCEDURE sp_cursos_read_by_id(IN _id INTEGER)
BEGIN
	select 
		cursos.id,
		cursos.nombre_cursos, 
		cursos.ciclo, 
		cursos.cupo_maximo, 
		cursos.cupo_minimo, 
		cursos.carrera_tecnica_id, 
		cursos.horario_id, 
		cursos.instructor_id, 
		cursos.salon_id
    
    FROM
		cursos
        WHERE _id = cursos.id;
END $$
DELIMITER ;

call sp_cursos_read_by_id(110);


DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_reporte$$
CREATE PROCEDURE sp_cursos_reporte()
BEGIN 
	SELECT 
		c.id,
        c.nombre_cursos,
        IF(c.ciclo IS NULL," ",c.ciclo) AS ciclo,
        IF(c.cupo_minimo IS NULL," ",c.cupo_minimo) AS cupo_minimo,
        IF(c.cupo_maximo IS NULL," ",c.cupo_maximo) AS cupo_maximo,
        c.carrera_tecnica_id,
        ct.carrera,
        c.horario_id,
        h.horario_inicio,
        h.horario_final,
        c.instructor_id,
        CONCAT(
			i.nombre1," ",
            i.apellido1
        )AS nombre_instructor,
        c.salon_id
    FROM
		cursos AS c
        INNER JOIN carreras_tecnicas AS ct
        INNER JOIN horarios AS h
        INNER JOIN instructores AS i
        INNER JOIN salones AS s
        ON c.carrera_tecnica_id = ct.codigo_tecnico
        AND c.horario_id = h.id
        AND c.instructor_id = i.id
        AND c.salon_id = s.codigo_salon;
			
END $$
DELIMITER ;
CALL sp_cursos_reporte;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_reporte_by_id$$
CREATE PROCEDURE sp_cursos_reporte_by_id(IN _id INT)
BEGIN 
	SELECT 
		c.id,
        c.nombre_cursos,
        IF(c.ciclo IS NULL," ",c.ciclo) AS ciclo,
        IF(c.cupo_minimo IS NULL," ",c.cupo_minimo) AS cupo_minimo,
        IF(c.cupo_maximo IS NULL," ",c.cupo_maximo) AS cupo_maximo,
        c.carrera_tecnica_id,
        ct.carrera,
        c.horario_id,
        h.horario_inicio,
        h.horario_final,
        c.instructor_id,
        CONCAT(
			i.nombre1," ",
            i.apellido1
        )AS nombre_instructor,
        c.salon_id
    FROM
		cursos AS c
        INNER JOIN carreras_tecnicas AS ct
        INNER JOIN horarios AS h
        INNER JOIN instructores AS i
        INNER JOIN salones AS s
        ON c.carrera_tecnica_id = ct.codigo_tecnico
        AND c.horario_id = h.id
        AND c.instructor_id = i.id
        AND c.salon_id = s.codigo_salon
	WHERE
		c.id = _id;
			
END $$
DELIMITER ;
CALL sp_cursos_reporte_by_id(102);

#Update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_update $$
CREATE PROCEDURE sp_cursos_update(
	in _id INTEGER,
    in _nombre_cursos VARCHAR(255),
    in _ciclo YEAR,
    in _cupo_maximo INTEGER,
    in _cupo_minimo INTEGER,
    in _carrera_tecnica_id VARCHAR(128),
    in _horario_id INTEGER,
    in _instructor_id INTEGER,
    in _salon_id VARCHAR(5)
    )
BEGIN
	update
		cursos
	SET
		id = _id,
		nombre_cursos = _nombre_cursos,
        ciclo = _ciclo,
        cupo_maximo = _cupo_maximo,
        cupo_minimo = _cupo_minimo,
        carrera_tecnica_id = _carrera_tecnica_id,
        horario_id = _horario_id,
        instructor_id = _instructor_id,
        salon_id = _salon_id
	WHERE
		cursos.id = _id;
END $$
DELIMITER ;

call sp_cursos_update(110, "Informatica II",'2023', 40, 20, "11MO", 10, 110, "A1");


#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_delete $$
CREATE PROCEDURE sp_cursos_delete(
	in _id INTEGER
    )
BEGIN
	DELETE from
		cursos
	WHERE
		cursos.id = _id;
END $$
DELIMITER ;

call sp_cursos_delete(110);

#----------------------------------------------------Asignacion Alumnos-----------------------------------------------------
#Create
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_create $$
CREATE PROCEDURE sp_asignaciones_alumnos_create(
    in _alumno_id VARCHAR(16),
    in _curso_id INTEGER,
    in _fecha_asignacion DATETIME
    )
BEGIN
	insert into asignaciones_alumnos (
        alumno_id,
        curso_id,
        fecha_asignacion
	) values(
        _alumno_id,
        _curso_id,
        _fecha_asignacion
    );
END $$
DELIMITER ;

CALL sp_asignaciones_alumnos_create("2021001", 109, '2015-04-11 14:21');
CALL sp_asignaciones_alumnos_create("2021001", 100, '2019-05-4 12:59');
CALL sp_asignaciones_alumnos_create("2021002", 101, '2019-06-5 13:50');
CALL sp_asignaciones_alumnos_create("2021003", 102, '2013-06-21 07:40');
CALL sp_asignaciones_alumnos_create("2021004", 103, '2018-02-12 11:32');
CALL sp_asignaciones_alumnos_create("2021005", 104, '2019-03-20 09:13');
CALL sp_asignaciones_alumnos_create("2021006", 105, '2020-04-4 06:12');
CALL sp_asignaciones_alumnos_create("2021007", 106, '2011-03-6 10:30');
CALL sp_asignaciones_alumnos_create("2021008", 107, '2016-07-8 17:45');
CALL sp_asignaciones_alumnos_create("2021009", 108, '2015-06-7 13:51');
CALL sp_asignaciones_alumnos_create("2021010", 109, '2017-06-7 14:43');

#Read
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_read $$
CREATE PROCEDURE sp_asignaciones_alumnos_read()
BEGIN
	select asignaciones_alumnos.id, 
    asignaciones_alumnos.alumno_id, 
    asignaciones_alumnos.curso_id, 
    asignaciones_alumnos.fecha_asignacion
	from
		asignaciones_alumnos; 
    
END $$
DELIMITER ;

call sp_asignaciones_alumnos_read();

#ReadID
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_read_by_id $$
CREATE PROCEDURE sp_asignaciones_alumnos_read_by_id(IN _id INT)
BEGIN
	select 
		asignaciones_alumnos.alumno_id,
        asignaciones_alumnos.curso_id,
        asignaciones_alumnos.fecha_asignacion
    FROM
		asignaciones_alumnos
        WHERE _id = asignaciones_alumnos.id;
END $$
DELIMITER ;

call sp_asignaciones_alumnos_read_by_id("4");

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_reporte$$
CREATE PROCEDURE sp_asignaciones_alumnos_reporte()
BEGIN 
	SELECT
    aa.id,
    aa.alumno_id,
    CONCAT(
		a.nombre1," ",
		IF(a.nombre2 IS NULL," ",a.nombre2)," ",
		IF(a.nombre3 IS NULL," ",a.nombre3)," ",
        a.apellido1," ",
		IF(a.apellido2 IS NULL," ",a.apellido2)
	)AS nombre_completo,
    aa.curso_id,
    c.nombre_cursos,
    IF(aa.fecha_asignacion IS NULL," ",aa.fecha_asignacion) AS fecha_asignacion
	FROM 
		asignaciones_alumnos AS aa 
        INNER JOIN alumnos AS a
        INNER JOIN cursos AS c
	ON 
		aa.alumno_id = a.carne
	AND 
		aa.curso_id=c.id;
END $$
DELIMITER ;
call sp_asignaciones_alumnos_reporte;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_reporte_by_id$$
CREATE PROCEDURE sp_asignaciones_alumnos_reporte_by_id(IN _id INT)
BEGIN 
	SELECT
    aa.id,
    aa.alumno_id,
    CONCAT(
		a.nombre1," ",
		IF(a.nombre2 IS NULL," ",a.nombre2)," ",
		IF(a.nombre3 IS NULL," ",a.nombre3)," ",
        a.apellido1," ",
		IF(a.apellido2 IS NULL," ",a.apellido2)
	)AS nombre_completo,
    aa.curso_id,
    c.nombre_cursos,
    IF(aa.fecha_asignacion IS NULL," ",aa.fecha_asignacion) AS fecha_asignacion
	FROM 
		asignaciones_alumnos AS aa 
        INNER JOIN alumnos AS a
        INNER JOIN cursos AS c
	ON 
		aa.alumno_id = a.carne
	AND 
		aa.curso_id=c.id
	WHERE
		aa.id = _id;
END $$
DELIMITER ;
call sp_asignaciones_alumnos_reporte_by_id(2);


#Update
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_update $$
CREATE PROCEDURE sp_asignaciones_alumnos_update(
	in _id INT,
    in _alumno_id VARCHAR(16),
    in _curso_id INTEGER,
    in _fecha_asignacion DATETIME
    )
BEGIN
	update
		asignaciones_alumnos
	SET
        alumno_id = _alumno_id,
        curso_id = _curso_id,
        fecha_asignacion = _fecha_asignacion
	WHERE
		asignaciones_alumnos.id = _id;
END $$
DELIMITER ;

call sp_asignaciones_alumnos_update("1","2021001", 108, '2015-09-14 12:30');

#Delete
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignacion_delete $$
CREATE PROCEDURE sp_asignacion_delete(
	in _id INT
    )
BEGIN
	DELETE from
		asignaciones_alumnos
	WHERE
		asignaciones_alumnos.id = _id;
END $$
DELIMITER ;

call sp_asignacion_delete("10");
