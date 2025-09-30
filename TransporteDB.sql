CREATE DATABASE TransporteDB

USE TransporteDB

CREATE TABLE Choferes (
    IdChofer INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Licencia NVARCHAR(50) NOT NULL UNIQUE,
    FechaContratacion DATE NOT NULL,
    FechaNacimiento DATE NOT NULL
)

CREATE TABLE Buses (
    IdBus INT PRIMARY KEY IDENTITY(1,1),
    Placa NVARCHAR(20) NOT NULL UNIQUE,
    Modelo NVARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL CHECK (Capacidad > 0),
    IdChofer INT NOT NULL,
    FOREIGN KEY (IdChofer) REFERENCES Choferes(IdChofer)
)


CREATE TABLE Rutas (
    IdRuta INT PRIMARY KEY IDENTITY(1,1),
    NombreRuta NVARCHAR(100) NOT NULL UNIQUE,
    PuntoInicio NVARCHAR(100) NOT NULL,
    PuntoFin NVARCHAR(100) NOT NULL
)


CREATE TABLE Boletos (
    IdBoleto INT PRIMARY KEY IDENTITY(1,1),
    IdBus INT NOT NULL,
    IdRuta INT NOT NULL,
    FechaVenta DATE NOT NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0),
    FOREIGN KEY (IdBus) REFERENCES Buses(IdBus),
    FOREIGN KEY (IdRuta) REFERENCES Rutas(IdRuta)
)

SELECT @@SERVERNAME AS 'Nombre del Servidor'

DELETE FROM choferes


-- Datos de prueba
INSERT INTO Choferes (Nombre, Licencia, FechaContratacion,FechaNacimiento) VALUES
('Juan Pérez', 'LIC001', '2023-01-15','2000-01-23'),
('María López', 'LIC002', '2023-02-20','2000-01-23');

INSERT INTO Rutas (NombreRuta, PuntoInicio, PuntoFin) VALUES
('Ruta Centro', 'Terminal Central', 'Plaza Mayor'),
('Ruta Norte', 'Terminal Norte', 'Centro Comercial');

INSERT INTO Buses (Placa, Modelo, Capacidad, IdChofer) VALUES
('ABC123', 'Mercedes Benz 2020', 45, 1),
('XYZ789', 'Volvo 2021', 50, 2);

INSERT INTO Boletos (IdBus, IdRuta, FechaVenta, Precio) VALUES
(1, 1, GETDATE(), 2.50),
(2, 2, GETDATE(), 3.00);
