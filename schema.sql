

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Detalle_Pedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Plato;
DROP TABLE IF EXISTS Restaurante;
DROP TABLE IF EXISTS Repartidor;
DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario (
    ID_Usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Correo TEXT NOT NULL,
    Telefono TEXT
);

CREATE TABLE Restaurante (
    ID_Restaurante INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Direccion TEXT NOT NULL,
    Categoria TEXT
);

CREATE TABLE Plato (
    ID_Plato INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Restaurante INTEGER,
    Nombre TEXT NOT NULL,
    Precio REAL NOT NULL,
    Descripcion TEXT,
    Foto_Ruta TEXT,
    Categoria TEXT,
    FOREIGN KEY (ID_Restaurante)
        REFERENCES Restaurante(ID_Restaurante)
);


CREATE TABLE Repartidor (
    ID_Repartidor INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Telefono TEXT,
    Estado TEXT
);

CREATE TABLE Pedido (
    ID_Pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Usuario INTEGER NOT NULL,
    ID_Repartidor INTEGER,
    Total REAL NOT NULL,
    FOREIGN KEY (ID_Usuario)
        REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Repartidor)
        REFERENCES Repartidor(ID_Repartidor)
);

CREATE TABLE Detalle_Pedido (
    ID_Detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Pedido INTEGER NOT NULL,
    ID_Plato INTEGER NOT NULL,
    Cantidad INTEGER NOT NULL,
    Opciones_JSON TEXT DEFAULT '{"extra":[],"notas":""}',
    FOREIGN KEY (ID_Pedido)
        REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Plato)
        REFERENCES Plato(ID_Plato)
);


