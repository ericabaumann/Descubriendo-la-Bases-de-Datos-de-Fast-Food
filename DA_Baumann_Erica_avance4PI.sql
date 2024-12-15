--Avance 4

--Pregunta 1
SELECT  P.Nombre Producto,
        C.Nombre Categoria
FROM Productos P
INNER JOIN Categorias C ON (P. CategoriaId = C.CategoriaId);

--Pregunta 2
SELECT E. Nombre Empleado, S. Nombre Sucursal
FROM Empleados E
LEFT JOIN Sucursales S ON (E. SucursalId = S. SucursalId);

--Pregunta 3
SELECT P. Nombre, C. CategoriaId
FROM Productos P
LEFT JOIN Categorias C ON (P. CategoriaId = C. CategoriaId)
WHERE C.CategoriaId IS NULL;

--Pregunta 4
SELECT O. OrdenId, C. Nombre Cliente, E. Nombre Empleado, M. Nombre Mensajero
FROM Ordenes O
LEFT JOIN Clientes C ON (O. ClientesId = C.ClientesId)
LEFT JOIN Empleados E ON (O. EmpleadosId = E.EmpleadosId)
LEFT JOIN Mensajeros M ON (O. MensajerosId = M.MensajerosId);

--Pregunta 5
SELECT S. Nombre Sucursal, P. Nombre Producto, SUM (DO. Cantidad) AS ProductosVendidos
FROM Ordenes O
INNER JOIN DetallesOrdenes DO ON (O. OrdenId = DO. OrdenId)
INNER JOIN Productos P ON (DO. ProductoId = P. ProductoId)
INNER JOIN Sucursales S ON (O.SucursalId = S. SucursalId)
GROUP BY S. Nombre, P. Nombre
ORDER BY ProductosVendidos DESC;


