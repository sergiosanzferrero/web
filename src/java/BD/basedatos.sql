/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  sergiosanzferrero
 * Created: 12-abr-2018
 */

drop table if exists usuario;
CREATE TABLE usuario(
    dni VARCHAR (50),
    nombre VARCHAR (50),
    apellidos VARCHAR (50),
    email VARCHAR (50),
    password VARCHAR (50),
    telefono VARCHAR (50),
    PRIMARY KEY (dni)
    );

drop table if exists plaza;
CREATE TABLE plaza(
    id VARCHAR (50),
    ciudad VARCHAR(50),
    calle VARCHAR (50),
    tipo VARCHAR (50),
    descripcion VARCHAR (1000),
    img VARCHAR (1000),
    PRIMARY KEY (id)

);

insert into usuario values('71156437P','Pedro','Duque Garcia','pedroduque@gmail.com','654784656');
insert into usuario values('71456778E','Raul','Garcia Arranz','raul@gmail.com','666777888');
insert into usuario values('11159437S','Jaime','Sanz Martin','pedroduque@gmail.com','698765432');
insert into usuario values('14278937W','Pedro','Duque Perez','pedro@gmail.com','612345678');


insert into plaza values('1','Valladolid','Miguel Delibes 8','camion','Plaza para camiones en las afueras de Valladolid','http://www.parkingpadrosa.com/galeria/img/pk_3.jpg');
insert into plaza values('2','Valladolid','Plaza Zorrilla 6','moto','Plaza para moto','http://centralparkingbarcelona.com/wp-content/uploads/2013/08/WEB-JAPE-26.6.2013-023-940x705.jpg');
insert into plaza values('3','Madrid','Gran Via 2','coche','Plaza situada en el centro de Madrid, imposible encontrar sitio por alrededor','http://www.jfdlimpiezas.com/assets/images/temp/es/jfd-Limpieza-de-parkings-en-Barcelona-y-Granollers.jpg');
insert into plaza values('4','Valladolid','Plaza Mayor 4','coche','Plaza amplian en pleno centro','http://www.pavifort.com/media/k2/items/cache/3abb66d58aa91d2b7b16f08ee38a95c0_XL.jpg');