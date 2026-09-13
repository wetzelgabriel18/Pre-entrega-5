USE Ventas_Tech_DB

SELECT * FROM ventas
SELECT * FROM clientes
SELECT * FROM productos
SELECT * FROM ciudades
SELECT * FROM categorias

-- Consulta 1 — Vista base del proyecto (INNER JOIN)

SELECT 
v.fecha_venta,
c.nombre,
p.nombre_producto,
ca.descripcion,
ci.nombre_ciudad,
v.cantidad,
v.precio_unitario, 
(v.cantidad * v.precio_unitario) AS 'total de venta'
FROM Ventas V
INNER JOIN Clientes C ON c.id_cliente = v.id_cliente 
INNER JOIN Productos P ON p.id_producto = v.id_producto
INNER JOIN ciudades CI ON ci.id_ciudad = c.id_ciudad
INNER JOIN categorias CA ON ca.id_categoria = p.id_categoria; 

-- Consulta 2 — Clientes sin ventas (LEFT JOIN)

SELECT 
c.id_cliente,
c.nombre,
c.email,
c.fecha_registro,
v.id_venta
FROM Clientes C
LEFT JOIN Ventas V ON v.id_cliente = c.id_cliente
WHERE v.id_venta IS NULL; 

-- Consulta 3 — Productos sin ventas (LEFT JOIN)

SELECT 
p.id_producto,
p.nombre_producto,
ca.descripcion,
p.precio,
v.id_venta
FROM productos P
LEFT JOIN Ventas V ON v.id_producto = p.id_producto
LEFT JOIN categorias Ca ON Ca.id_categoria = p.id_categoria
WHERE v.id_venta IS NULL; 

-- Consulta 4 — Consolidado por canal (UNION ALL)

SELECT 
SUM(total_venta) AS total_general, canal
FROM (
SELECT 
(v.cantidad * v.precio_unitario) AS total_venta, 'Presencial' AS canal
FROM Ventas v
INNER JOIN clientes c ON c.id_cliente = v.id_cliente
INNER JOIN ciudades ci ON ci.id_ciudad = c.id_ciudad
WHERE ci.nombre_ciudad = 'Buenos Aires'
UNION ALL
SELECT 
(v.cantidad * v.precio_unitario) AS total_venta, 'Online' AS canal
FROM Ventas v
INNER JOIN clientes c ON c.id_cliente = v.id_cliente
INNER JOIN ciudades ci ON ci.id_ciudad = c.id_ciudad
WHERE ci.nombre_ciudad <> 'Buenos Aires'
) AS subconsulta
GROUP BY canal;