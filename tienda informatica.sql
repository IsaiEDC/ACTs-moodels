DROP DATABASE  IF EXISTS actividad_6;

CREATE DATABASE actividad_6;

USE actividad_6;


CREATE TABLE fabricantes (
	id_fabricante INT  primary key,
    nombre varchar (100)
);	


CREATE TABLE productos (
	codigo INT primary key,
    nombre varchar (200),
    precio DOUBLE,
	fabricantes_id_fabricante INT,
	CONSTRAINT productos_fabrincantes_id_fabricante_fk
    FOREIGN KEY (fabricantes_id_fabricante)
    REFERENCES fabricantes (id_fabricante)
);

INSERT INTO fabricantes VALUES
	(1, 'ASUS'),
    (2, 'LENOVO'),
    (4, 'SAMSUNG'),
    (5, 'SEAGATE'),
    (6,'CRUCIAL'),
    (7, 'GIGABYTE'),
    (8, 'HUAWEI'),
    (9, 'XIAOMI');
    
INSERT INTO productos VALUES
	(1, 'Disco Duro SATA3 1TB',86.99,5),
    (2, 'Memoria RAM DDR4 8GB',120,6),
    (3, 'Disco SSD 1TB' ,150.99,4),
    (4, 'GeForce GTX 1050 Ti',185,7),
	(5, 'GeForce GTX 1080 Xtreme',755,6),
    (6, 'Monitor 24 LED Full HD',202,1),
    (7, 'Monitor 27 LED Full HD',245.99,1),
    (8, 'Portatil Yoga 520',559,2),
    (9, 'Portatil Ideapad 320',444,2),
    (10, 'Impresora HP Deskjet 3720',59.99,3),
    (11, 'Impresora HP Laserjet Pro M26nw',180,3);
    
    SELECT * FROM fabricantes;
    
    SELECT * FROM productos;
    
	SELECT *
    FROM productos join fabricantes
    ON productos.nombre = fabricantes.id_fabricante;
    
    SELECT productos
    FROM productos JOIN fabricantes
    ON productos.fabricantes_id_fabricante = fabricantes_id_fabricante;