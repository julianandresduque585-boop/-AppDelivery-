SELECT 
-- Selección de campos relevantes de las tablas involucradas
-- Le decimos a sqlite que nos devuelva el ID del pedido, el nombre del cliente, el nombre del plato, 
--la cantidad y las opciones solicitadas en formato JSON
    p.ID_Pedido,
    --Le decimos a sqlite que nos devuelva el nombre del cliente y del plato en lugar de sus IDs
    u.Nombre AS Cliente,
    pl.Nombre AS Plato,
    dp.Cantidad,
    -- Uso de json_extract para sacar elementos específicos del string JSON
    json_extract(dp.Opciones_JSON, '$.extra[0]') AS Adicion_Solicitada,
    json_extract(dp.Opciones_JSON, '$.notas') AS Instruccion_Especial
-- De la tabla Pedido, unimos con Usuario para obtener el nombre del cliente, con Detalle_Pedido para obtener
-- los detalles del pedido y con Plato para obtener el nombre del plato
FROM Pedido p
JOIN Usuario u ON p.ID_Usuario = u.ID_Usuario
JOIN Detalle_Pedido dp ON p.ID_Pedido = dp.ID_Pedido
JOIN Plato pl ON dp.ID_Plato = pl.ID_Plato;

-- Reto 1: Optimización de consulta de platos
SELECT nombre, precio
FROM Plato
WHERE Categoria = 'Comida rapida';

SELECT COUNT(*) AS Total_Platos
FROM Plato;
SELECT *
FROM configuracion
WHERE json_extract(detalles_json, '$.tema') = 'oscuro';