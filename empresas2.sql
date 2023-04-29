-- Alberto Moisés Gerardo Lemus Alvarado
-- Código ténico: IN5BM
-- Grupo: 1/2
DROP DATABASE IF EXISTS empresas2;
CREATE DATABASE IF NOT EXISTS empresas2
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;
USE empresas2;
DROP DATABASE IF EXISTS telefono;
DROP DATABASE IF EXISTS regiones;
DROP DATABASE IF EXISTS departamento_empresa;
DROP DATABASE IF EXISTS tipos_empleados;
DROP DATABASE IF EXISTS departamentos_guate;
DROP DATABASE IF EXISTS oficinas;
DROP DATABASE IF EXISTS depto_emp_oficinas;
DROP DATABASE IF EXISTS empleados;

CREATE TABLE IF NOT EXISTS telefonos(
id_telefono INTEGER NOT NULL AUTO_INCREMENT,
numero_telefono VARCHAR(8), 
PRIMARY KEY (id_telefono)
);
CREATE TABLE IF NOT EXISTS regiones(
id_region INTEGER NOT NULL,
nombre_region VARCHAR(45),
PRIMARY KEY (id_region)
);
CREATE TABLE IF NOT EXISTS departamento_empresas(
id_departamento_empresa INTEGER NOT NULL,
nombre_depto_emp VARCHAR(45),
PRIMARY KEY (id_departamento_empresa)
);
CREATE TABLE IF NOT EXISTS tipos_empleados(
id_tipo_empleado INTEGER NOT NULL,
nombre_tipo_empleado VARCHAR(45),
sueldo_base DECIMAL(10,2),
bonificacion_ley DECIMAL(10,2),
bonificacion_empresa DECIMAL(10,2),
PRIMARY KEY (id_tipo_empleado)
);
CREATE TABLE IF NOT EXISTS departamentos_guate(
id_departamento_guate INTEGER NOT NULL,
nombre_depto_guate VARCHAR(45),
region_id INTEGER NOT NULL,
PRIMARY KEY (id_departamento_guate),
FOREIGN KEY (region_id) REFERENCES regiones(id_region) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS oficinas(
id_oficina INTEGER NOT NULL,
direccion VARCHAR(45),
departamento_guate_id INTEGER NOT NULL,
PRIMARY KEY (id_oficina),
FOREIGN KEY (departamento_guate_id) REFERENCES departamentos_guate (id_departamento_guate) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS depto_emp_oficinas(
id_depto_emp_oficina INTEGER NOT NULL,
departamento_empresa_id INTEGER NOT NULL,
oficina_id INTEGER NOT NULL,
telefono_id INTEGER NOT NULL,
PRIMARY KEY (id_depto_emp_oficina),
FOREIGN KEY (departamento_empresa_id)REFERENCES departamento_empresas (id_departamento_empresa) ON DELETE CASCADE ON UPDATE 
CASCADE,
FOREIGN KEY (oficina_id)REFERENCES oficinas (id_oficina) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (telefono_id)REFERENCES telefonos (id_telefono) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS empleados(
id_empleados INTEGER NOT NULL,
nombre VARCHAR(45),
apellido VARCHAR(45),
fecha_nacimiento DATE,
fecha_contratacion DATE,
telefono VARCHAR(8),
tipo_empleado_id INTEGER NOT NULL,
depto_emp_oficina_id INTEGER NOT NULL,
PRIMARY KEY (id_empleados),
FOREIGN KEY (tipo_empleado_id)REFERENCES tipos_empleados (id_tipo_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (depto_emp_oficina_id)REFERENCES depto_emp_oficinas (id_depto_emp_oficina) ON DELETE CASCADE ON UPDATE CASCADE
);
-- ---------------------------- DATOS INGRESADOS -----------------------------------
INSERT INTO telefonos(numero_telefono) VALUES (12345678);
INSERT INTO telefonos(numero_telefono) VALUES (87654321);
INSERT INTO telefonos(numero_telefono) VALUES (96325874);
INSERT INTO telefonos(numero_telefono) VALUES (14785236);
INSERT INTO telefonos(numero_telefono) VALUES (32145698);
INSERT INTO telefonos(numero_telefono) VALUES (89654123);
INSERT INTO telefonos(numero_telefono) VALUES (15987532);
INSERT INTO telefonos(numero_telefono) VALUES (35789518);
INSERT INTO telefonos(numero_telefono) VALUES (46825739);
INSERT INTO telefonos(numero_telefono) VALUES (64859762);
INSERT INTO telefonos(numero_telefono) VALUES (45544554);
INSERT INTO regiones(id_region,nombre_region) VALUES (1,"Metropolitana");
INSERT INTO regiones(id_region,nombre_region) VALUES (2,"Verapaz");
INSERT INTO regiones(id_region,nombre_region) VALUES (3,"Nororiente");
INSERT INTO regiones(id_region,nombre_region) VALUES (4,"Suroriente");
INSERT INTO regiones(id_region,nombre_region) VALUES (5,"Central");
INSERT INTO regiones(id_region,nombre_region) VALUES (6,"Suroccidente");
INSERT INTO regiones(id_region,nombre_region) VALUES (7,"Noroccidente");
INSERT INTO regiones(id_region,nombre_region) VALUES (8,"Peten");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(1,"departamento financiero");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(2,"departamento de recursos humanos");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(3,"departamento de marketing");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(4,"departamento comercial");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(5,"departamento de compras");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(6,"departamento de logistica y operaciones");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(7,"departamento de control de gestion");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(8,"direccion general");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(9,"comite de direccion");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(10,"valoracion de inventarios");
INSERT INTO departamento_empresas(id_departamento_empresa,nombre_depto_emp) VALUES(11,"departamento administrativo");
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(1,"director ejecutivo",'8000.00','2500.00','2000.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(2,"presidente",'7500.00','2300.00','1800.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(3,"visepresidente",'7400.00','2200.00','1700.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(4,"directores de departamento",'7000.00','2000.00','1500.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(5,"gerentes",'6700.00','1800.00','1200.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(6,"jefes",'6500.00','1600.00','1000.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(7,"supervisores",'6100.00','1300.00','800.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(8,"operarios",'5800.00','1000.00','700.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(9,"secretariado",'5000.00','900.00','600.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(10,"limpieza",'4000.00','800.00','500.00');
INSERT INTO tipos_empleados(id_tipo_empleado, nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa) 
VALUES(11,"proveedor",'37000.00','8000.00','5000.00');
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(1,"Guatemala",1);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(2,"Alta Verapaz",2);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(3,"Baja Verapaz",2);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(4,"Chiquimula",3);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(5,"El Progreso",3);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(6,"Izabal",3);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(7,"Zacapa",3);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(8,"Jutiapa",4);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(9,"Jalapa",4);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(10,"Santa Rosa",4);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(11,"Chimaltenango",5);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(12,"Sacatepequez",5);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(13,"Escuintla",5);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(14,"Quetzaltenango",6);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(15,"Retalhuleu",6);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(16,"San Marcos",6);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(17,"Suchitepequez",6);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(18,"Solola",6);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(19,"Totonicapan",6);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(20,"Huehuetenango",7);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(21,"Quiche",7);
INSERT INTO departamentos_guate(id_departamento_guate,nombre_depto_guate,region_id) 
VALUES(22,"Peten",8);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (1,"zona 1",1);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (2,"zona 10",3);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (3,"zona 12",5);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (4,"zona 14",7);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (5,"calle 12",9);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (6,"calle 5",11);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (7,"avenida 5",13);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (8,"avenida 1",15);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (9,"calle cristal",17);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (10,"avenida amarilla",19);
INSERT INTO oficinas(id_oficina,direccion,departamento_guate_id) VALUES (11,"avenida roja",12);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(1,9,2,3);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(2,8,1,9);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(3,7,5,10);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(4,5,4,6);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(5,6,6,7);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(6,3,3,4);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(7,4,8,2);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(8,2,9,1);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(9,10,7,8);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(10,1,10,5);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(11,11,9,6);
INSERT INTO depto_emp_oficinas(id_depto_emp_oficina,departamento_empresa_id,oficina_id,telefono_id) VALUES(12,9,11,11);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(1,"María Mireya","Acevedo Manríquez",'1985-6-3','2000-12-18',"51455152",9,1);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(2,"Tomás José","Acosta Canto",'1988-9-30','2000-10-11',"54562552",2,8);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(3,"María Ofelia","Aguilar Lemus",'1995-2-5','2003-7-28',"48859652",3,10);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(4,"Fredy Francisco","Aguilar Perez",'1986-1-2','2000-3-15',"48596251",10,7);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(5,"Fernanda Carolina","Alvarado Guerra",'1985-6-3','2000-12-18',"51455152",4,6);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(6,"Gerardo Genaro","Alarcon Lopez",'1995-5-5','2015-5-5',"55152535",5,5);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(7,"Jose Isarael","Alcantar Camacho",'1991-8-23','2010-5-17',"73548622",6,4);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(8,"Arturo Ramiro","Armaya Salvador",'1989-2-7','2005-1-11',"45852565",7,3);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(9,"Josue Benjamin","Hernandez de Leon",'1997-10-17','2019-5-25',"45352615",8,2);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(10,"Moises Gerardo","Lemus Alvarado",'2005-1-11','2022-1-29',"59865218",1,9);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(11,"Jorge Elias","Balan",'1975-12-18','2022-1-29',"68442651",11,11);
INSERT INTO empleados(id_empleados, nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, 
tipo_empleado_id,depto_emp_oficina_id) 
VALUES(12,"Gloria Esperanza","Gonzalez",'1975-4-13','2022-1-29',"15467253",11,11);
-- ------------------------------------------------------ CONSULTAS -------------------------------------------------------------
-- --------------------------------------------1) Nombre y edad de los empleados.--------------------------------------------------
SELECT nombre, apellido, fecha_nacimiento, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad" FROM empleados;
-- --------------------------------------------2) Fecha de contratación de cada empleado.--------------------------------------------------
SELECT nombre, apellido, fecha_contratacion FROM empleados;
-- --------------------------------------------3) Edades de los empleados. --------------------------------------------------
SELECT nombre, apellido, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad" FROM empleados;
-- --------------------------------------------4) Número de empleados que hay para cada una de las edades. ---------------------------------
SELECT COUNT(nombre) AS empleados, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad" FROM empleados group by edad;
-- --------------------------------------------5) Edad media de los empleados por departamento. ---------------------------------
SELECT YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad", de.nombre_depto_emp 
FROM empleados AS e INNER JOIN depto_emp_oficinas AS deo INNER JOIN departamento_empresas AS de 
on e.depto_emp_oficina_id=deo.id_depto_emp_oficina and deo.departamento_empresa_id=de.id_departamento_empresa group by(edad);
-- --------------------------------------------6) Tipos de Empleados que superan las 35.000 de salario. ---------------------------------
SELECT nombre_tipo_empleado, sueldo_base * 12 AS sueldo_anual FROM tipos_empleados;
-- -------------------------------------------- 7) Datos del empleado número X. ---------------------------------
SELECT * FROM empleados where id_empleados="5";
-- -------------------------------------------- 8) Empleados del departamento de empresa X. ---------------------------------
SELECT de.nombre_depto_emp, e.* 
FROM empleados AS e INNER JOIN depto_emp_oficinas AS deo INNER JOIN departamento_empresas AS de 
on e.depto_emp_oficina_id=deo.id_depto_emp_oficina and deo.departamento_empresa_id=de.id_departamento_empresa 
where de.id_departamento_empresa = "4";
-- -------------------------------------------- 9) Empleados cuya contratación se produjo en el año X. ---------------------------------
SELECT id_empleados, nombre, apellido, fecha_contratacion FROM empleados where YEAR(fecha_contratacion) = "2000";
-- ----10) Empleados que no sean jefe de Departamento (atributo nombre tipo empleado dentro de la entidad Tipos Empleados) X --------
SELECT e.nombre, e.apellido, te.nombre_tipo_empleado FROM empleados AS e INNER JOIN tipos_empleados AS te 
ON e.tipo_empleado_id=te.id_tipo_empleado WHERE nombre_tipo_empleado <> "jefes";
-- -------------------------------------------11) Empleados contratados entre los años X y X ------------------------------------------
SELECT nombre, apellido, fecha_contratacion FROM empleados WHERE fecha_contratacion BETWEEN '2000-1-1' AND '2010-12-31';
-- ----------------------12) Tipos de Empleado que tienen un salario superior a 35.000 e inferior a 40.000 --------------------------
SELECT nombre_tipo_empleado, sueldo_base FROM tipos_empleados WHERE sueldo_base BETWEEN '35000' AND '40000';
 -- -----------------------------------13) Empleados cuyo tipo de empleado es director o jefe de sección --------------------------
SELECT e.nombre, e.apellido, te.nombre_tipo_empleado FROM empleados AS e INNER JOIN tipos_empleados AS te 
ON e.tipo_empleado_id = te.id_tipo_empleado WHERE nombre_tipo_empleado = "jefes";
-- -----------------------------------------------------14) Empleados de nombre 'Jose'. ----------------------------------------------
SELECT nombre, apellido, telefono FROM empleados WHERE nombre LIKE "%Jose%";
-- -----------Empleados que pertenecen al departamento administrativo y que tienen una edad mayor a 35 años.----------------------
SELECT e.nombre, e.apellido, e.fecha_nacimiento, de.nombre_depto_emp, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad"
FROM empleados AS e INNER JOIN depto_emp_oficinas AS deo INNER JOIN departamento_empresas AS de
ON e.depto_emp_oficina_id=deo.id_depto_emp_oficina AND deo.departamento_empresa_id=id_departamento_empresa 
WHERE de.nombre_depto_emp="departamento administrativo" and YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) > "35";
-- ---------------------------------------16) Empleados que no pertenecen al departamento de la empresa X---------------------------------
SELECT e.nombre, e.apellido, de.nombre_depto_emp
FROM empleados AS e INNER JOIN depto_emp_oficinas AS deo INNER JOIN departamento_empresas AS de
ON e.depto_emp_oficina_id=deo.id_depto_emp_oficina AND deo.departamento_empresa_id=id_departamento_empresa
WHERE nombre_depto_emp <> "departamento de compras";
-- ---------------------------------------17) Nombre y edad de los empleados ordenados de menor a mayor edad.---------------------------------
SELECT nombre, apellido, fecha_nacimiento, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad" FROM empleados ORDER BY(edad) ;
-- --------------------------------18) Nombre y edad de los empleados ordenados por nombre de forma descendente.------------------------
SELECT nombre, apellido, fecha_nacimiento, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad" FROM empleados ORDER BY(nombre) 
desc ;
-- ------------------------------19) Nombre del empleado y el departamento de la empresa en la que trabaja. ------------------------
SELECT e.nombre, e.apellido, de.nombre_depto_emp AS departamento_empresa
FROM empleados AS e INNER JOIN depto_emp_oficinas AS deo INNER JOIN departamento_empresas AS de
ON e.depto_emp_oficina_id=deo.id_depto_emp_oficina AND deo.departamento_empresa_id=id_departamento_empresa;
-- ------------------------20) Código y teléfonos de los departamentos de las oficinas de la región 'Centro'.-------------------------
SELECT deo.id_depto_emp_oficina, t.numero_telefono, dg.nombre_depto_guate 
FROM telefonos AS t INNER JOIN depto_emp_oficinas AS deo INNER JOIN oficinas AS o INNER JOIN departamentos_guate AS dg INNER JOIN 
regiones AS r
ON t.id_telefono=deo.telefono_id AND deo.oficina_id=o.id_oficina AND o.departamento_guate_id=dg.id_departamento_guate AND 
dg.region_id=r.id_region
WHERE r.nombre_region= "Central" ORDER BY(id_depto_emp_oficina) asc;
-- -----------------------------21) Nombre del empleado y departamento de Guatemala en el quetrabaja.-----------------------
SELECT e.nombre,e.apellido, dg.nombre_depto_guate 
FROM telefonos AS t INNER JOIN depto_emp_oficinas AS deo INNER JOIN oficinas AS o INNER JOIN departamentos_guate AS dg INNER JOIN 
empleados AS e
ON t.id_telefono=deo.telefono_id AND deo.oficina_id=o.id_oficina AND o.departamento_guate_id=dg.id_departamento_guate 
AND e.depto_emp_oficina_id=deo.id_depto_emp_oficina;
-- ----------------------------------------22) Sueldo de cada empleado y sus bonificaciones.-----------------------
SELECT e.nombre, e.apellido, te.sueldo_base + te.bonificacion_ley + te.bonificacion_empresa AS sueldo_total
FROM empleados AS e INNER JOIN tipos_empleados AS te ON e.tipo_empleado_id=te.id_tipo_empleado;
-- ------------------------------------23) Nombre de los empleados y de sus jefes de departamento.-----------------------
SELECT e.nombre, e.apellido, de.nombre_depto_emp AS departamento_empresa, te.nombre_tipo_empleado
FROM empleados AS e INNER JOIN depto_emp_oficinas AS deo INNER JOIN departamento_empresas AS de INNER JOIN tipos_empleados AS te
ON e.depto_emp_oficina_id=deo.id_depto_emp_oficina AND deo.departamento_empresa_id=id_departamento_empresa 
AND e.tipo_empleado_id=te.id_tipo_empleado;
-- ----------------------------------24) Suma del sueldo de los empleados, sin la bonificación----------------------
SELECT SUM(sueldo_base) FROM tipos_empleados;
-- ------------------------------------------25) Promedio del sueldo, sin contar bonificación---------------------
SELECT sueldo_base, sueldo_base/30 AS promedio_por_dia FROM tipos_empleados;
-- ----------------------------26) Salarios máximo y mínimo de los empleados, incluyendo bonificación. -----------------
SELECT empleados.nombre, empleados.apellido, sueldo_base + bonificacion_ley + bonificacion_empresa AS sueldo_total 
FROM tipos_empleados INNER JOIN empleados
ON empleados.tipo_empleado_id=tipos_empleados.id_tipo_empleado ORDER BY(sueldo_total) DESC;
SELECT empleados.nombre, empleados.apellido, sueldo_base + bonificacion_ley + bonificacion_empresa AS sueldo_total 
FROM tipos_empleados INNER JOIN empleados
ON empleados.tipo_empleado_id=tipos_empleados.id_tipo_empleado ORDER BY(sueldo_total) ASC;
-- ----------------------------------------------27) Número de empleados que superan los 40 años. -----------------------------------
SELECT COUNT(nombre) AS numero_empleados, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad"
FROM empleados AS e WHERE YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) > "40";
-- -----------------------------------------28) Número de edades diferentes que tienen los empleados--------------------------------
SELECT COUNT(nombre) AS numero_empleados, YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento) AS "edad" 
FROM empleados GROUP BY (edad) ORDER BY (numero_empleados) DESC