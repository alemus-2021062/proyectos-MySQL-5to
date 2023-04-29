CREATE DATABASE IF NOT EXISTS administracion5
DEFAULT CHARACTER SET utf8  
DEFAULT COLLATE utf8_general_ci;

USE administracion5;
drop table IF EXISTS comidas;

 -- Creamos la tabla "comidas" con la siguiente estructura:
 create table IF NOT EXISTS comidas(
  codigo tinyint unsigned auto_increment,
  nombre varchar(30),
  rubro varchar(20),/*plato principal y postre*/
  precio decimal (5,2) unsigned,
  primary key(codigo)
 );

 -- Ingresamos algunos registros:
 insert into comidas values(1,'milanesa y fritas','plato principal',30.4);
 insert into comidas values(2,'arroz primavera','plato principal',20.5);
 insert into comidas values(3,'pollo','plato principal',20.8);
 insert into comidas values(4,'flan','postre',1);
 insert into comidas values(5,'porcion de torta','postre',20.1);
 insert into comidas values(6,'gelatina','postre',8);
 
 -- obtener la combinacion de platos y postres 
 
 select c.nombre, c.precio, p.nombre, p.precio from comidas as c cross join comidas as p
 where c.rubro = "plato principal" and p.rubro= "postre";
 