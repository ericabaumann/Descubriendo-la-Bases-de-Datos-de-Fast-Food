-- Erica Baumann

-- Avance 1

-- Paso 1: Crear base de datos

CREATE DATABASE fast_food_db
ON
(   NAME = 'fast_food_data',
    FILENAME = '/Users/eribaumann/Library/CloudStorage/GoogleDrive-ericabaumann@gmail.com/My Drive/Henry/sql_pi_m2/fast_food_data.mdf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB)
LOG ON
(   NAME = 'fast_food_log',
    FILENAME = '/Users/eribaumann/Library/CloudStorage/GoogleDrive-ericabaumann@gmail.com/My Drive/Henry/sql_pi_m2/fast_food_log.ldf',
    SIZE = 25MB,
    MAXSIZE = 256GB,
    FILEGROWTH = 5MB);


-- Usar la base de datos
USE fast_food_db;

-- Paso 2: Crear tablas

--      CATEGORIAS
CREATE TABLE Categorias (
    CategoriaId        INT             PRIMARY KEY IDENTITY,
    Nombre             VARCHAR(100)    NOT NULL
);

--      PRODUCTOS
CREATE TABLE Productos (
    ProductoId          INT             PRIMARY KEY IDENTITY,
    Nombre              VARCHAR(100)    NOT NULL,
    CategoriaId         INT,
    Precio              DECIMAL(10, 2)  NOT NULL,
    FOREIGN KEY (CategoriaId) REFERENCES Categorias(CategoriaId)
);

--     SUCURSALES
CREATE TABLE Sucursales (
    SucursalId          INT             PRIMARY KEY IDENTITY,
    Nombre              VARCHAR(100)    NOT NULL,
    Direccion           VARCHAR (100)
);

--      EMPLEADOS
CREATE TABLE Empleados (
    EmpleadosId         INT             PRIMARY KEY IDENTITY,
    Nombre              VARCHAR (100)   NOT NULL,
    Posicion            VARCHAR (100)   NOT NULL,
    Departamento        VARCHAR (100)   NOT NULL,
    SucursalId          INT,
    Rol                 VARCHAR (50), -- vendedor, mensajero, etc.
    FOREIGN KEY (SucursalId) REFERENCES Sucursales (SucursalId)
);


-- CLIENTES
CREATE TABLE Clientes (
    ClientesId          INT             PRIMARY KEY IDENTITY,
    Nombre              VARCHAR (100)   NOT NULL,
    Direccion           VARCHAR (100)
);

-- ORIGENES ORDEN
CREATE TABLE OrigenesOrden (
    OrigenId            INT             PRIMARY KEY IDENTITY,
    Descripcion         VARCHAR (100)   NOT NULL
);

-- TIPO DE PAGO
CREATE TABLE TipoPago (
    TipoPagoId          INT             PRIMARY KEY IDENTITY,
    Descripcion         VARCHAR(100)    NOT NULL
);

-- MENSAJEROS
CREATE TABLE Mensajeros (
    MensajerosId        INT             PRIMARY KEY IDENTITY,
    Nombre              VARCHAR (100)   NOT NULL,
    EsExterno           BIT             NOT NULL
);

-- ORDENES
CREATE TABLE Ordenes (
    OrdenId             INT             PRIMARY KEY IDENTITY,
    ClientesId          INT,
    EmpleadosId         INT, -- Empleado que toma la orden
    SucursalId          INT,
    MensajerosId        INT, -- Pueden ser externos o empleados de la empresa
    TipoPagoId          INT,
    OrigenId            INT, -- En linea, presencial, telefono, drive-thru
    HorarioVenta        VARCHAR (50)    NOT NULL, -- Mañana, tarde y noche
    TotalCompra         DECIMAL (10,2)  NOT NULL,
    KilometrosRecorrer  DECIMAL (10,2), -- Si es domicilio
    FechaDespacho       DATETIME, -- Si es domicilio (Hora y fecha se entrega al repatidor)
    FechaEntrega        DATETIME, -- Si es domicilio (Hora y fecha entrega al cliente)
    FechaOrdenTomada    DATETIME        NOT NULL, -- Hora y fecha de toma de orden
    FechaOrdenLista     DATETIME        NOT NULL, -- Hora y fecha de salir de cocina
    FOREIGN KEY (ClientesId) REFERENCES Clientes (ClientesId),
    FOREIGN KEY (EmpleadosId) REFERENCES Empleados (EmpleadosId),
    FOREIGN KEY (SucursalId) REFERENCES Sucursales (SucursalId),
    FOREIGN KEY (MensajerosId) REFERENCES Mensajeros (MensajerosId),
    FOREIGN KEY (TipoPagoId) REFERENCES TipoPago (TipoPagoId),
    FOREIGN KEY (OrigenId) REFERENCES OrigenesOrden (OrigenId)
);

-- DETALLES DE ORDENES
CREATE TABLE DetallesOrdenes (
    OrdenId             INT,
    ProductoId          INT,
    Cantidad            INT,
    Precio              DECIMAL (10,2),
    PRIMARY KEY (OrdenId, ProductoId),
    FOREIGN KEY (OrdenId) REFERENCES Ordenes (OrdenId),
    FOREIGN KEY (ProductoId) REFERENCES Productos (ProductoId)
);


