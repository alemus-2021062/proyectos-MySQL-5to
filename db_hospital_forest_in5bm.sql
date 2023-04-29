/*
Nombres:
	Alberto Moises Gerardo Lemus Alvarado 2021062
	Jhonatan Jose Acalón Ajanel 2021048
    Christofer Geovanni Quel Guerra 2021006
    Henry Donaldo Sanúm Barrios  2021061
    Juan Pablo Cáceres Enriquez 2017499
*/

DROP DATABASE IF EXISTS db_hospital_forest_in5bm;
CREATE DATABASE IF NOT EXISTS db_hospital_forest_in5bm
DEFAULT CHARACTER SET UTF8MB4 
DEFAULT COLLATE UTF8MB4_0900_AI_CI;

USE db_hospital_forest_in5bm;

DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS persona;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS horarios;
DROP TABLE IF EXISTS especialidades;
DROP TABLE IF EXISTS doctores;
DROP TABLE IF EXISTS pacientes;
DROP TABLE IF EXISTS edificios;
DROP TABLE IF EXISTS habitaciones;
DROP TABLE IF EXISTS citas;
DROP TABLE IF EXISTS medicamentos;
DROP TABLE IF EXISTS recetas;

CREATE TABLE IF NOT EXISTS roles(
	id_rol INT NOT NULL AUTO_INCREMENT,
	tipo_rol VARCHAR(45) NOT NULL,
	CONSTRAINT pk_rol PRIMARY KEY (id_rol)
);

CREATE TABLE IF NOT EXISTS personas(
	id_persona INT NOT NULL AUTO_INCREMENT,
	nombre1 VARCHAR(16) NOT NULL,
	nombre2 VARCHAR(16) NULL,
	nombre3 VARCHAR(16) NULL,
	apellido1 VARCHAR(16) NOT NULL,
	apellido2 VARCHAR(16) NULL,
	sexo CHAR(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    correo_electronico VARCHAR(40) NOT NULL,
    telefono VARCHAR(8) NOT NULL,
    CONSTRAINT pk_persona PRIMARY KEY (id_persona)
);

CREATE TABLE IF NOT EXISTS usuarios(
	user VARCHAR(45) NOT NULL,
    pass VARCHAR(45) NOT NULL,
    rol_id INT NOT NULL,
    persona_id INT NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (user),
    CONSTRAINT fk_usuario_rol 
		FOREIGN KEY (rol_id) 
        REFERENCES roles(id_rol)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS horarios(
	id_horario INT NOT NULL AUTO_INCREMENT,
    horario_inicio TIME NOT NULL,
    horario_final TIME NOT NULL,
    lunes BOOLEAN NULL,
    martes BOOLEAN NULL,
    miercoles BOOLEAN NULL,
    jueves BOOLEAN NULL,
    viernes BOOLEAN NULL,
    sabado BOOLEAN NULL,
    domingo BOOLEAN NULL,
    CONSTRAINT pk_horarios PRIMARY KEY (id_horario)
);

CREATE TABLE IF NOT EXISTS especialidades(
	id_especialidad INT NOT NULL AUTO_INCREMENT,
	nombre_especialidad VARCHAR(25) NOT NULL,
    CONSTRAINT pk_especialidades PRIMARY KEY (id_especialidad)
);

CREATE TABLE IF NOT EXISTS doctores(
    id_doctor INT NOT NULL AUTO_INCREMENT,
    horario_id INT NOT NULL,
    persona_id INT NOT NULL,
    especialidad_id INT NOT NULL,
    PRIMARY KEY pk_doctor (id_doctor),
    CONSTRAINT fk_doctores_horarios 
		FOREIGN KEY (horario_id)
		REFERENCES horarios (id_horario)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_doctores_personas
		FOREIGN KEY (persona_id)
        REFERENCES personas (id_persona)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_doctores_especialidades 
		FOREIGN KEY (especialidad_id)
		REFERENCES especialidades (id_especialidad)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pacientes(
	id_paciente INT NOT NULL AUTO_INCREMENT,
    seguro_medico INT NULL,
	contacto_emergencia VARCHAR(8) NOT NULL,
	persona_id INT NOT NULL,
	CONSTRAINT pk_pacientes PRIMARY KEY (id_paciente),
    CONSTRAINT fk_pacientes_personas
		FOREIGN KEY (persona_id)
        REFERENCES personas (id_persona)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS edificios(
	id_edificio INT NOT NULL AUTO_INCREMENT,
    nombre_edificio VARCHAR(30) NOT NULL,
    CONSTRAINT pk_edificios PRIMARY KEY (id_edificio)
);

CREATE TABLE IF NOT EXISTS habitaciones(
	id_habitacion INT NOT NULL AUTO_INCREMENT,
	nivel INT,	
	ocupado BOOLEAN,
    edificio_id INT NOT NULL,
	CONSTRAINT pk_habitaciones PRIMARY KEY (id_habitacion),
    CONSTRAINT fk_habitaciones_edificios
		FOREIGN KEY (edificio_id)
        REFERENCES edificios (id_edificio)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS citas(
	id_cita INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(250),
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    doctor_id INT NOT NULL,
    paciente_id INT NOT NULL,
    habitacion_id INT NOT NULL,    
    CONSTRAINT pk_citas PRIMARY KEY (id_cita),
    CONSTRAINT fk_citas_doctores
		FOREIGN KEY (doctor_id)
        REFERENCES doctores (id_doctor)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_citas_pacientes
		FOREIGN KEY (paciente_id)
        REFERENCES pacientes (id_paciente)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_citas_habitaciones
		FOREIGN KEY (habitacion_id)
        REFERENCES habitaciones (id_habitacion)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS medicamentos(
    id_medicamento INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    descripcion VARCHAR(150) NULL,
    fecha_caducidad DATE NOT NULL,
    CONSTRAINT pk_medicamentos PRIMARY KEY (id_medicamento)
);

CREATE TABLE IF NOT EXISTS recetas(
	id_recetas INT NOT NULL AUTO_INCREMENT,
    dosis_recomendada VARCHAR(50),
    medicamento_id INT NOT NULL,
    cita_id INTEGER NOT NULL,
    CONSTRAINT pk_recetas PRIMARY KEY (id_recetas),
    CONSTRAINT fk_recetas_medicamentos
		FOREIGN KEY (medicamento_id) 
        REFERENCES medicamentos (id_medicamento) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_recetas_citas
		FOREIGN KEY (cita_id) 
        REFERENCES citas (id_cita)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- ----------------------------------------------- INSERCIONES -------------------------------------
-- ----------------------------------------------- ROLES ---------------------------------------
INSERT INTO roles(tipo_rol)
VALUES("Administrador");
INSERT INTO roles(tipo_rol)
VALUES("Doctor");
INSERT INTO roles(tipo_rol)
VALUES("Paciente");

-- ----------------------------------------------- PERSONAS ---------------------------------------
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Henry', 'Donaldo', '' , 'Sanum', 'Aldana', 'M', '2000-06-15', 'prsona1@gmail.com', '38728912');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Alberto', 'Moises', '' , 'Lemus', 'Alvarado', 'M', '1998-04-11', 'prsona2@gmail.com', '78659834');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Maria', 'Antonieta', '' , 'Mares', 'De los Santos', 'F', '1988-05-8', 'prsona2@gmail.com', '78548732');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Mario', 'Luigi', '' , 'Santos', '', 'M', '2002-12-21', 'prsona3@gmail.com', '54784398');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Josue', 'Marisio', '' , 'Jolon', 'Del Rio', 'M', '1999-08-17', 'prsona4@gmail.com', '90212189');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Carlos', 'Jose', 'Tito' , 'Quintones', 'Pesado', 'M', '1997-12-12', 'prsona5@gmail.com', '87438754');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Jorge', 'Torino', '' , 'Salazar', 'De los montes', 'M', '1999-02-3', 'prsona6@gmail.com', '90769090');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Javier', 'Alexander', '' , 'Beltran', 'Rios', 'M', '1998-05-9', 'prsona7@gmail.com', '43654354');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Karla', 'Rohena', '' , 'Sanum', 'Sanabria', 'F', '1988-09-5', 'prsona8@gmail.com', '67654910');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Consuelo', '', 'Carcajadas' , 'Duval', 'Conrol', 'F', '1999-09-9', 'prsona9@gmail.com', '40923843');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Athena', 'Polo', '' , 'Wrigth', 'Omon', 'F', '1998-08-15', 'prsona0@gmail.com', '87545498');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Diego','Pedro', 'Pablo', 'Perez',' Lopez', 'M','1990-05-16', 'dperez-20220012@kinal.edu.gt', '59691650');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Nicolás','Daniel', '', 'García',' González', 'M','1989-09-19','firela7014@offsala.com','87654321');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Matías','Gabriel', 'Antonio', 'Rodríguez',' Fernández', 'M','2000-09-04','mariasrodriguez@kinal.edu.gt','43215678');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('David','', '', 'López',' Lopez', 'M','1990-10-08', 'Adela.1984@tuempresa.com','21346578');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Carlos','Alexander', 'Marcelo', 'Sánchez',' Martínez', 'M','1999-09-24', 'acarlos@gmail.com','12564378');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Benjamín','Leonardo', '', 'Diaz',' Vázquez', 'M','1990-11-09','benjamindiaz@kinal.edu.gt','18273645');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Juan','Pablo', 'Mark', 'Blanco',' Molina', 'M','2001-09-09', 'pabloblanco@kinal.edu.gt','65478123');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Juan','Manuel', '', 'Ortega',' Delgado', 'M','1999-09-04', 'manuelortega@kinal.edu.gt','12349876');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Luca','Josué', 'Carter', 'Castro',' Ortiz', 'M','1969-09-09', 'lucacastro@kinal.edu.gt','67891234');
INSERT INTO personas(nombre1, nombre2, nombre3, apellido1, apellido2, sexo, fecha_nacimiento, correo_electronico, telefono)
VALUES('Ángel','Mateo', 'Chase', 'Castillo',' Santos', 'M','1995-06-13', 'angelm@kinal.edu.gt','77889944');

-- --------------------------------------------- USUARIOS ---------------------------------------
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("hsanum","admin",1,1);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("alemus","12345",2,2);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("mmares","54321",2,3);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("msantos","65432",2,4);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("jjolon","23456",2,5);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("cquintones","98765",2,6);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("jsalazar","56789",2,7);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("jbeltran","76543",2,8);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("ksanum","34567",2,9);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("cduval","01234",2,10);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("awright","43210",2,11);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("dperez","67891",3,12);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("ngarcia","19876",3,13);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("mrodriguez","carnet",3,14);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("dlopez","registro",3,15);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("csanchez","131415",3,16);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("bdiaz","151413",3,17);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("jblanco","123456789",3,18);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("jortega","987654321",3,19);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("lcastro","19181716",3,20);
INSERT INTO usuarios(user,pass,rol_id,persona_id)
VALUES("acastillo","16171819",3,21);

-- --------------------------------------------- HORARIOS ---------------------------------------
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('5:00','21:00',1,0,0,1,1,1,0);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('6:00','20:00',0,1,1,0,0,1,1);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('9:00','23:00',0,0,0,1,1,1,1);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('5:30','20:30',1,1,0,0,1,1,0);    
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('3:00','18:00',1,1,0,0,0,1,1);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('4:30','19:30',1,0,1,0,1,0,1);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('11:00','1:00',0,1,0,1,0,1,0);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('18:00','4:00',1,1,0,1,1,1,0);  
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('15:30','2:30',0,1,1,1,1,0,0);
INSERT INTO horarios(horario_inicio, horario_final, lunes, martes, miercoles, jueves, viernes, sabado, domingo) 
VALUES ('20:00','8:00',1,0,0,0,0,1,0);

-- --------------------------------------------- ESPECIALIDADES ---------------------------------------
INSERT INTO especialidades(nombre_especialidad)
VALUES("Pediatría");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Odontología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Cardiología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Endocrinología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Reumatología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Traumatología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Neumología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Nefrología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Dermatología");
INSERT INTO especialidades(nombre_especialidad)
VALUES("Geriatría");

-- --------------------------------------------- DOCTORES ---------------------------------------
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(1,2,10);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(2,3,9);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(3,4,8);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(4,5,7);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(5,6,6);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(6,7,5);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(7,8,4);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(8,9,3);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(9,10,2);
INSERT INTO doctores(horario_id,persona_id,especialidad_id)
VALUES(10,11,1);

-- --------------------------------------------- PACIENTES ---------------------------------------
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id)
VALUES(12345,'47382812',12);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id)
VALUES(67890,'36384182',13);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id) 
VALUES(63722,'64738291',14);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id)
VALUES(18363,'46473281',15);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id) 
VALUES(93845,'97654322',16);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id)
VALUES(92921,'65647321',17);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id) 
VALUES(12123,'97854321',18);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id)
VALUES(56433,'12345678',19);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id)
VALUES(85944,'27364918',20);
INSERT INTO pacientes(seguro_medico, contacto_emergencia, persona_id) 
VALUES(57864,'65542367',21);

-- --------------------------------------------- EDIFICIOS ---------------------------------------
INSERT INTO edificios(nombre_edificio)
VALUES("Edificio Norte");
INSERT INTO edificios(nombre_edificio)
VALUES("Edificio Sur");
INSERT INTO edificios(nombre_edificio)
VALUES("Edificio Abeto");
INSERT INTO edificios(nombre_edificio)
VALUES("Edificio Roble");
INSERT INTO edificios(nombre_edificio)
VALUES("Edificio Pino");

-- --------------------------------------------- HABITACIONES ---------------------------------------
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(1,1,1);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(2,0,2);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(3,1,3);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(4,0,2);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(2,1,3);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(4,0,1);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(1,1,2);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(1,0,3);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(3,1,1);
INSERT INTO habitaciones(nivel, ocupado, edificio_id)
VALUES(1,0,2);


-- ----------------------------------------------- CITAS --------------------------------------------------------------
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Revision general",'2015-05-08','21:38',1,10,10);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Revision general",'2022-08-12','14:37',2,9,9);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Revision dental",'2022-12-07','16:28',3,8,1);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Revision corazón",'2021-10-09','17:23',4,7,2);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Hueso roto",'2000-01-09','13:00',5,6,3);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Hinchazon en la piel",'2016-10-07','19:30',6,5,4);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Fiebre",'2020-01-04','20:00',7,4,6);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Dolor de espalda",'2013-09-01','19:00',8,3,5);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Dificultad al respirar",'2010-09-03','12:00',9,2,7);
INSERT INTO citas(descripcion,fecha,hora,doctor_id,paciente_id,habitacion_id)
VALUES("Hipotiroidismo",'2010-01-01','16:05',10,1,8);

 -- --------------------------------------------- MEDICAMENTOS ------------------------------------------ 
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Acetaminofen','Analgésicos','2025-06-10');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Simvastatina','Inhibidores de la HMG-CoA','2032-05-10');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Aspirina','Salicilatos','2040-06-30');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Omeprazol','Inhibidores de la bomba de protones','2024-08-12');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Lexotiroxina sódica','Tratar el hipotiroidismo','2030-04-11');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Ramipril','Tratar la hipertensión','2025-02-03');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Amlodipina','Para la hipertensión y la angina','2045-01-15');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Paracetamol','Analgésicos y antipiréticos','2034-09-20');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Salbutamol','Broncodilatador','2038-07-10');
INSERT INTO medicamentos (nombre, descripcion, fecha_caducidad) 
VALUES ('Lansoprazol','Inhibidores de la bomba de protones','2023-07-18');

-- ----------------------------------------------- RECETAS --------------------------------------------------------------
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 cada 24 horas",1 ,10);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("2 cada semana",2 ,9);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 cada 6 horas",3 ,8);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 cada 12 horas",4 ,7);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 cada hora",5 ,6);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 dosis despues de comer",6 ,5);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 cada mañana",7, 4);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 antes de dormir",8 ,3);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 en ayunas",9 ,2);
INSERT INTO recetas (dosis_recomendada, medicamento_id, cita_id) 
VALUES("1 cuando sienta sintomas",10 ,1); 