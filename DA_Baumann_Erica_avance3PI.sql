--AVANCE 3

--Pregunta 1
SELECT SUM(TotalCompra) AS VentasNivelGlobal
FROM Ordenes;

--Pregunta 2
SELECT CategoriaId,
CAST (AVG (Precio) AS DECIMAL (10,2))PrecioPromedio
FROM Productos
GROUP BY CategoriaId;

--Pregunta 3
SELECT SucursalId,
MIN (TotalCompra) AS OrdenMinimo,
MAX (TotalCompra) AS OrdenMaximo
FROM Ordenes
GROUP by SucursalId;

--Pregunta 4
SELECT MAX (KilometrosRecorrer) AS 'Maximo'
FROM Ordenes;

--Pregunta 5
SELECT OrdenId,
AVG (Cantidad) AS PromedioCantidadProductos
FROM DetallesOrdenes
GROUP BY OrdenId;

--Pregunta 6
SELECT TipoPagoId,
SUM (TotalCompra) AS TotalVentas
FROM Ordenes
GROUP BY TipoPagoId
ORDER BY TotalVentas DESC;

--Pregunta 7
SELECT TOP 1 SucursalId,
CAST (AVG (TotalCompra) AS DECIMAL (10,2))PromedioVentas
FROM Ordenes
GROUP BY SucursalId
ORDER BY PromedioVentas DESC;

--Pregunta 8
SELECT SucursalId,
SUM (TotalCompra) AS TotalVentas
FROM Ordenes
GROUP BY SucursalId
HAVING SUM (TotalCompra) > 50
ORDER BY TotalVentas DESC;

--Pregunta 9
(SELECT 'Antes del 1 de julio de 2023' AS Periodo,
CAST (AVG (TotalCompra) AS DECIMAL (10,2)) TotalVentas
FROM Ordenes
WHERE FechaOrdenTomada < ('2023-07-01'))
UNION
(SELECT 'Despues del 1 de julio de 2023' AS Periodo,
CAST (AVG (TotalCompra) AS DECIMAL (10,2)) TotalVentas
FROM Ordenes
WHERE FechaOrdenTomada > ('2023-07-01'));

--Pregunta10
SELECT HorarioVenta,
COUNT (*) AS CantidadVentas,
CAST (AVG (TotalCompra) AS DECIMAL (10,2)) PromedioVentas,
MAX (TotalCompra) AS VentaMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY CantidadVentas DESC;