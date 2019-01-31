

/*faltan por meter valores auditoria, carrito, imagen, pertenece, producto usado, proveedor*/
/*modificar pedido, imagen, iva, pedido, pedido-detalle*/

create database tienda;

    use tienda;
create table auditoria(
    id                int(5) primary key auto_increment,
    cod_tipo_cesta    char(5),
    resumen           varchar(200),
    cod_empleado      char(5),
    ip_terminal       varchar(25)
);
create table carrito (
    cod_carrito       int(5) primary key auto_increment,
    usuario_cod_user  int(5) not null
);

create table categoria (
    cod_categoria  int(5) primary key auto_increment,
    nombre          varchar(30) not null
);

create table chat (
    cod_mensaje    int(5) primary key auto_increment,
    fecha_hora     date not null,
    mensaje        varchar(255) not null,
    cod_user       int(5)
);

create table empresa (
    nombre   varchar(25) primary key,
    logo     varchar(100)
);

create table imagen (
    cod_imagen                    int(5) primary key auto_increment,
    url                            varchar(150) not null,
    texto_1                        varchar(50),
    texto_2                        varchar(50),
    producto_cod_producto         int(5) not null,
    producto_usado_cod_pro_usado  int(5) not null
);

create table pedido_cabecera{
    cod_pedido_cabecera   int(5) primary key auto_increment,
    fecha datetime,
    usuario_cod_user  int(5) not null,
    pais                varchar(25) not null
    }

create table pedido_detalle (
    cod_pedido_detalle        int(5) primary key auto_increment,
    cod_pedido_cabecera    int(5) not null,
    precio_unitario     int(5) not null,
    porcen_iva
    unidades            tinyint(2) not null
  
 
);

create table pais (
    cod_pais char(3) primary key,
    nombre varchar(25) not null,
    gastoenvio  tinyint(2) not null
);

create table pertenece (
    carrito_cod_carrito    int(5) not null,
    producto_cod_producto  int(5) not null,
    cantidad               int
);

alter table pertenece add constraint pertenece_pk primary key ( carrito_cod_carrito, producto_cod_producto );

create table producto (
    cod_producto                   int(5) primary key auto_increment,
    nombre                          varchar(50) not null,
    precio_venta                     int not null,
    precio_coste                     int not null,
    medidas                         varchar(25),
    propiedades                     varchar(150),
    texto_1                         varchar(150),
    subcategoria_cod_subcategoria  int(5) not null,
    proveedor_cod_proveedor        int(5) not null
);

create table producto_usado (
    cod_pro_usado                  int(5) primary key auto_increment,
    aprobacion                     char(1) not null,
    nombre                          varchar(50) not null,
    precio_cliente                   int not null,
    precio_venta                     int not null,
    texto_1                         varchar(150) not null,
    subcategoria_cod_subcategoria  int(5) not null,
    proveedor_cod_proveedor        int(5) not null,
    usuario_cod_user               int(5) not null
);

create table proveedor (
    cod_proveedor   int(5) primary key auto_increment,
    nombre          varchar(25) not null,
    foto            varchar(50)
);

create table red (
    nombre           varchar(50) not null,
    url              varchar(100) not null,
    empresa_nombre   varchar(25) not null
);

alter table red add constraint red_pk primary key ( nombre );

create table subcategoria (
    cod_subcategoria         int(5) primary key auto_increment,
    nombre                    varchar(30) not null,
    categoria_cod_categoria  int(5) not null
);

create table usuario (
    cod_user        int(5) primary key auto_increment,
    dni             char(9),    
    nombre_user     varchar(25) not null,
    password        varchar(25) not null,
    nombre          varchar(25) not null,
    apellido1       varchar(25) not null,
    apellido2       varchar(25),
    direccion       varchar(75),
    telefono        char(9) not null,
    cod_postal      char(5),
    administrador   char(1) not null,
    direccion_1     varchar(50),
    poblacion       varchar(25),
    foto            varchar(50),
    pais            varchar(25)
);

create table valoracion (
    cod_valoracion         int(5) primary key auto_increment,
    cod_user               int(5) not null,
    puntuacion               int not null,
    texto                   varchar(200) not null,
    producto_cod_producto  int(5) not null
);

alter table carrito
    add constraint carrito_usuario_fk foreign key ( usuario_cod_user )
        references usuario ( cod_user );
      

alter table imagen
    add constraint imagen_producto_fk foreign key ( producto_cod_producto )
        references producto ( cod_producto );

alter table imagen
    add constraint imagen_producto_usado_fk foreign key ( producto_usado_cod_pro_usado )
        references producto_usado ( cod_pro_usado );

alter table pedido
    add constraint pedido_usuario_fk foreign key ( usuario_cod_user )
        references usuario ( cod_user );
alter table pedido
    add constraint fk_pedido_pais foreign key (pais) 
    references pais (cod_pais);

alter table pertenece
    add constraint pertenece_carrito_fk foreign key ( carrito_cod_carrito )
        references carrito ( cod_carrito );

alter table pertenece
    add constraint pertenece_producto_fk foreign key ( producto_cod_producto )
        references producto ( cod_producto );

alter table producto
    add constraint producto_proveedor_fk foreign key ( proveedor_cod_proveedor )
        references proveedor ( cod_proveedor );

alter table producto
    add constraint producto_subcategoria_fk foreign key ( subcategoria_cod_subcategoria )
        references subcategoria ( cod_subcategoria );

alter table producto_usado
    add constraint producto_usado_proveedor_fk foreign key ( proveedor_cod_proveedor )
        references proveedor ( cod_proveedor );

alter table producto_usado
    add constraint producto_usado_subcategoria_fk foreign key ( subcategoria_cod_subcategoria )
        references subcategoria ( cod_subcategoria );

alter table producto_usado
    add constraint producto_usado_usuario_fk foreign key ( usuario_cod_user )
        references usuario ( cod_user );

alter table red
    add constraint red_empresa_fk foreign key ( empresa_nombre )
        references empresa ( nombre );


alter table valoracion
    add constraint valoracion_producto_fk foreign key ( producto_cod_producto )
        references producto ( cod_producto );

alter table subcategoria
    add constraint subcategoria_categoria_fk foreign key ( categoria_cod_categoria )
        references categoria ( cod_categoria );

alter table chat
    add constraint chat_usuario_fk foreign key ( cod_user )
        references usuario(cod_user);

INSERT INTO empresa VALUES ('Musicstar', '');

INSERT INTO red VALUES ('Facebook', 'https://www.facebook.com', 'Musicstar');
INSERT INTO red VALUES ('Twitter', 'https://www.twitter.com', 'Musicstar');
INSERT INTO red VALUES ('Gmail', 'https://www.gmail.com', 'Musicstar');

insert into pais(cod_pais,nombre,gastoenvio)

values("ESP", "España", 3),

("FRA", "Francia", 4),

("GER", "Alemania", 5),

("ITA", "Italia", 5),

("POR", "Portugal", 3),

("GBR", "Reino Unido", 6),

("NED", "Holanda", 5),

("BEL", "Bélgica", 5);



insert into categoria(nombre) values("Guitarras y Bajos");
insert into categoria(nombre) values("Percusion");
insert into categoria(nombre) values("Teclas");
insert into categoria(nombre) values("Vientos");
insert into categoria(nombre) values("Tradicional");
insert into categoria(nombre) values("Iluminación");
insert into categoria(nombre) values("Partituras");
insert into categoria(nombre) values("Grabación");

insert into subcategoria(nombre, categoria_cod_categoria) values("Guitarras Electricas", 1);
insert into subcategoria(nombre, categoria_cod_categoria) values("Guitarras de concierto",1);
insert into subcategoria(nombre, categoria_cod_categoria) values("Guitarras acusticas",1);
insert into subcategoria(nombre, categoria_cod_categoria) values("Bajos",1);
insert into subcategoria(nombre, categoria_cod_categoria) values("Otros",1);
insert into subcategoria(nombre, categoria_cod_categoria) values("Accesorios",1);
insert into subcategoria(nombre, categoria_cod_categoria) values("Baterias acusticas",2);
insert into subcategoria(nombre, categoria_cod_categoria) values("Baterias electronicas",2);
insert into subcategoria(nombre, categoria_cod_categoria) values("Platos",2);
insert into subcategoria(nombre, categoria_cod_categoria) values("Baquetas",2);
insert into subcategoria(nombre, categoria_cod_categoria) values("Accesorios",2);
insert into subcategoria(nombre, categoria_cod_categoria) values("Teclados",3);
insert into subcategoria(nombre, categoria_cod_categoria) values("Pianos",3);
insert into subcategoria(nombre, categoria_cod_categoria) values("Viento metal",4);
insert into subcategoria(nombre, categoria_cod_categoria) values("Viento madera",4);
insert into subcategoria(nombre, categoria_cod_categoria) values("Contrabajo",5);
insert into subcategoria(nombre, categoria_cod_categoria) values("Violonchello",5);
insert into subcategoria(nombre, categoria_cod_categoria) values("Viola",5);
insert into subcategoria(nombre, categoria_cod_categoria) values("Violin",5);
insert into subcategoria(nombre, categoria_cod_categoria) values("Juego de luces",6);
insert into subcategoria(nombre, categoria_cod_categoria) values("Caja de focos",6);
insert into subcategoria(nombre, categoria_cod_categoria) values("Luz movida",6);
insert into subcategoria(nombre, categoria_cod_categoria) values("Leds",6);
insert into subcategoria(nombre, categoria_cod_categoria) values("Aparatos de niebla",6);
insert into subcategoria(nombre, categoria_cod_categoria) values("Metodos de instrumentos",7);
insert into subcategoria(nombre, categoria_cod_categoria) values("Libros de canciones",7);
insert into subcategoria(nombre, categoria_cod_categoria) values("Sofware",7);
insert into subcategoria(nombre, categoria_cod_categoria) values("Microfono voz",8);
insert into subcategoria(nombre, categoria_cod_categoria) values("Microfono membrana",8);
insert into subcategoria(nombre, categoria_cod_categoria) values("Accesorios",8);

insert into proveedor(nombre, foto) values ("gibson","urldeunafoto.jpg");

INSERT INTO producto VALUES (00001, 'Balalaica', '100', '70', '25X50X150', 'De madera de la buena', 'Este texto es para describirlo', 1, 1);
INSERT INTO producto VALUES (00002, 'litofono', '170', '50', '25X150X150', 'Buen precio, mejor calidad', 'Este texto es para describirlo', 2, 1);
INSERT INTO producto VALUES (00003, 'Mandolina', '2000', '1500', '45X450X550', 'Mejor que el ron', 'Este texto es para describirlo', 3, 1);
INSERT INTO producto VALUES (00004, 'Thoramín', '80', '20', '80X70X150', 'Si tu quieres ligar, este instrumento has de tocar', 'Este texto es para describirlo', 9, 1);
INSERT INTO producto VALUES (00005, 'Charango', '9000', '1050', 'No especificada', 'Si quieres triunfar, este instrumento deberás comprar', 'Este texto es para describirlo', 10, 1);
INSERT INTO producto VALUES (00006, 'Bicicletófono', '100', '70', '25X758X150', 'Impresiona cuando lo tienes en la mano', 'Cuando te los compres, te pondras mas fuerte que un roble', 11, 1);
INSERT INTO producto VALUES (00007, 'Zambomba', '758', '508', '75x80x982', 'De calidad increible', 'Este texto es para describirlo', 1, 1);
INSERT INTO producto VALUES (00008, 'Nelófono', '516', '350', '48x56x23', 'Mas barato no lo encuentro', 'Este texto es para describirlo', 6, 1);
INSERT INTO producto VALUES (00009, 'Fluba', '1150', '980', '29X10X750', 'Actualmente es el mejor del mercado', 'Este texto es para describirlo', 7, 1);
INSERT INTO producto VALUES (00010, 'bandurria', '1010', '908', '75X580X1150', 'Medidas reducidas', 'Este texto es para describirlo', 8, 1);

INSERT INTO usuario values (1,"11936524F","Admin","Admin524F","IGNACIO","CEPEDA","SALDAÑA","Carrer Mont Blanc 6-24","621666142","08430","s","Carrer Mont Blanc 6-24","La Roca del Vallés","nofoto.jpg","ESPAN");
INSERT INTO usuario values (2,"41199170Y","rgaliano","cambiame","ROSA","GALIANO","BERNAT","Calle Noruega 2, 18B","694750840","38660","n","Calle Noruega 2, 18B","Adeje","nofoto.jpg","ESPAN");
INSERT INTO usuario values (3,"13584706D","yoliurbina","cambiame","YOLANDA","URBINA","DUARTE","Calle el Calvario 6","641709443","38420","n","Calle el Calvario 6","San Juan de la Rambla","nofoto.jpg","ESPAN");
INSERT INTO usuario values (4,"22386333L","domavi","cambiame","DOMINGO","MAZA","VIVAR","Calle las Eras 10","730440878","22100","n","Calle de las Eras 10","Sangarrén","nofoto.jpg","ESPAN");
INSERT INTO usuario values (5,"65449964Z","marcsanmiguel","cambiame","MARC","SAN MIGUEL","MOLANO","Calle La Coruña 11","658399994","03160","n","Calle La Coruña 11","Almoradí","nofoto.jpg","ESPAN");
INSERT INTO usuario values (6,"46344077C","paquitopamo","cambiame","FRANCISCO","PALACIO","MOLINA","Calle Edith Stein 5, 1º A","674582935","30400","n","Calle Edith Stein 5, 1º A","Caravaca de la Cruz","nofoto.jpg","ESPAN");
INSERT INTO usuario values (7,"60172828K","evanavalon","cambiame","EVA MARIA","NAVALON","DEL OLMO","Avenida Huesca 7","656993125","22100","n","Avenida Huesca 7", "Sangarrén","nofoto.jpg","ESPAN");
INSERT INTO usuario values (8,"66526943H","jcarco","cambiame","JOSE CARLOS","ARCO","HIDALGO","Calle Julián Ferández Ollero 3, 1º Der","656169706","26200","n","Calle Julián Ferández Ollero 3, 1º Der","Haro","nofoto.jpg","ESPAN");
INSERT INTO usuario values (9,"46778659V","hugobosscasco","cambiame","HUGO","CASTELLANOS","COLAS","Gaztulerzar Kalea, 9-1","771836781","01400","n","Gaztulerzar Kalea, 9-1","Llodio","nofoto.jpg","ESPAN");
INSERT INTO usuario values (10,"23706946H","nanaplasencia","cambiame","JUANA","PLASENCIA","ESPEJO","Calle Juan de la Cosa 21","69786107","18600","n","Calle Juan de la Cosa 21","Motril","nofoto.jpg","ESPAN");
INSERT INTO usuario values (11,"36902384B","fercazar","cambiame","FERNANDO","CASTELLA","ZARATE","Calle Navarejos 40-42, Bajo B","697897536","05440","n","Calle Navarejos 40-42, Bajo B","Piedralaves","nofoto.jpg","ESPAN");


INSERT INTO chat(fecha_hora,mensaje,cod_user)
values('2018-04-03', "Mensaje1.txt", 3),
('2018-06-10', "Mensaje2.txt", 11),
('2018-11-27', "Mensaje3.txt", 9),
('2018-10-04', "Mensaje4.txt", 7),
('2018-03-11', "Mensaje5.txt", 8 ),
('2018-12-05', "Mensaje6.txt", 6);

Insert Into valoracion values(00001 , 00001, 1, 'Muy bonito', 00001);
Insert Into valoracion values(00002 , 00002, 5, 'Muy bonito', 00002);
Insert Into valoracion values(00003 , 00003, 5, 'Muy bonito', 00003);
Insert Into valoracion values(00004 , 00004, 4, 'Muy bonito', 00004);
Insert Into valoracion values(00005 , 00005, 2, 'Muy bonito', 00005);
Insert Into valoracion values(00006 , 00006, 3, 'Muy bonito', 00006);
Insert Into valoracion values(00007 , 00007, 8, 'Muy bonito', 00007);
Insert Into valoracion values(00008 , 00008, 7, 'Muy bonito', 00008);
Insert Into valoracion values(00009 , 00009, 6, 'Muy bonito', 00009);
Insert Into valoracion values(00010 , 00010, 4, 'Muy bonito', 00010);

Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://banner2.kisspng.com/20180403/vqe/kisspng-balalaika-musical-instruments-string-instruments-musical-instruments-5ac390730aaaa7.1785574415227659390437.jpg","balalaika","Imagen de balalaika en png",00001,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://4.bp.blogspot.com/-ZpRIEkdkxDw/WUVaInmwhyI/AAAAAAAAAuU/pKqt2RYV27kyoyfAboBibpfbUfdFhFTpwCLcBGAs/s1600/fotonoticia_20140317124616_800.jpg","Litofono","Imagen de un xilofono pero viejo no, lo siguiente",00002,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://banner2.kisspng.com/20180527/zf/kisspng-mandolin-musical-instruments-ukulele-guitar-5b0a9678e04e10.0779018915274205369188.jpg","Mandolina","Imagen de una Mandolina",00003,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://4.bp.blogspot.com/-35_8sy-fQfc/WUqikes50pI/AAAAAAAAAxw/iUWV0sLdfbAOmWs1fqkIidq9i1sNdcZFACLcBGAs/s1600/zeusaphone.jpg","Thoramín","Thoramín electrico?",00004,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://static.lesluthiers.org/fotos/Instrumentos/formales/charango.png","charango","charango guitarra",00005,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://4.bp.blogspot.com/-YUGfZSaWnEA/WTWM9KIuHyI/AAAAAAAAAl4/L-hqJfSGMrg6ueBdIxpRWEz__YnOEeJXgCEw/s1600/bikelophone.jpg","Bicicletófono","Bicicletófono",00006,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://sinalefa2.files.wordpress.com/2009/11/zambomba1.jpg","zambomba","zambomba pero sin ser png",00007,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://scirescience.files.wordpress.com/2014/12/nelc3b3fono.jpg?w=640&h=428","Nelófono","Pues eso, de toda la vida un Nelófono",00008,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("https://assets.classicfm.com/2013/44/fluba-1383673254-view-1.jpg","Fluba","El viejo es dios",00009,0);
Insert Into imagen (url,texto_1,texto_2,producto_cod_producto,producto_usado_cod_pro_usado) Values 
    ("http://www3.gobiernodecanarias.org/medusa/mediateca/ecoescuela/wp-content/uploads/sites/2/2013/11/06-Bandurria.png","Bandurria","Una Bandurria de toda la vida",00010,0);

    insert into pedido(usuario_cod_user,total,pais) values
(4,43.99,'ESP'),
(5,59.77,'FRA'),
(4,43.95,'ESP'),
(8,69.96,'GER'),
(6,20.26,'FRA'),
(3,50.65,'BEL'),
(3,53.95,'NED'),
(8,22.71,'FRA'),
(2,18.82,'ITA'),
(4,68.44,'GBR'),
(2,60.95,'GBR'),
(7,13.58,'POR'),
(10,22.46,'NED'),
(6,54.59,'BEL'),
(9,5.55,'FRA'),
(5,14.16,'NED'),
(1,16.30,'FRA'),
(8,12.83,'POR'),
(1,5.26,'FRA'),
(11,43.99,'ESP');