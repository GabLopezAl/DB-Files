-- DROP DATABASE IF EXISTS tienda;
 CREATE DATABASE tienda
USE tienda;

CREATE TABLE fabricante (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio FLOAT NOT NULL,
  id_fabricante INT NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT *
FROM fabricante



--             CONSULTAS

-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre
FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM producto

-- Lista todas las columnas de la tabla producto.
SELECT *
FROM producto

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, (precio/18.73) P_EURO, (precio/16.94)P_USD
FROM producto

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre nombre_de_producto, (precio/18.73) euros, (precio/16.94) dólares
FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) nombre, precio
FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) nombre, precio
FROM producto

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) n_c
FROM fabricante

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, round(precio, 0) p_redondeado
FROM producto

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT a.id ID_FABRICANTE
FROM fabricante a
INNER JOIN producto b ON b.id_fabricante = a.id

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT a.id ID_FABRICANTE
FROM fabricante a
INNER JOIN producto b ON b.id_fabricante = a.id
GROUP BY a.id
HAVING COUNT(a.id) = 1

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
FROM DBO.fabricante
ORDER BY nombre

-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre
FROM DBO.fabricante
ORDER BY nombre DESC

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre
FROM producto
ORDER BY nombre

SELECT precio
FROM producto
ORDER BY precio DESC

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT *
FROM fabricante
WHERE id <=5

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
WHERE id IN(4,5)

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio precio_minimo
FROM producto 
WHERE precio IN(
SELECT MIN(precio)
FROM producto
)

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
WHERE precio IN(
SELECT MAX(precio)
FROM producto
)

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT A.nombre
FROM producto A
INNER JOIN fabricante B ON A.id_fabricante = B.id
WHERE A.id_fabricante = 2

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre
FROM producto
WHERE (precio/18.73) <= 120

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE (precio/18.73) >= 400

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE (precio/18.73) <= 400

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre
FROM producto 
WHERE (precio/18.73) >= 80 AND (precio/18.73) <= 300

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre 
FROM producto
WHERE (precio/18.73) BETWEEN 60 AND 200

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT A.nombre
FROM producto A
INNER JOIN fabricante B ON B.id = A.id_fabricante
WHERE (precio/18.73) > 200 AND B.id = 6

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT nombre
FROM producto
WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT nombre
FROM producto
WHERE id_fabricante IN (1,3,5)

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, (precio * 100) Precio_Céntimos
FROM producto

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre
FROM fabricante
WHERE nombre LIKE 's%'

--Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%e'

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%w%'

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '____'

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Portátil%'

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Monitor%' AND (precio/18.73) < 215

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, (precio/18.73) EURO
FROM producto
WHERE (precio/18.73) >= 180
ORDER BY (precio/18.73) DESC

SELECT nombre, (precio/18.73) EURO
FROM producto
WHERE (precio/18.73) >= 180
ORDER BY nombre


-- PROCEDIMIENTOS ALMACENADOS
-- Agregar un nuevo registro a la tabla fabricante

CREATE PROCEDURE INSERTAR_NUEVO_DATO @ID INT, @NAME VARCHAR(100)
AS
BEGIN
	INSERT INTO fabricante VALUES(@ID, @NAME)
END

EXEC INSERTAR_NUEVO_DATO 10, 'SAMSUNG'

SELECT * FROM fabricante


-- CONSULTAR UN REGISTRO DE LA TABLA PRODUCTO DADO EL ID

CREATE PROCEDURE CONSULTAR_REGISTRO @ID INT
AS
BEGIN
	SELECT *
	FROM producto
	WHERE id = @ID
END

EXEC CONSULTAR_REGISTRO 1


-- CONSULTAR UN REGISTRO DE LA TABLA PRODUCTO DADO CUALQUIER DATO DE CUALQUIER COLUMNA, SIN NINGUNA EN ESPECIFICO

CREATE PROCEDURE CONSULTAR_DATOS @DATO VARCHAR(100), @COLUMNA VARCHAR(100)
AS
BEGIN
	IF @COLUMNA = 'ID'
		SELECT *
		FROM producto
		WHERE id = @DATO
	ELSE IF @COLUMNA = 'NOMBRE'
			SELECT *
			FROM producto
			WHERE nombre = @DATO
	ELSE IF @COLUMNA = 'PRECIO'
			SELECT *
			FROM producto
			WHERE precio = @DATO
	ELSE IF @COLUMNA = 'ID_FABRICANTE'
			SELECT *
			FROM producto
			WHERE id_fabricante = @DATO
END

EXEC CONSULTAR_DATOS 86.99, 'PRECIO'

SELECT * FROM producto

--SACAR LOS PRODUCTOS DADO UN ID INICIAL Y UN ID FINAL Y QUE EL PRECIO ESTA ENTRE UN RANGO

CREATE PROCEDURE CONSULTA_DETALLADA @START_ID INT, @END_ID INT, @START_COST FLOAT, @END_COST FLOAT
AS
BEGIN
	SELECT *
	FROM producto
	WHERE id BETWEEN @START_ID AND @END_ID AND precio BETWEEN @START_COST AND @END_COST
END

EXEC CONSULTA_DETALLADA 1, 5, 80, 200

--PROCEDIMIENTO PARA INSERTAR UN PRODUCTO

CREATE PROCEDURE INSERT_PRODUCT @ID INT, @NAME VARCHAR(100), @PRECIO FLOAT, @ID_FAB INT
AS
BEGIN
	INSERT INTO producto VALUES(@ID, @NAME, @PRECIO, @ID_FAB)
END

EXEC INSERT_PRODUCT 12, 'Laptop HP Corei3 11va gen', 9500.23, 5
SELECT * FROM producto

--MOSTRAR EL NOMBRE DEL PRODUCTO Y EL PRECIO DADO EL ID DEL FABRICANTE

CREATE PROCEDURE SHOW_INFO @ID_FAB INT
AS
BEGIN
	SELECT nombre, precio
	FROM producto
	WHERE id_fabricante = @ID_FAB
END

EXEC SHOW_INFO 3
SELECT * FROM producto

--MOSTRAR CUANTOS PRODUCTOS TIENEN LOS FABRICANTES

ALTER PROCEDURE COUNT_PRODUCTS @ID_FABRICANTE INT
AS
BEGIN
	SELECT COUNT(nombre) NO_PROD, id_fabricante
	FROM producto
	WHERE id_fabricante = @ID_FABRICANTE
	GROUP BY id_fabricante
END

EXEC COUNT_PRODUCTS 7


-- FUNCIONES

--1. FUNCION QUE DEVUELVE EL NUMERO TOTAL DE PRODUCTOS DADO UN RANGO DE PRECIO
CREATE FUNCTION TOTAL
(
	@PRECIO1 FLOAT, @PRECIO2 FLOAT
)
RETURNS INT
AS
BEGIN	
	RETURN (SELECT COUNT(precio) TOTAL FROM producto WHERE precio BETWEEN @PRECIO1 AND @PRECIO2)
END

SELECT DBO.TOTAL(80.1, 199.9) TOTAL_PRODUCTOS

--2. FUNCION QUE DEVUELVA EL NOMBRE DEL PRODUCTO DADO EL ID DEL FABRICANTE
CREATE FUNCTION NOMBRE_PROD
(
	@ID INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @NOMBRE VARCHAR(100)
	SET @NOMBRE = (SELECT nombre FROM producto WHERE id_fabricante = @ID)
	RETURN @NOMBRE
END

SELECT DBO.NOMBRE_PROD(7) PRODUCTO



