DROP DATABASE  IF EXISTS actividad_6;

CREATE DATABASE actividad_6;

USE actividad_6;


CREATE TABLE fabricantes (
	id_fabricante INT AUTO_INCREMENT primary key,
    nombre varchar(100) UNIQUE NOT NULL
);	


CREATE TABLE productos (
	codigo INT AUTO_INCREMENT primary key,
    nombre varchar (200) NOT NULL UNIQUE,  
    precio DOUBLE DEFAULT 0.01,
	fabricantes_id_fabricante INT,
	CONSTRAINT productos_fabrincantes_id_fabricante_fk
    FOREIGN KEY (fabricantes_id_fabricante)
    REFERENCES fabricantes (id_fabricante)
);

INSERT INTO fabricantes VALUES
	(not null, 'ASUS'),
    (not null, 'LENOVO'),
    (not null, 'HAWLETT-PACKART'),
    (not null, 'SAMSUNG'),
    (not null, 'SEAGATE'),
    (not null, 'CRUCIAL'),
    (not null, 'GIGABYTE'),
    (not null, 'HUAWEI'),
    (not null, 'XIAOMI');
    
INSERT INTO productos VALUES
	(not null, 'Disco Duro SATA3 1TB',86.99,5),
    (not null, 'Memoria RAM DDR4 8GB',120,6),
    (not null, 'Disco SSD 1TB' ,150.99,4),
    (not null, 'GeForce GTX 1050 Ti',185,7),
	(not null, 'GeForce GTX 1080 Xtreme',755,6),
    (not null, 'Monitor 24 LED Full HD',202,1),
    (not null, 'Monitor 27 LED Full HD',245.99,1),
    (not null, 'Portatil Yoga 520',559,2),
    (not null, 'Portatil Ideapad 320',444,2),
    (not null, 'Impresora HP Deskjet 3720',59.99,3),
    (not null, 'Impresora HP Laserjet Pro M26nw',180,3);
    
    /* 
    Consulta de Lista 1 de actividad 6
    */
    
    SELECT * FROM fabricantes;
    
     /* 
    Consulta de Lista 2 de actividad 6
    */
    
	SELECT *
    FROM productos join fabricantes
    ON productos.nombre = fabricantes.id_fabricante;
    
	SELECT *
    FROM productos join fabricantes
    ON fabricantes_id_fabricante = fabricantes.id_fabricante;
    
	 /* 
    Funciones SQL de actividad 7
    1.Calcula el número total de productos que hay en la tabla productos. 
    */

	SELECT 
	productos.nombre as productos,
	count(productos.nombre) as 'total de productos'
	FROM productos
	group by productos;
    
     /* 
	Funciones SQL de actividad 7 
    2.Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
    El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
    Ordene el resultado descendentemente por el número de productos.
    */
    
	SELECT 
	fabricantes.nombre as fabricantes,
	count(productos.codigo) as 'numero productos'
	FROM fabricantes join productos
	ON fabricantes.id_fabricante = fabricantes.id_fabricante
	group by fabricantes.id_fabricante;
    
    /*
    3.Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
    El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
    */
    
    SELECT producto, max(precio),min(precio),(avg(precio))
    FROM producto;
    
    /*
    4.Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y 
    el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
    Es necesario mostrar el nombre del fabricante.
    */
    
    SELECT nombre,max(producto.precio),min(producto.precio),(avg(producto.precio))
    FROM fabricante;
    
    /*
     Operaciones en una Base de Datos ACT 9 
     1.Lista el nombre de todos los productos que hay en la tabla producto.
    */
    
    SELECT productos,nombres
    FROM productos;
    
    /*
    2.Lista los nombres y los precios de todos los productos de la tabla producto.
    */
     
     SELECT nombre,precio
     FROM productos;
     
     /*
     3.Lista todas las columnas de la tabla producto.
     */
    
    SELECT *
    FROM producto;
    
    /*
    4.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
    */
    
    SELECT nombre,precio,fabricante
    FROM productos JOIN fabricante;
    
    /*
    Subconsultas (En la cláusula WHERE)
    1.Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
    */
    
    SELECT * 
	FROM productos 
	WHERE fabricantes = (
	SELECT nombres 
	FROM fabricante
	WHERE nombre = 'LENOVO');
    
    /*
    2.Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
    */
    
    SELECT *
    FROM productos
    WHERE precio = (
    SELECT precio
    FROM productos
    WHERE precio = max(productos.precio)
    );
    
    /*
    3.Lista el nombre del producto más caro del fabricante Lenovo.
    */
    
    SELECT precio
    FROM productos
    WHERE productos = (
    SELECT nombre
    FROM productos 
    WHERE nombre = 'LENOVO'
    );
