
/*Borramos base de datos si existía anteriormente*/
DROP DATABASE IF EXISTS cartimedb;


/*Creamos la base de datos*/
CREATE DATABASE cartimedb;


/*Seleccionamos la base de datos*/
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
    horario VARCHAR (50),
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
insert into plazas values(0,'71156437P','7, Calle de Antonio Pirala, Ventas, Ciudad Lineal, Madrid, Área metropolitana de Madrid y Corredor del Henares, Comunidad de Madrid, 28017, España','camion',40.43030121859354, -3.659496903528634,'Plaza para camiones en las afueras de Valladolid', 'mañana', 20,'/Imagenes/plazas/parking1.jpg');
insert into plazas values(0,'71156437P','8, Calle de Cipriano Sancho, Quintana, Ciudad Lineal, Madrid, Área metropolitana de Madrid y Corredor del Henares, Comunidad de Madrid, 28017, España','moto',40.4316449, -3.6549834,'Buena plaza para moto', 'tarde',30,'/Imagenes/plazas/parking2.jpg');
insert into plazas values(0,'11159437S','19, Calle de Benidorm, Ventas, Ciudad Lineal, Madrid, Área metropolitana de Madrid y Corredor del Henares, Comunidad de Madrid, 28017, España','coche',40.4312244, -3.6545053,'Plaza situada en el centro de Madrid, imposible encontrar mejor sitio por alrededor', 'mañana',40,'/Imagenes/plazas/parking3.jpg');
insert into plazas values(0,'11159437S','5, Calle Cyesa, Ventas, Ciudad Lineal, Madrid, Área metropolitana de Madrid y Corredor del Henares, Comunidad de Madrid, 28017, España','coche',40.4301815, -3.65884870295184,'Plaza amplia en pleno centro', 'full',40,'/Imagenes/plazas/parking4.jpg');


/*Añadimos reservas realizadas*/
insert into reservas values('1','71156437P','12-06-2018','18-06-2018');
insert into reservas values('2','71456778E','15-05-2018','23-05-2018');

