USE TiendaOnline;

 
SELECT * FROM Clientes WHERE Nombre = "Juan Pérez";


SELECT * FROM Productos WHERE Precio != 100;

SELECT * FROM Pedidos WHERE Total > 500;


SELECT * FROM Productos WHERE Stock < 20;

SELECT * FROM Clientes WHERE Fecha_Registro > '2024-01-01';


SELECT * FROM Productos WHERE Precio BETWEEN 100 AND 500;

SELECT * FROM Productos WHERE Precio NOT BETWEEN 200 AND 1000;

SELECT * FROM Clientes WHERE ID_Clientes = (1, 3, 5);

SELECT * FROM Clientes WHERE ID_Clientes IN (1, 3, 5);

SELECT * FROM Pedidos WHERE YEAR(fecha_pedido) = '2024';

SELECT
    Clientes. Nombre AS Cliente,
	Productos. Nombre AS Producto
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido 
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos. ID_Producto;

SELECT
	Productos. Nombre AS Producto,
	Pedidos_Productos.Cantidad
FROM Pedidos
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido 
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos. ID_Producto;

SELECT
	Clientes.Nombre AS Cliente,
    COUNT(Pedidos.ID_Pedido) AS Total_Pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.ID_Cliente;

SELECT
	Clientes.Nombre AS Cliente,
	SUM(Pedidos.Total) AS Total_Gastado
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.ID_Cliente;

SELECT
	Clientes.Nombre AS Cliente,
	Pedidos.Total
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
WHERE Fecha_Pedido > '2024-02-01';

SELECT
	Productos.Nombre AS Producto
FROM Productos
WHERE Productos.ID_Producto NOT IN (SELECT ID_Producto FROM Pedidos_Productos);

SELECT
	Clientes.Nombre AS Cliente
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
ORDER BY Pedidos.Total DESC
LIMIT 1;

SELECT 
	Productos.Nombre AS Producto,
    SUM(Pedidos_Productos.Cantidad) AS Total_Vendido
FROM Productos
JOIN Pedidos_Productos ON Productos.ID_Producto = Pedidos_Productos.ID_Producto
GROUP BY Productos.ID_Producto;

SELECT
	Clientes.Nombre AS Cliente,
    Direcciones.Calle,
    Pedidos.ID_Pedido,
    Pedidos.Fecha_Pedido,
    Pedidos.Estado,
    Pedidos.Total
FROM Clientes
JOIN Direcciones ON Clientes.ID_Cliente = Direcciones.ID_Direccion
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;

SELECT
	Productos.Nombre AS Producto
FROM Productos
WHERE Productos.Nombre LIKE '%Sony%';