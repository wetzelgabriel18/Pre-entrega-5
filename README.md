[Explicacion.txt](https://github.com/user-attachments/files/32159838/Explicacion.txt)
-- Consulta 1 — Vista base del proyecto (INNER JOIN)
El objetivo de la consulta 1 es armar una tabla que contenga las 
columnas fecha de venta, nombre del cliente, nombre del producto, 
descripción de la categoría, ciudad del cliente, cantidad comprada,
precio unitario y monto total de la venta. Sin tener en cuenta 
clientes sin compras y productos sin ventas.
Para obtener toda la información se debió realizar 4 inner join. 
Id_cliente en las tablas clientes y ventas
Id_producto en las tablas productos y ventas
Id_ciudad en las tablas ciudadees y clientes
Id_categoria en las tablas categorías y productos

-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
En la consulta dos se buscó armar una tabla que contenga id del cliente,
nombre, email, fecha de registro y la id de las ventas. Para esto, 
se creo un left join entre la tabla clientes, para que traiga todos 
los clientes, y la tabla ventas mediante el campo id_cliente.
La condición era que solo se muestren los clientes sin ventas, para 
lo que utilizamos la clausula WHERE id_venta IS NULL. 


Consulta 3 — Productos sin ventas (LEFT JOIN)
En esta consulta el objetivo era armar una tabla que muestre id del
producto, nombre, categoria, precio y id de las ventas. Se utilizó un
left join entre productos y ventas para traer toda la lista de productos,
y a su vez, otro left join entre categorias y productos, para traer el
nombre de la categoría. 
Se solicitaba mostros solo los productos sin ventas, para lo cual se 
utilizó la clausula WHERE id_venta IS NULL. 

-- Consulta 4 — Consolidado por canal (UNION ALL)
El objetivo final de esta consulta es agrupar las ventas presenciales
y las online, sumando el total de ventas. El criterio que se utilizó para
seleccionar las ventas presenciales fue que el cliente sea de Buenos Aires,
mientras que el resto de las ciudades se consideraron online. 
Para la modalidad presencial se realizó una subconsulta en donde se solicitó 
mostrar la cantidad por el precio unitario de la tabla ventas, renombrandolo 
total_venta, y se le colocó el canal presencial. Para que traiga las 
ciudades se utilizaron dos inner join. El primero con el id del cliente, de la 
tabla clientes y ventas, y el segundo con el id de la ciudad, entre la tabla 
ciudades y clientes. Para que solo se muestren las ventas en Buenos Aires se
utilizó la clausula WHERE el nombre de la ciudad es Buenos Aires. 
Para la modalidad online se realizó una subconsulta en donde se solicitó mostrar
la cantidad por el precio unitario de la tabla ventas, renombrandolo total_venta, 
y se le colocó el canal online. Para que traiga las ciudades se utilizaron dos 
inner join. El primero con el id del cliente, de la tabla clientes y ventas, y 
el segundo con el id de la ciudad, entre la tabla ciudades y clientes. Para que 
excluya las ventas en Buenos Aires se utilizó la clausula WHERE el nombre de la 
ciudad es diferente a Buenos Aires. 
Para finalizar se agrupo por canal. 
