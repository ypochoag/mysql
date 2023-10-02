DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
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
FROM fabricante;

SELECT *
FROM producto;

SELECT nombre
FROM producto;

SELECT nombre, precio
FROM producto;

SELECT nombre, ROUND(precio)
FROM producto;

SELECT codigo_fabricante
FROM producto;

SELECT codigo_fabricante
FROM producto
GROUP BY codigo_fabricante;

SELECT nombre
FROM fabricante
ORDER BY nombre ASC;

SELECT nombre
FROM producto
ORDER BY nombre ASC;

SELECT nombre, ROUND(precio)
FROM producto
ORDER BY precio DESC;

SELECT nombre
FROM fabricante
LIMIT 5;

SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

SELECT nombre, precio
FROM producto
WHERE precio <= 120;

SELECT nombre, precio
FROM producto
WHERE precio BETWEEN 60 AND 200;

SELECT nombre, codigo_fabricante
FROM producto
WHERE codigo_fabricante IN (1,3,5);

SELECT nombre
FROM producto
WHERE nombre LIKE "%Portatil%";

SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre
FROM producto p
INNER JOIN  fabricante f
ON  p.codigo_fabricante = f.codigo;

SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN  fabricante f
ON  p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN  fabricante f
ON  p.codigo_fabricante = f.codigo
WHERE p.precio = (SELECT MIN(precio) FROM producto);

SELECT p.nombre, f.nombre
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

SELECT p.nombre, f.nombre, p.precio
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio>200;

SELECT p.nombre, f.nombre
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN('Asus', 'Hewlett-Packard');

SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE p.precio>=180
ORDER BY p.precio DESC;

SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE p.precio>=180
ORDER BY p.nombre ASC;









