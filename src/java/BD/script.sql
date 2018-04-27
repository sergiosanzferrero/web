
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
    id INT AUTO_INCREMENT,
    dni VARCHAR(50),
    direccion VARCHAR (300),
    tipo VARCHAR (50),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    descripcion VARCHAR (1000),
    precioDia float,
    img VARCHAR (100),
    PRIMARY KEY (id,dni),
    FOREIGN KEY (dni) references usuarios(dni)
);

CREATE TABLE reservas
(
    id INT,
    dni VARCHAR(50),
    fechaInicio VARCHAR(50),
    fechaFin VARCHAR(50),
    PRIMARY KEY(id,dni,fechaInicio),
    FOREIGN KEY (id) references plazas(id),
    FOREIGN KEY (dni) references usuarios(dni)
);

/*Añadimos usuarios*/
insert into usuarios values('71156437P','Pedro','Duque Garcia','pedroduque@gmail.com','pedro', '654784656');
insert into usuarios values('71456778E','Raul','Garcia Arranz','raul@gmail.com','raul', '666777888');
insert into usuarios values('11159437S','Jaime','Sanz Martin','pedroduque@gmail.com','edgar','698765432');
insert into usuarios values('14278937W','Pedra','Duque Perez','pedro@gmail.com','duquegar','612345678');

/*Añadimos plazas*/
insert into plazas values(0,'71156437P','Miguel Delibes 8, Valladolid','camion',40.71727401, -74.00898606,'Plaza para camiones en las afueras de Valladolid',20,'/Imagenes/plazas/parking1.jpg');
insert into plazas values(0,'71156437P','Plaza Zorrilla 6, Valladolid','moto',40.71727401, -74.00898606,'Plaza para moto',30,'/Imagenes/plazas/parking2.jpg');
insert into plazas values(0,'11159437S','Gran Via 2, Madrid','coche',40.71727401, -74.00898606,'Plaza situada en el centro de Madrid, imposible encontrar sitio por alrededor',40,'/Imagenes/plazas/parking3.jpg');
insert into plazas values(0,'11159437S','Plaza Mayor 4, Valladolid','coche',40.71727401, -74.00898606,'Plaza amplian en pleno centro',40,'/Imagenes/plazas/parking4.jpg');


/*Añadimos reservas realizadas*/
insert into reservas values('1','71156437P','12-06-2018','18-06-2018');
insert into reservas values('2','71456778E','15-05-2018','23-05-2018');

