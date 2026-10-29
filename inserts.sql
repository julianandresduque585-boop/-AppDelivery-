PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- 1. RESTAURANTES
INSERT INTO Restaurante (ID_Restaurante, Nombre, Direccion, Categoria)
VALUES
    (1, 'Sabor Casero', 'Calle 10 # 5-20', 'Comida rapida'),
    (2, 'Pizza y Mas', 'Carrera 5 # 10-20', 'Italiana'),
    (3, 'Sushi Express', 'Calle 20 # 8-15', 'Japonesa'),
    (4, 'La Areperia', 'Calle 12 # 7-30', 'Colombiana'),
    (5, 'Delicias del Barrio', 'Carrera 8 # 14-25', 'Casera'),
    (6, 'El Buen Sabor', 'Carrera 4 # 18-10', 'Variada');

-- 2. USUARIOS
INSERT INTO Usuario
    (ID_Usuario, Nombre, Correo, Telefono)
VALUES
    (1, 'Juan Perez', 'juanperez@gmail.com', '1234567890'),
    (2, 'Maria Lopez', 'marialopez@gmail.com', '0987654321'),
    (3, 'Carlos Gomez', 'carlosgomez@gmail.com', '1122334455'),
    (4, 'Ana Torres', 'anatorres@gmail.com', '3001234567'),
    (5, 'Pedro Ramirez', 'pedroramirez@gmail.com', '3102345678'),
    (6, 'Laura Castro', 'lauracastro@gmail.com', '3203456789');

-- 3. REPARTIDORES
INSERT INTO Repartidor
    (ID_Repartidor, Nombre, Telefono, Estado)
VALUES
    (1, 'Pedro Martinez', '3011111111', 'Disponible'),
    (2, 'Laura Perez', '3022222222', 'Disponible'),
    (3, 'Andres Gomez', '3033333333', 'Disponible'),
    (4, 'Sofia Ramirez', '3044444444', 'Disponible'),
    (5, 'Diego Torres', '3055555555', 'Disponible'),
    (6, 'Camila Castro', '3066666666', 'Disponible');

-- 4. PLATOS
INSERT INTO Plato
    (ID_Plato, ID_Restaurante, Nombre, Precio, Descripcion, Foto_Ruta, Categoria)
VALUES
    (1, 1, 'Hamburguesa', 10.00, 'Hamburguesa clasica', 'images/hamburguesa.jpg' , 'Comida rapida'),
    (2, 1, 'Papas Fritas', 5.00, 'Papas fritas crujientes', 'images/papas_fritas.jpg' , 'chocolate'),
    (3, 2, 'Pizza', 12.00, 'Pizza de queso', 'images/pizza.jpg' , 'fresas'),
    (4, 2, 'Ensalada', 8.00, 'Ensalada fresca', 'images/ensalada.jpg' , 'ensalada'),
    (5, 3, 'Sushi', 15.00, 'Sushi variado', 'images/sushi.jpg' , 'sushi'),
    (6, 3, 'Perro Caliente', 9.00, 'Perro caliente clasico', 'images/perro_caliente.jpg' , 'perro'),
    (7, 1, 'Arepa Rellena', 9.00, 'Arepa rellena', 'images/Arepa_Rellena.jpg' , 'arepa'),
    (8, 2, 'Salchipapa', 11.00, 'Salchipapa tradicional', 'images/salchipapa.jpg' , 'salchipapa'),
    (9, 3, 'Lasana', 14.00, 'Lasana de carne', 'images/lasana.jpg' , 'lasana'),
    (10, 1, 'Nuggets de Pollo', 8.50, 'Nuggets de pollo', 'images/nuggets.jpg' , 'nuggets'),
    (11, 2, 'Sandwich', 7.50, 'Sandwich especial', 'images/sandwich.jpg' , 'sandwich'),
    (12, 3, 'Malteada', 6.00, 'Malteada de la casa', 'images/malteada.jpg' , 'malteada');

-- 5. PEDIDOS
INSERT INTO Pedido
    (ID_Pedido, ID_Usuario, ID_Repartidor, Total)
VALUES
    (1, 1, 1, 25.00),
    (2, 2, 2, 32.00),
    (3, 3, 3, 54.00),
    (4, 4, 4, 18.00),
    (5, 5, 5, 30.00),
    (6, 6, 6, 25.00),
    (7, 1, 2, 20.00),
    (8, 2, 3, 27.00),
    (9, 3, 4, 42.00),
    (10, 4, 5, 17.00),
    (11, 5, 6, 23.00),
    (12, 6, 1, 25.00);

-- 6. DETALLES DE LOS PEDIDOS
INSERT INTO Detalle_Pedido
    (ID_Pedido, ID_Plato, Cantidad, Opciones_JSON)
VALUES
    (1, 1, 2, '{"extra":["Queso"],"notas":"Sin cebolla"}'),
    (1, 2, 1, '{"extra":[],"notas":"Bien crujientes"}'),
    (2, 3, 2, '{"extra":["Queso"],"notas":"Sin aceitunas"}'),
    (2, 4, 1, '{"extra":[],"notas":"Sin tomate"}'),
    (3, 5, 3, '{"extra":[],"notas":"Salsa aparte"}'),
    (3, 6, 1, '{"extra":["Queso"],"notas":"Sin cebolla"}'),
    (4, 7, 2, '{"extra":["Carne"],"notas":"Bien caliente"}'),
    (4, 10, 1, '{"extra":[],"notas":"Con salsa"}'),
    (5, 8, 2, '{"extra":["Queso"],"notas":"Sin cebolla"}'),
    (5, 11, 1, '{"extra":[],"notas":"Sin tomate"}'),
    (6, 12, 2, '{"extra":["Chocolate"],"notas":"Fria"}'),
    (6, 2, 1, '{"extra":[],"notas":"Poca sal"}'),
    (7, 1, 1, '{"extra":["Tocineta"],"notas":"Sin pepinillos"}'),
    (7, 7, 1, '{"extra":[],"notas":"Con queso"}'),
    (8, 3, 1, '{"extra":["Queso"],"notas":"Bien cocida"}'),
    (8, 8, 1, '{"extra":[],"notas":"Salsa aparte"}'),
    (9, 9, 2, '{"extra":["Queso"],"notas":"Bien caliente"}'),
    (10, 4, 1, '{"extra":[],"notas":"Sin cebolla"}'),
    (10, 10, 1, '{"extra":[],"notas":"Con salsa de tomate"}'),
    (11, 11, 2, '{"extra":["Queso"],"notas":"Sin lechuga"}'),
    (12, 12, 2, '{"extra":["Chocolate"],"notas":"Sin crema"}');

COMMIT;

-- RETO PRACTICO 2: INSERCION MASIVA Y TRANSACCIONES

BEGIN TRANSACTION;

WITH RECURSIVE productos(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM productos
    WHERE n < 1000
)
INSERT INTO Plato (ID_Plato, ID_Restaurante, Nombre, Precio, Descripcion, Foto_Ruta, Categoria)
SELECT
    n,
    1,
    'Producto ' || n,
    ROUND(5.00 + (n % 100), 2),
    'sin descripcion',
    'default.jpg',
    CASE (n % 12)
        WHEN 0 THEN 'Comida rapida'
        WHEN 1 THEN 'chocolate'
        WHEN 2 THEN 'fresas'
        WHEN 3 THEN 'ensalada'
        WHEN 4 THEN 'sushi'
        WHEN 5 THEN 'perro'
        WHEN 6 THEN 'arepa'
        WHEN 7 THEN 'salchipapa'
        WHEN 8 THEN 'lasana'
        WHEN 9 THEN 'nuggets'
        WHEN 10 THEN 'sandwich'
        WHEN 11 THEN 'malteada'
        ELSE 'Acompañamientos'    
    END
FROM productos;

COMMIT;

