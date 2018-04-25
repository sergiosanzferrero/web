
/*Borramos tabla si existía anteriormente*/
DROP DATABASE IF EXISTS cartimedb;


/*Creamos la tabla*/
CREATE DATABASE cartimedb;


/*Seleccionamos la tabla*/
USE cartimedb;


/*Creamos las tablas*/
CREATE TABLE usuarios
(
    dni VARCHAR (50),
    nombre VARCHAR (50),
    apellidos VARCHAR (50),
    email VARCHAR (50),
    password VARCHAR (50),
    telefono VARCHAR (50),
    PRIMARY KEY (dni)
);

CREATE TABLE plazas
(
    id VARCHAR (50),
    direccion VARCHAR (300),
    tipo VARCHAR (50),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    descripcion VARCHAR (1000),
    img VARCHAR (100),
    PRIMARY KEY (id)
);

CREATE TABLE publicaciones
(
    id VARCHAR(50),
    dni VARCHAR(50),
    precioDia float,
    precioSemana float,
    horario VARCHAR(50),
    PRIMARY KEY (id,dni),
    FOREIGN KEY (id) references plaza(id),
    FOREIGN KEY (dni) references usuario(dni)
);

CREATE TABLE reservas
(
    id VARCHAR(50),
    dni VARCHAR(50),
    fechaInicio VARCHAR(50),
    fechaFin VARCHAR(50),
    PRIMARY KEY(id,dni,fechaInicio),
    FOREIGN KEY (id) references plaza(id),
    FOREIGN KEY (dni) references usuario(dni)
);

/*Añadimos usuarios*/
insert into usuarios values('71156437P','Pedro','Duque Garcia','pedroduque@gmail.com','pedro', '654784656');
insert into usuarios values('71456778E','Raul','Garcia Arranz','raul@gmail.com','raul', '666777888');
insert into usuarios values('11159437S','Jaime','Sanz Martin','pedroduque@gmail.com','edgar','698765432');
insert into usuarios values('14278937W','Pedra','Duque Perez','pedro@gmail.com','duquegar','612345678');

/*Añadimos plazas*/
insert into plazas values('1','Miguel Delibes 8, Valladolid','camion',40.71727401, -74.00898606,'Plaza para camiones en las afueras de Valladolid','/Imagenes/plazas/parking1.jpg');
insert into plazas values('2','Plaza Zorrilla 6, Valladolid','moto',40.71727401, -74.00898606,'Plaza para moto','/Imagenes/plazas/parking2.jpg');
insert into plazas values('3','Gran Via 2, Madrid','coche',40.71727401, -74.00898606,'Plaza situada en el centro de Madrid, imposible encontrar sitio por alrededor','/Imagenes/plazas/parking3.jpg');
insert into plazas values('4','Plaza Mayor 4, Valladolid','coche',40.71727401, -74.00898606,'Plaza amplian en pleno centro','/Imagenes/plazas/parking4.jpg');

/*Añadimos publicaciones*/
insert into publicaciones values('1','71156437P',12,50,'8:00-14:00');
insert into publicaciones values('2','71456778E',10,50,'Todo el dia, menos los fines de semana');
insert into publicaciones values('3','11159437S',4,20,'Todas las mañanas de todos los dias');
insert into publicaciones values('4','14278937W',5,25,'Todos los dias, a cualquier horario');

/*Añadimos reservas realizadas*/
insert into reservas values('4','71156437P','12-06-2018','18-06-2018');
insert into reservas values('3','71456778E','15-05-2018','23-05-2018');
