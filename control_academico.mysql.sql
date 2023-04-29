drop database if exists control_academico_in5bm;
create database control_academico_in5bm;
use control_academico_in5bm;

drop table if exists alumnos;
create table if not exists alumnos(
carne varchar(16) not null,
apellidos varchar(45),
nombres varchar(45),
email varchar(32),
primary key (carne)
);

drop table if exists horarios;
create table if not exists horarios(
id_horarios integer not null auto_increment,
horarios_final time,
horario_inicio time, 
primary key (id_horarios)
);

drop table if exists salones;
create table if not exists salones(
id_salones integer not null auto_increment,
capacidad integer,
descripcion varchar(255),
nombre_salon varchar(255),
primary key (id_salones)
);

drop table if exists carreras_tecnicas;
create table if not exists carreras_tecnicas(
id_carreras varchar(128),
nombre varchar(45),
primary key (id_carreras)
);

drop table if exists instructores;
create table if not exists instructores(
id_instructores integer not null auto_increment,
apellidos varchar(45),
nombres varchar(45),
direccion varchar(45),
telefono varchar(45),
primary key (id_instructores)
);

drop table if exists cursos;
create table if not exists cursos(
id_cursos integer not null auto_increment,
ciclo year,
cupo_maximo integer,
cupo_minimo integer,
descripcion varchar(255),
carreras_tecnicas_id varchar(128),
horarios_id integer,
instructores_id integer,
salones_id integer,
primary key (id_cursos),
constraint fk_cursos_carreras_tecnicas foreign key (carreras_tecnicas_id) references carreras_tecnicas (id_carreras)
on delete cascade on update cascade,
constraint fk_cursos_horarios foreign key (horarios_id) references horarios (id_horarios)
on delete cascade on update cascade,
constraint fk_cursos_instructores foreign key (instructores_id) references instructores (id_instructores) 
on delete cascade on update cascade,
constraint fk_cursos_salones foreign key (salones_id) references salones (id_salones)
);

drop table if exists asignaciones_alumnos;
create table if not exists asignaciones_alumnos(
id_asignaciones varchar(45),
alumno_carne varchar(16),
curso_id integer,
fecha_asignacion datetime,
primary key (id_asignaciones),
constraint fk_asignaciones_cursos foreign key (curso_id) references cursos(id_cursos)
on delete cascade on update cascade,
constraint fk_asignaciones_alumnos foreign key (alumno_carne) references alumnos(carne)
on delete cascade on update cascade
);

insert into alumnos(carne,apellidos,nombres,email)
values("2021001","lemus","moises","moises@gmail.com");
insert into alumnos(carne,apellidos,nombres,email)
values("2021002","alvarado","alberto","alberto@gmail.com");
insert into alumnos(carne,apellidos,nombres,email)
values("2021003","de leon","gerardo","gerardo@gmail.com");
insert into alumnos(carne,apellidos,nombres,email)
values("2021004","hernandez","benjamin","benjamin@gmail.com");
insert into alumnos(carne,apellidos,nombres,email)
values("2021005","lopez","randy","randy@gmail.com");

insert into horarios(horarios_final,horario_inicio)
values('12:00','07:00');
insert into horarios(horarios_final,horario_inicio)
values('12:05','07:05');
insert into horarios(horarios_final,horario_inicio)
values('12:10','07:10');
insert into horarios(horarios_final,horario_inicio)
values('12:15','07:15');
insert into horarios(horarios_final,horario_inicio)
values('12:20','07:20');

insert into salones(capacidad,descripcion,nombre_salon)
values(45,"grande","A1");
insert into salones(capacidad,descripcion,nombre_salon)
values(40,"espacioso","A2");
insert into salones(capacidad,descripcion,nombre_salon)
values(30,"mediano","B1");
insert into salones(capacidad,descripcion,nombre_salon)
values(25,"mediano","B2");
insert into salones(capacidad,descripcion,nombre_salon)
values(10,"pequeño","C1");

insert into carreras_tecnicas(id_carreras,nombre)
values("in4am","informatica");
insert into carreras_tecnicas(id_carreras,nombre)
values("me4bm","mecanica");
insert into carreras_tecnicas(id_carreras,nombre)
values("md4cm","medicina");
insert into carreras_tecnicas(id_carreras,nombre)
values("el4dm","electronica");
insert into carreras_tecnicas(id_carreras,nombre)
values("mu4em","musica");

insert into instructores (apellidos,nombres,direccion,telefono)
values("lopez","stuart","mezquital","54653212");
insert into instructores (apellidos,nombres,direccion,telefono)
values("nordes","pablo","villa nueva","14485951");
insert into instructores (apellidos,nombres,direccion,telefono)
values("hernandez","grif","cayala","65322563");
insert into instructores (apellidos,nombres,direccion,telefono)
values("guarnizo","juan","villa lobos","85258964");
insert into instructores (apellidos,nombres,direccion,telefono)
values("garza","abril","peten","13467925");

insert into cursos(ciclo,cupo_maximo,cupo_minimo,descripcion,carreras_tecnicas_id,horarios_id,instructores_id,salones_id)
values(2009,100,50,"duro","mu4em",1,5,1);
insert into cursos(ciclo,cupo_maximo,cupo_minimo,descripcion,carreras_tecnicas_id,horarios_id,instructores_id,salones_id)
values(2010,150,100,"cardiaco","el4dm",5,1,5);
insert into cursos(ciclo,cupo_maximo,cupo_minimo,descripcion,carreras_tecnicas_id,horarios_id,instructores_id,salones_id)
values(2011,200,150,"nocturno","me4bm",2,4,2);
insert into cursos(ciclo,cupo_maximo,cupo_minimo,descripcion,carreras_tecnicas_id,horarios_id,instructores_id,salones_id)
values(2012,250,200,"matutino","in4am",4,2,4);
insert into cursos(ciclo,cupo_maximo,cupo_minimo,descripcion,carreras_tecnicas_id,horarios_id,instructores_id,salones_id)
values(2013,300,250,"vespertino","md4cm",3,3,3);

insert into asignaciones_alumnos (id_asignaciones,alumno_carne,curso_id,fecha_asignacion)
values("asig1","2021001",2,'2009-05-01');
insert into asignaciones_alumnos (id_asignaciones,alumno_carne,curso_id,fecha_asignacion)
values("asig2","2021002",1,'2010-05-01');
insert into asignaciones_alumnos (id_asignaciones,alumno_carne,curso_id,fecha_asignacion)
values("asig3","2021003",3,'2011-05-01');
insert into asignaciones_alumnos (id_asignaciones,alumno_carne,curso_id,fecha_asignacion)
values("asig4","2021004",4,'2012-05-01');
insert into asignaciones_alumnos (id_asignaciones,alumno_carne,curso_id,fecha_asignacion)
values("asig5","2021005",5,'2013-05-01');

update alumnos set nombres="Alan", apellidos="masariegos" where carne="2021002";
update horarios set horarios_final = '12:25' where id_horarios = "5";
update salones set capacidad = 15 where id_salones = 5;
update carreras_tecnicas set nombre = "artes musicales" where id_carreras="mu4em";
update instructores set apellidos = "douglas", nombres = "ruben" where id_instructores = "2";
update cursos set ciclo = 2008, cupo_maximo = 125 where id_cursos = 2;
update asignaciones_alumnos set fecha_asignacion = '2008-01-12' where id_asignaciones = "asig1";

delete from alumnos where carne="2021004";
delete from horarios where id_horarios="3";
delete from salones where id_salones="3";
delete from carreras_tecnicas where id_carreras="md4cm";
delete from instructores where id_instructores="3";
delete from cursos where id_cursos = 4;
delete from asignaciones_alumnos where id_asignaciones = "asig3";

select alumnos.carne, alumnos.apellidos, alumnos.nombres from alumnos;
select horarios.horarios_final, horarios.horario_inicio from horarios;
select salones.capacidad, salones.descripcion from salones;
select carreras_tecnicas.id_carreras, carreras_tecnicas.nombre from carreras_tecnicas;
select instructores.apellidos, instructores.nombres, instructores.direccion from instructores;
select cursos.ciclo, cursos.cupo_maximo, cursos.cupo_minimo from cursos;
select asignaciones_alumnos.id_asignaciones, asignaciones_alumnos.fecha_asignacion from asignaciones_alumnos;