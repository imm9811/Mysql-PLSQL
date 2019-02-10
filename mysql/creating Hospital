
DROP DATABASE IF EXISTS Hospital;

CREATE DATABASE Hospital;
USE Hospital;
-- Creamos tabla Hospital, columnas medico_ncolegiado es director y medico_ncolegiado1 es director medico--
CREATE TABLE hospital (
    id_hospital          DOUBLE NOT NULL,
    medico_ncolegiado    DOUBLE NOT NULL,
    medico_ncolegiado1   DOUBLE NOT NULL,
    telefono             CHAR(9) NOT NULL,
    direccion            VARCHAR(20) NOT NULL,
    nombre               VARCHAR(20) NOT NULL
);

-- Clave primaria Hospital--
ALTER TABLE hospital ADD CONSTRAINT hospital_pk PRIMARY KEY ( id_hospital );

-- Creamos tabla especialidad--
CREATE TABLE especialidad (
    id_especialidad   DOUBLE NOT NULL,
    nombre            VARCHAR(20) NOT NULL
);

-- Clave primaria especialidad--
ALTER TABLE especialidad ADD CONSTRAINT especialidad_pk PRIMARY KEY ( id_especialidad );

-- Creamos tabla paciente--
CREATE TABLE paciente (
    seguridadsocial   VARCHAR(9) NOT NULL,
    nombre            VARCHAR(20) NOT NULL,
    dni               VARCHAR(9) NOT NULL,
    telefono          CHAR(9) NOT NULL,
    direccion         VARCHAR(20) NOT NULL,
    nhijos            INTEGER NOT NULL,
    estadocivil       CHAR(1) NOT NULL
);

-- Clave primaria paciente--
ALTER TABLE paciente ADD CONSTRAINT paciente_pk PRIMARY KEY ( seguridadsocial );

-- Insertamos datos tablas maestras--
INSERT INTO especialidad (id_especialidad, nombre) VALUES
(01, 'cardiología'),
(02, 'neumología'), 
(03, 'psiquiatría'), 
(04, 'oncología'), 
(05, 'oftalmología'), 
(06, 'endocrinología'),
(07, 'urgencias'), 
(08, 'interna'), 
(09, 'nefrología'), 
(10, 'neurología');

INSERT INTO Paciente(seguridadsocial, nombre, dni,telefono, direccion,nhijos,estadocivil)
VALUES("419630167","Calvo, Joel","82499210G","621824073","avd campo de espana",3,'C'),
("262300043","Moreno, Jose","22723741V","670821689","calle sin pito",4,'C'),
("186798831","Garcia, Rafael","42269079R","662000021","calle viva la pava",5,'C'),
("457854215","Ramos, Alvaro","51033374P","605613427","avd enrique cido",6,'C'),
("124673549","Torres, Marta","06784584K","687138007","avd Ana tomia",7,'C'),
("124587963","Castillo, Andrea","72728403B","646957612","avd de la pasa",1,'C'),
("965784235","Suarez, Andres","65712354D","649440168","calle rompete alma",2,'S'),
("863241247","Costa, Nil","74632052M","669981495","avd cata huevos",3,'S'),
("365742316","Estrella, Patricio","86040888G","683481170","avd super mario bros",4,'C'),
("444578960","Riera, Irene","89721580Y","673086781","calle abrazamozas",4,'C'),
("024637896","Roca, Luna","08364735A","699597100","avd sal si puedes",2,'V'),
("545789652","Martinez, GlaDos","76857170W","655672484","rotonda acdc",1,'V'),
("324778952","Ruiz, Sarai","03758608V","620824422","avd el magnifico",1,'D'),
("123478569","Persson, Markus","56486112K","605564310","avd peor es nada",4,'D'),
("354785210","Pons, Alicia","64530394F","686413252","avd los infiernos",3,'C'),
("247896520","Fuente, Luis","50161190F","647709583","avd core 2 duo",3,'C'),
("623427897", "Gómez, Javier", "43570343G","659668693", "Calle Estrella de Oriente 8", 4, "C"),
("854567896", "Salud, Jesús", "28833168T", "669264564", "Calle Arriba 3", 0, "S"),
("343877293", "Cruz, Ismael", "28834921F", "664263676", "Calle Abajo", 3, "C"),
("131267891", "Espada, Pablo", "28398413G","669232678", "Calle Benito Pérez Galdós 2 4ºC", 2, "C"),
("423876784", "Mesa, Isabel", "48721943H", "669260642", "Calle Rafael Alberti 23 1ºA", 1, "S"),
("329475985", "García, Jose maría", "19840343A","666540671","Calle Estrella de Oriente 2 3ºD", 0, "C"),
("859016781", "Estrella, María", "28584931A","662243671","Calle Amador de los Ríos 3 5ºA", 2, "C"),
("609216788", "Flor, Rosa", "98763915R","669223471","Calle Estrella de Oriente 8", 9, "C"),
("957306789", "Poyato, David", "28482344K","676560671","Calle Estrella Polar 2 3ºA", 3, "C"),
("142396789", "Echeverría, Paula", "23729473X","663486671","Calle Arriba 1 2ºB", 2, "C"),
("302916783", "Real, Teresa", "30345674W","669473281","Calle Estrella de Oriente 89 2ºC", 0, "C"),
("769326784", "Borbón, Juan Carlos", "57849302B","643260671","Calle Sol 23 6ºD", 0, "C"),
("849206784", "Cruz, Nerea", "28238194G","669246291","Calle Luna 2 3ºA", 0, "C"),
("592136785", "Pérez, Cristina", "24763823Y","642860671","Calle Vida 12 1ºA", 1, "C"),
("489216781", "García, Pablo", "89362712O","665873671","Calle Musical 21 3ºB", 1, "S");

-- TABLAS SECUNDARIAS--

-- Creamos medico--
CREATE TABLE medico (
    ncolegiado                     DOUBLE NOT NULL,
    especialidad_id_especialidad   DOUBLE NOT NULL,
    medico_ncolegiado              DOUBLE,
    nombre                         VARCHAR(20) NOT NULL,
    dni                            VARCHAR(9) NOT NULL,
    telefono                       CHAR(9) NOT NULL,
    estado_civil                   CHAR(1) NOT NULL,
    nhijos                         INTEGER NOT NULL
);

-- Clave primaria medico--
ALTER TABLE medico ADD CONSTRAINT medico_pk PRIMARY KEY ( ncolegiado );

-- Clave foránea Especialidad--
ALTER TABLE medico
    ADD CONSTRAINT medico_especialidad_fk FOREIGN KEY ( especialidad_id_especialidad )
        REFERENCES especialidad ( id_especialidad );

-- REFLEXIVA, tutor de MIR--
ALTER TABLE medico
    ADD CONSTRAINT medico_medico_fk FOREIGN KEY ( medico_ncolegiado )
        REFERENCES medico ( ncolegiado );

-- Creamos planta, habitación y cama--
CREATE TABLE planta (
    id_planta       DOUBLE NOT NULL,
    nombre          VARCHAR(20) NOT NULL,
    nhabitacion   DOUBLE NOT NULL
);

-- Clave primaria planta--
ALTER TABLE planta ADD CONSTRAINT planta_pk PRIMARY KEY ( id_planta );

CREATE TABLE habitacion (
    planta_id_planta   DOUBLE NOT NULL,
    id_habitacion      DOUBLE NOT NULL,
    ncamas             DOUBLE NOT NULL
);

-- Clave primaria habitación--
ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( id_habitacion,
                                                                  planta_id_planta );

-- Clave foránea planta a habitacion--
ALTER TABLE habitacion
    ADD CONSTRAINT habitacion_planta_fk FOREIGN KEY ( planta_id_planta )
        REFERENCES planta ( id_planta );

CREATE TABLE cama (
    habitacion_planta_id_planta   DOUBLE NOT NULL,
    habitacion_id_habitacion      DOUBLE NOT NULL,
    id                            DOUBLE NOT NULL,
    paciente_seguridadsocial      VARCHAR(9)
);

-- Clave primaria cama--
ALTER TABLE cama
    ADD CONSTRAINT cama_pk PRIMARY KEY ( id,
                                         habitacion_id_habitacion,
                                         habitacion_planta_id_planta );

-- Clave foránea cama a habitación y planta--
ALTER TABLE cama
    ADD CONSTRAINT cama_habitacion_fk FOREIGN KEY ( habitacion_id_habitacion,
                                                    habitacion_planta_id_planta )
        REFERENCES habitacion ( id_habitacion,
                                planta_id_planta );

-- Paciente ocupa una cama--
ALTER TABLE cama
    ADD CONSTRAINT cama_paciente_fk FOREIGN KEY ( paciente_seguridadsocial )
        REFERENCES paciente ( seguridadsocial );

-- INSERTAMOS DATOS PLANTA HABITACION Y CAMA--
/*PLANTAS*/
insert into planta values (01, 'Primera planta',25);
insert into planta values (2, 'Segunda planta', 25); 
insert into planta values (3, 'Tercera planta', 25);
insert into planta values(4,'Cuarta planta',25);
insert into planta values (5,'Quinta planta',25);


/*habitacion*/
insert into habitacion values (01, 01, 2);
insert into habitacion values (01, 02, 2);
insert into habitacion values (01, 03, 2);
insert into habitacion values (01, 04, 2);
insert into habitacion values (01, 05, 2);
insert into habitacion values (01, 06, 2);
insert into habitacion values (01, 07, 2);
insert into habitacion values (01, 08, 2);
insert into habitacion values (01, 09, 2);
insert into habitacion values (01, 10, 2);
insert into habitacion values (01, 11, 2);
insert into habitacion values (01, 12, 2);
insert into habitacion values (01, 13, 2);
insert into habitacion values (01, 14, 2);
insert into habitacion values (01, 15, 2);
insert into habitacion values (01, 16, 2);
insert into habitacion values (01, 17, 2);
insert into habitacion values (01, 18, 2);
insert into habitacion values (01, 19, 2);
insert into habitacion values (01, 20, 2);
insert into habitacion values (01, 21, 2);
insert into habitacion values (01, 22, 2);
insert into habitacion values (01, 23, 2);
insert into habitacion values (01, 24, 2);
insert into habitacion values (01, 25, 2);


insert into habitacion values (2, 01, 2);
insert into habitacion values (2, 02, 2);
insert into habitacion values (2, 03, 2);
insert into habitacion values (2, 04, 2);
insert into habitacion values (2, 05, 2);
insert into habitacion values (2, 06, 2);
insert into habitacion values (2, 07, 2);
insert into habitacion values (2, 08, 2);
insert into habitacion values (2, 09, 2);
insert into habitacion values (2, 10, 2);
insert into habitacion values (2, 11, 2);
insert into habitacion values (2, 12, 2);
insert into habitacion values (2, 13, 2);
insert into habitacion values (2, 14, 2);
insert into habitacion values (2, 15, 2);
insert into habitacion values (2, 16, 2);
insert into habitacion values (2, 17, 2);
insert into habitacion values (2, 18, 2);
insert into habitacion values (2, 19, 2);
insert into habitacion values (2, 20, 2);
insert into habitacion values (2, 21, 2);
insert into habitacion values (2, 22, 2);
insert into habitacion values (2, 23, 2);
insert into habitacion values (2, 24, 2);
insert into habitacion values (2, 25, 2);

insert into habitacion values (3, 01, 2);
insert into habitacion values (3, 02, 2);
insert into habitacion values (3, 03, 2);
insert into habitacion values (3, 04, 2);
insert into habitacion values (3, 05, 2);
insert into habitacion values (3, 06, 2);
insert into habitacion values (3, 07, 2);
insert into habitacion values (3, 08, 2);
insert into habitacion values (3, 09, 2);
insert into habitacion values (3, 10, 2);
insert into habitacion values (3, 11, 2);
insert into habitacion values (3, 12, 2);
insert into habitacion values (3, 13, 2);
insert into habitacion values (3, 14, 2);
insert into habitacion values (3, 15, 2);
insert into habitacion values (3, 16, 2);
insert into habitacion values (3, 17, 2);
insert into habitacion values (3, 18, 2);
insert into habitacion values (3, 19, 2);
insert into habitacion values (3, 20, 2);
insert into habitacion values (3, 21, 2);
insert into habitacion values (3, 22, 2);
insert into habitacion values (3, 23, 2);
insert into habitacion values (3, 24, 2);
insert into habitacion values (3, 25, 2);

insert into habitacion values (4,01,2);
insert into habitacion values	(4,02,2);
insert into habitacion values	(4,03,2);
insert into habitacion values	(4,04,2);
insert into habitacion values	(4,05,2);
insert into habitacion values	(4,06,2);
insert into habitacion values	(4,07,2);
insert into habitacion values	(4,08,2);
insert into habitacion values	(4,09,2);
insert into habitacion values	(4,10,2);
insert into habitacion values	(4,11,2);
insert into habitacion values	(4,12,2);
insert into habitacion values	(4,13,2);
insert into habitacion values	(4,14,2);
insert into habitacion values	(4,15,2);
insert into habitacion values	(4,16,2);
insert into habitacion values	(4,17,2);
insert into habitacion values	(4,18,2);
insert into habitacion values	(4,19,2);
insert into habitacion values	(4,20,2);
insert into habitacion values	(4,21,2);
insert into habitacion values	(4,22,2);
insert into habitacion values	(4,23,2);
insert into habitacion values	(4,24,2);
insert into habitacion values	(4,25,2);

insert into habitacion values (5,01,2);
insert into habitacion values	(5,02,2);
insert into habitacion values	(5,03,2);
insert into habitacion values	(5,04,2);
insert into habitacion values	(5,05,2);
insert into habitacion values	(5,06,2);
insert into habitacion values	(5,07,2);
insert into habitacion values	(5,08,2);
insert into habitacion values	(5,09,2);
insert into habitacion values	(5,10,2);
insert into habitacion values	(5,11,2);
insert into habitacion values	(5,12,2);
insert into habitacion values	(5,13,2);
insert into habitacion values	(5,14,2);
insert into habitacion values	(5,15,2);
insert into habitacion values	(5,16,2);
insert into habitacion values	(5,17,2);
insert into habitacion values	(5,18,2);
insert into habitacion values	(5,19,2);
insert into habitacion values	(5,20,2);
insert into habitacion values	(5,21,2);
insert into habitacion values	(5,22,2);
insert into habitacion values	(5,23,2);
insert into habitacion values	(5,24,2);
insert into habitacion values	(5,25,2);

/*CAMAS*/
insert into cama values (1, 1, 1,NULL);
 insert into cama values (1, 1, 2,NULL);
 insert into cama values (1, 2, 1,NULL);
 insert into cama values (1, 2, 2,NULL);
 insert into cama values (1, 3, 1,NULL);
 insert into cama values (1, 3, 2,NULL);
 insert into cama values (1, 4, 1,NULL);
 insert into cama values (1, 4, 2,NULL);
 insert into cama values (1, 5, 1,NULL);
 insert into cama values (1, 5, 2,NULL);
 insert into cama values (1, 6, 1,NULL);
 insert into cama values (1, 6, 2,NULL);
 insert into cama values (1, 7, 1,NULL);
 insert into cama values (1, 7, 2,NULL);
 insert into cama values (1, 8, 1,NULL);
 insert into cama values (1, 8, 2,NULL);
 insert into cama values (1, 9, 1,NULL);
 insert into cama values (1, 9, 2,NULL);
 insert into cama values (1, 10, 1,NULL);
 insert into cama values (1, 10, 2,NULL);
 insert into cama values (1, 11, 1,NULL);
 insert into cama values (1, 11, 2,NULL);
 insert into cama values (1, 12, 1,NULL);
 insert into cama values (1, 12, 2,NULL);
 insert into cama values (1, 13, 1,NULL);
 insert into cama values (1, 13, 2,NULL);
 insert into cama values (1, 14, 1,NULL);
 insert into cama values (1, 14, 2,NULL);
 insert into cama values (1, 15, 1,NULL);
 insert into cama values (1, 15, 2,NULL);
 insert into cama values (1, 16, 1,NULL);
 insert into cama values (1, 16, 2,NULL);
 insert into cama values (1, 17, 1,NULL);
 insert into cama values (1, 17, 2,NULL);
 insert into cama values (1, 18, 1,NULL);
 insert into cama values (1, 18, 2,NULL);
 insert into cama values (1, 19, 1,NULL);
 insert into cama values (1, 19, 2,NULL);
 insert into cama values (1, 20, 1,NULL);
 insert into cama values (1, 20, 2,NULL);
 insert into cama values (1, 21, 1,NULL);
 insert into cama values (1, 21, 2,NULL);
 insert into cama values (1, 22, 1,NULL);
 insert into cama values (1, 22, 2,NULL);
 insert into cama values (1, 23, 1,NULL);
 insert into cama values (1, 23, 2,NULL);
 insert into cama values (1, 24, 1,NULL);
 insert into cama values (1, 24, 2,NULL);
 insert into cama values (1, 25, 1,NULL);
 insert into cama values (1, 25, 2,NULL);

 insert into cama values (2, 1, 1,NULL);
 insert into cama values (2, 1, 2,NULL);
 insert into cama values (2, 2, 1,NULL);
 insert into cama values (2, 2, 2,NULL);
 insert into cama values (2, 3, 1,NULL);
 insert into cama values (2, 3, 2,NULL);
 insert into cama values (2, 4, 1,NULL);
 insert into cama values (2, 4, 2,NULL);
 insert into cama values (2, 5, 1,NULL);
 insert into cama values (2, 5, 2,NULL);
 insert into cama values (2, 6, 1,NULL);
 insert into cama values (2, 6, 2,NULL);
 insert into cama values (2, 7, 1,NULL);
 insert into cama values (2, 7, 2,NULL);
 insert into cama values (2, 8, 1,NULL);
 insert into cama values (2, 8, 2,NULL);
 insert into cama values (2, 9, 1,NULL);
 insert into cama values (2, 9, 2,NULL);
 insert into cama values (2, 10, 1,NULL);
 insert into cama values (2, 10, 2,NULL);
 insert into cama values (2, 11, 1,NULL);
 insert into cama values (2, 11, 2,NULL);
 insert into cama values (2, 12, 1,NULL);
 insert into cama values (2, 12, 2,NULL);
 insert into cama values (2, 13, 1,NULL);
 insert into cama values (2, 13, 2,NULL);
 insert into cama values (2, 14, 1,NULL);
 insert into cama values (2, 14, 2,NULL);
 insert into cama values (2, 15, 1,NULL);
 insert into cama values (2, 15, 2,NULL);
 insert into cama values (2, 16, 1,NULL);
 insert into cama values (2, 16, 2,NULL);
 insert into cama values (2, 17, 1,NULL);
 insert into cama values (2, 17, 2,NULL);
 insert into cama values (2, 18, 1,NULL);
 insert into cama values (2, 18, 2,NULL);
 insert into cama values (2, 19, 1,NULL);
 insert into cama values (2, 19, 2,NULL);
 insert into cama values (2, 20, 1,NULL);
 insert into cama values (2, 20, 2,NULL);
 insert into cama values (2, 21, 1,NULL);
 insert into cama values (2, 21, 2,NULL);
 insert into cama values (2, 22, 1,NULL);
 insert into cama values (2, 22, 2,NULL);
 insert into cama values (2, 23, 1,NULL);
 insert into cama values (2, 23, 2,NULL);
 insert into cama values (2, 24, 1,NULL);
 insert into cama values (2, 24, 2,NULL);
 insert into cama values (2, 25, 1,NULL);
 insert into cama values (2, 25, 2,NULL);

 insert into cama values (3, 1, 1,NULL);
 insert into cama values (3, 1, 2,NULL);
 insert into cama values (3, 2, 1,NULL);
 insert into cama values (3, 2, 2,NULL);
 insert into cama values (3, 3, 1,NULL);
 insert into cama values (3, 3, 2,NULL);
 insert into cama values (3, 4, 1,NULL);
 insert into cama values (3, 4, 2,NULL);
 insert into cama values (3, 5, 1,NULL);
 insert into cama values (3, 5, 2,NULL);
 insert into cama values (3, 6, 1,NULL);
 insert into cama values (3, 6, 2,NULL);
 insert into cama values (3, 7, 1,NULL);
 insert into cama values (3, 7, 2,NULL);
 insert into cama values (3, 8, 1,NULL);
 insert into cama values (3, 8, 2,NULL);
 insert into cama values (3, 9, 1,NULL);
 insert into cama values (3, 9, 2,NULL);
 insert into cama values (3, 10, 1,NULL);
 insert into cama values (3, 10, 2,NULL);
 insert into cama values (3, 11, 1,NULL);
 insert into cama values (3, 11, 2,NULL);
 insert into cama values (3, 12, 1,NULL);
 insert into cama values (3, 12, 2,NULL);
 insert into cama values (3, 13, 1,NULL);
 insert into cama values (3, 13, 2,NULL);
 insert into cama values (3, 14, 1,NULL);
 insert into cama values (3, 14, 2,NULL);
 insert into cama values (3, 15, 1,NULL);
 insert into cama values (3, 15, 2,NULL);
 insert into cama values (3, 16, 1,NULL);
 insert into cama values (3, 16, 2,NULL);
 insert into cama values (3, 17, 1,NULL);
 insert into cama values (3, 17, 2,NULL);
 insert into cama values (3, 18, 1,NULL);
 insert into cama values (3, 18, 2,NULL);
 insert into cama values (3, 19, 1,NULL);
 insert into cama values (3, 19, 2,NULL);
 insert into cama values (3, 20, 1,NULL);
 insert into cama values (3, 20, 2,NULL);
 insert into cama values (3, 21, 1,NULL);
 insert into cama values (3, 21, 2,NULL);
 insert into cama values (3, 22, 1,NULL);
 insert into cama values (3, 22, 2,NULL);
 insert into cama values (3, 23, 1,NULL);
 insert into cama values (3, 23, 2,NULL);
 insert into cama values (3, 24, 1,NULL);
 insert into cama values (3, 24, 2,NULL);
 insert into cama values (3, 25, 1,NULL);
 insert into cama values (3, 25, 2,NULL);

 insert into cama values (4, 1, 1,NULL);
 insert into cama values (4, 1, 2,NULL);
 insert into cama values (4, 2, 1,NULL);
 insert into cama values (4, 2, 2,NULL);
 insert into cama values (4, 3, 1,NULL);
 insert into cama values (4, 3, 2,NULL);
 insert into cama values (4, 4, 1,NULL);
 insert into cama values (4, 4, 2,NULL);
 insert into cama values (4, 5, 1,NULL);
 insert into cama values (4, 5, 2,NULL);
 insert into cama values (4, 6, 1,NULL);
 insert into cama values (4, 6, 2,NULL);
 insert into cama values (4, 7, 1,NULL);
 insert into cama values (4, 7, 2,NULL);
 insert into cama values (4, 8, 1,NULL);
 insert into cama values (4, 8, 2,NULL);
 insert into cama values (4, 9, 1,NULL);
 insert into cama values (4, 9, 2,NULL);
 insert into cama values (4, 10, 1,NULL);
 insert into cama values (4, 10, 2,NULL);
 insert into cama values (4, 11, 1,NULL);
 insert into cama values (4, 11, 2,NULL);
 insert into cama values (4, 12, 1,NULL);
 insert into cama values (4, 12, 2,NULL);
 insert into cama values (4, 13, 1,NULL);
 insert into cama values (4, 13, 2,NULL);
 insert into cama values (4, 14, 1,NULL);
 insert into cama values (4, 14, 2,NULL);
 insert into cama values (4, 15, 1,NULL);
 insert into cama values (4, 15, 2,NULL);
 insert into cama values (4, 16, 1,NULL);
 insert into cama values (4, 16, 2,NULL);
 insert into cama values (4, 17, 1,NULL);
 insert into cama values (4, 17, 2,NULL);
 insert into cama values (4, 18, 1,NULL);
 insert into cama values (4, 18, 2,NULL);
 insert into cama values (4, 19, 1,NULL);
 insert into cama values (4, 19, 2,NULL);
 insert into cama values (4, 20, 1,NULL);
 insert into cama values (4, 20, 2,NULL);
 insert into cama values (4, 21, 1,NULL);
 insert into cama values (4, 21, 2,NULL);
 insert into cama values (4, 22, 1,NULL);
 insert into cama values (4, 22, 2,NULL);
 insert into cama values (4, 23, 1,NULL);
 insert into cama values (4, 23, 2,NULL);
 insert into cama values (4, 24, 1,NULL);
 insert into cama values (4, 24, 2,NULL);
 insert into cama values (4, 25, 1,NULL);
 insert into cama values (4, 25, 2,NULL);
 
 insert into cama values (5, 1, 1,NULL);
 insert into cama values (5, 1, 2,NULL);
 insert into cama values (5, 2, 1,NULL);
 insert into cama values (5, 2, 2,NULL);
 insert into cama values (5, 3, 1,NULL);
 insert into cama values (5, 3, 2,NULL);
 insert into cama values (5, 4, 1,NULL);
 insert into cama values (5, 4, 2,NULL);
 insert into cama values (5, 5, 1,NULL);
 insert into cama values (5, 5, 2,NULL);
 insert into cama values (5, 6, 1,NULL);
 insert into cama values (5, 6, 2,NULL);
 insert into cama values (5, 7, 1,NULL);
 insert into cama values (5, 7, 2,NULL);
 insert into cama values (5, 8, 1,NULL);
 insert into cama values (5, 8, 2,NULL);
 insert into cama values (5, 9, 1,NULL);
 insert into cama values (5, 9, 2,NULL);
 insert into cama values (5, 10, 1,NULL);
 insert into cama values (5, 10, 2,NULL);
 insert into cama values (5, 11, 1,NULL);
 insert into cama values (5, 11, 2,NULL);
 insert into cama values (5, 12, 1,NULL);
 insert into cama values (5, 12, 2,NULL);
 insert into cama values (5, 13, 1,NULL);
 insert into cama values (5, 13, 2,NULL);
 insert into cama values (5, 14, 1,NULL);
 insert into cama values (5, 14, 2,NULL);
 insert into cama values (5, 15, 1,NULL);
 insert into cama values (5, 15, 2,NULL);
 insert into cama values (5, 16, 1,NULL);
 insert into cama values (5, 16, 2,NULL);
 insert into cama values (5, 17, 1,NULL);
 insert into cama values (5, 17, 2,NULL);
 insert into cama values (5, 18, 1,NULL);
 insert into cama values (5, 18, 2,NULL);
 insert into cama values (5, 19, 1,NULL);
 insert into cama values (5, 19, 2,NULL);
 insert into cama values (5, 20, 1,NULL);
 insert into cama values (5, 20, 2,NULL);
 insert into cama values (5, 21, 1,NULL);
 insert into cama values (5, 21, 2,NULL);
 insert into cama values (5, 22, 1,NULL);
 insert into cama values (5, 22, 2,NULL);
 insert into cama values (5, 23, 1,NULL);
 insert into cama values (5, 23, 2,NULL);
 insert into cama values (5, 24, 1,NULL);
 insert into cama values (5, 24, 2,NULL);
 insert into cama values (5, 25, 1,NULL);
 insert into cama values (5, 25, 2,NULL);

-- Medico atiende a un paciente--
CREATE TABLE atiende (
    medico_ncolegiado          DOUBLE NOT NULL,
    paciente_seguridadsocial   VARCHAR(9) NOT NULL,
    fecha                      DATE NOT NULL
);

ALTER TABLE atiende ADD CONSTRAINT atiende_pk PRIMARY KEY ( medico_ncolegiado,
                                                            paciente_seguridadsocial );

ALTER TABLE atiende
    ADD CONSTRAINT atiende_medico_fk FOREIGN KEY ( medico_ncolegiado )
        REFERENCES medico ( ncolegiado );
ALTER TABLE atiende
    ADD CONSTRAINT atiende_paciente_fk FOREIGN KEY ( paciente_seguridadsocial )
        REFERENCES paciente ( seguridadsocial );


-- INSERTAMOS DATOS MEDICOS--
INSERT INTO medico(ncolegiado, especialidad_id_especialidad, medico_ncolegiado, nombre, dni, telefono,estado_civil,nhijos)
values  
(1,01,null,'Pepe', '30091411E',622596821,'s',2),
(2,5,null,'Mario', '30091412P',622554821,'c',0),
(3,02,null,'Juan', '30091413E',623456821,'v',1),
(4,02,null,'Enrique', '30091414L',622789821,'c',3),
(5,03,null,'Javi', '30091415E',622596264,'d',7),
(6,03,null,'Manu', '30091416M',63496821,'p',0),
(7,04,null,'Calcu', '30091417K',956596821,'V',3),
(8,04,null,'Ruben', '30091418E',628816821,'c',2),
(9,05,null,'Vasco', '30091419E',675696821,'p',1),
(10,05,null,'Jesus C', '30091420A',62765461,'c',0),
(11,06,null,'Alejandro', '300914121B',622644621,'s',2),
(12,06,null,'Luis', '30091422B',622113399,'c',1),
(13,07,null,'Ismael', '30091423R',622784195,'s',0),
(14,07,null,'Jesus R', '30091424J',622596829,'v',2),
(15,07,null,'Cristina', '30091425C',622596826,'d',1),
(16,08,null,'Isabel', '30091426E',622596827,'p',0),
(17,08,null,'Pablo', '30091427V',622596826,'d',0),
(18,09,null,'Juan Carlos', '30091428F',622596825,'d',2),
(19,09,null,'Ana', '30091429G',622596824,'v',2),
(20,10,null,'Maria', '30091430D',622596831,'c',4),
(21,10,null,'Guadalupe', '30091431T',622596841,'s',1),
(22,07,null, 'Gregorio', '30091432H',622596825,'s',3),
(23,02,null, 'Sebastian', '30091433R',622598888,'c',6),
(24,06,null, 'Luis', '30091435O',622597777,'s',3),
(25,04,null, 'Estefania', '30091436Y',62259999,'s',0);

-- Director y director medico, claves foranea de tabla medico--
ALTER TABLE hospital
    ADD CONSTRAINT hospital_medico_fk FOREIGN KEY ( medico_ncolegiado )
        REFERENCES medico ( ncolegiado );
ALTER TABLE hospital
    ADD CONSTRAINT hospital_medico_fkv2 FOREIGN KEY ( medico_ncolegiado1 )
        REFERENCES medico ( ncolegiado );

-- INSERTAMOS TUTORES DE MIR--
UPDATE medico SET medico_ncolegiado=11 WHERE ncolegiado=25;
UPDATE medico SET medico_ncolegiado=11 WHERE ncolegiado=21;
UPDATE medico SET medico_ncolegiado=11 WHERE ncolegiado=14;
UPDATE medico SET medico_ncolegiado=11 WHERE ncolegiado=10;
UPDATE medico SET medico_ncolegiado=11 WHERE ncolegiado=17;
UPDATE medico SET medico_ncolegiado=20 WHERE ncolegiado=3;
UPDATE medico SET medico_ncolegiado=20 WHERE ncolegiado=5;
UPDATE medico SET medico_ncolegiado=20 WHERE ncolegiado=4;
UPDATE medico SET medico_ncolegiado=20 WHERE ncolegiado=2;
UPDATE medico SET medico_ncolegiado=1 WHERE ncolegiado=23;
UPDATE medico SET medico_ncolegiado=1 WHERE ncolegiado=13;
UPDATE medico SET medico_ncolegiado=1 WHERE ncolegiado=19;
UPDATE medico SET medico_ncolegiado=1 WHERE ncolegiado=18;


INSERT INTO atiende (medico_ncolegiado, paciente_seguridadsocial, fecha)
VALUES (1, "419630167",'2016-02-23'), 
(2,"262300043",'2016-03-21'),
(3,"186798831",'2016-01-13'),
(4,"457854215",'2015-04-8'),
(5,"124673549",'2017-01-10'),
(6,"124587963",'2017-01-25'),
(7,"965784235",'2013-02-27'),
(8,"863241247",'2014-07-16'),
(9,"365742316",'2018-04-3'),
(10,"444578960",'2016-08-9'),
(11,"024637896",'2012-09-10'),
(12,"545789652",'2010-10-12'),
(13,"324778952",'2009-11-13'),
(14,"123478569",'2011-11-11'),
(15,"354785210",'2007-07-7'),
(16,"247896520",'2010-05-10');

