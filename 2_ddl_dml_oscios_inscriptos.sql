CREATE DATABASE IF NOT EXISTS administracion2 
DEFAULT CHARACTER SET utf8  
DEFAULT COLLATE utf8_general_ci;

USE administracion2;

-- 1- Elimine las tablas si existen
DROP TABLE IF EXISTS socios;
DROP TABLE IF EXISTS inscritos;

-- 2- Cree las tablas:
 create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

 create table inscritos(
  documento char(8) not null, 
  deporte varchar(15) not null,
  año year,
  matricula char(1), /*si esta paga ='s' sino 'n'*/
  primary key(documento,deporte,año)
 );

-- 3- Ingrese algunos registros para ambas tablas:
 insert into socios values('22333444','Juan Perez','Colon 234');
 insert into socios values('23333444','Maria Lopez','Sarmiento 465');
 insert into socios values('24333444','Antonio Juarez','Caseros 980');

 insert into inscritos values ('22333444','natacion','2005','s');
 insert into inscritos values ('22333444','natacion','2006','n');
 insert into inscritos values ('23333444','natacion','2005','s');
 insert into inscritos values ('23333444','tenis','2006','s');
 insert into inscritos values ('23333444','natacion','2006','s');
 insert into inscritos values ('24333444','tenis','2006','n');
 insert into inscritos values ('24333444','basquet','2006','n');
 insert into inscritos values ('24333444','basquet','2022','n');
  insert into inscritos values ('22333444','tenis','2022','n');
  
SELECT * FROM socios;
SELECT * FROM inscritos;

-- muestre el nombre del socio y todos los campos de la tabla "inscritos"

select socios.nombre, inscritos.* from socios inner join inscritos on socios.documento=inscritos.documento;

select socios.nombre, inscritos.* from socios left join inscritos on socios.documento=inscritos.documento;

select socios.nombre, inscritos.* from socios right join inscritos on socios.documento=inscritos.documento;

-- mostrar el nombre de los socios  

select socios.nombre, inscritos.deporte from socios inner join inscritos on socios.documento=inscritos.documento
where año = 2022;

-- con año en el que estamos
select socios.nombre, inscritos.deporte from socios inner join inscritos on socios.documento=inscritos.documento
where año = date_format(now(),'%Y');

-- la hora, minuto y segundo en el que estamos
select date_format(now(),'%h:%i:%s') as hora;






