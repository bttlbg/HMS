DROP DATABASE IF EXISTS HMS;

CREATE DATABASE IF NOT EXISTS HMS;

USE HMS;

#####################################################

# Creacion tabla Tipo_huesped
CREATE TABLE IF NOT EXISTS Tipo_huesped(
    idTipo_huesped INT NOT NULL,
    descripcion VARCHAR(45) NULL,
    PRIMARY KEY (idTipo_huesped)
);

# Creacion tabla huesped
CREATE TABLE IF NOT EXISTS Huesped(
    idHuesped INT NOT NULL,
    idTipo_huesped INT NOT NULL,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    PRIMARY KEY (idHuesped, idTipo_huesped),
    CONSTRAINT fk_tipoHuesped FOREIGN KEY (idTipo_huesped) REFERENCES Tipo_huesped(idTipo_huesped)
);

#####################################################

# Creacion tabla Reservas
CREATE TABLE IF NOT EXISTS Reservas(
    idReservas INT NOT NULL,
    idHuesped INT NOT NULL,
    PRIMARY KEY (idReservas, idHuesped),
    CONSTRAINT fk_reservas FOREIGN KEY (idHuesped) REFERENCES Huesped(idHuesped)
);

#####################################################

# Creacion tabla Tipo_habitacion
CREATE TABLE IF NOT EXISTS Tipo_habitacion(
    idTipo_habitacion INT NOT NULL,
    descripcion VARCHAR(45),
    capacidad INT,
    PRIMARY KEY (idTipo_habitacion)
);

# Creacion tabla habitacion
CREATE TABLE IF NOT EXISTS Habitacion(
    idHabitacion INT NOT NULL,
    idTipo_habitacion INT NOT NULL,
    numero INT,
    status VARCHAR(20),
    PRIMARY KEY (idHabitacion, idTipo_habitacion),
    CONSTRAINT fk_habitacion FOREIGN KEY (idTipo_habitacion) REFERENCES Tipo_habitacion(idTipo_habitacion)
);

#####################################################

# Creacion tablas Habitaciones_reservadas
CREATE TABLE IF NOT EXISTS Habitaciones_reservadas(
    idHabitaciones_reservadas INT NOT NULL,
    idReservas INT NOT NULL,
    idHuesped INT,
    idHabitacion INT NOT NULL,
    idTipo_habitacion INT,
    check_in DATE,
    check_out DATE,
    PRIMARY KEY (
        idHabitaciones_reservadas,
        idReservas,
        idHabitacion
    ),
    CONSTRAINT fk_h_reservadas FOREIGN KEY (idReservas, idHuesped) REFERENCES Reservas(idReservas, idHuesped),
    CONSTRAINT fk_hbt FOREIGN KEY (idHabitacion, idTipo_habitacion) REFERENCES Habitacion(idHabitacion, idTipo_habitacion)
);