DROP DATABASE IF EXISTS HMS;

CREATE DATABASE IF NOT EXISTS HMS;
USE HMS;

# Creacion tabla Tipo_huesped
CREATE TABLE IF NOT EXISTS Tipo_huesped(
    idTipo_huesped INT NOT NULL,
    descripcion VARCHAR(45) NULL,

    PRIMARY KEY (idTipo_huesped)
);

# Creacion tabla huesped
CREATE TABLE IF NOT EXISTS Huesped(
	idHuesped INT NOT NULL,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    idTipo_huesped INT NOT NULL,
    
    PRIMARY KEY (idHuesped, idTipo_huesped),
    
    CONSTRAINT fk_tipoHuesped
		FOREIGN KEY (idTipo_huesped)
        REFERENCES Tipo_huesped(idTipo_huesped)
);

# Creacion tabla Reservas
CREATE TABLE IF NOT EXISTS Reservas(
    idReservas INT NOT NULL,
    fecha_entrada DATE,
    fecha_salida DATE,
    idHuesped INT NOT NULL,

    PRIMARY KEY (idReservas, idHuesped),

    CONSTRAINT fk_reservas
        FOREIGN KEY (idHuesped)
        REFERENCES Huesped(idHuesped)
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
    numero INT,
    status VARCHAR(45),
    idTipo_habitacion INT NOT NULL,

    PRIMARY KEY (idHabitacion, idTipo_habitacion),

    CONSTRAINT fk_habitacion
        FOREIGN KEY (idTipo_habitacion)
        REFERENCES Tipo_habitacion(idTipo_habitacion)
);


#####################################################

# Creacion tablas Habitaciones_reservadas
CREATE TABLE IF NOT EXISTS Habitaciones_reservadas(
    idHabitaciones_reservadas INT NOT NULL,
    idReservas INT NOT NULL,
    idTipo_habitacion INT NOT NULL,

    PRIMARY KEY (idHabitaciones_reservadas, idReservas, idTipo_habitacion),

    CONSTRAINT fk_h_reservadas
        FOREIGN KEY (idReservas)
        REFERENCES Reservas(idReservas),

    CONSTRAINT fk_hbt
        FOREIGN KEY (idTipo_habitacion)
        REFERENCES Habitacion(idTipo_habitacion)
);

##########################################################
# Creacion tabla Habitaciones_ocupadas
CREATE TABLE IF NOT EXISTS Habitaciones_ocupadas(
    idHabitaciones_ocupadas INT NOT NULL,
    hora_entrada DATE,
    hora_salida DATE,
    idHabitacion INT NOT NULL,
    idReservas INT NOT NULL,

    PRIMARY KEY (idHabitaciones_ocupadas, idHabitacion, idReservas),

    CONSTRAINT fk_ho_1
        FOREIGN KEY (idHabitacion)
        REFERENCES Habitacion(idHabitacion),

    CONSTRAINT fk_ho_2
        FOREIGN KEY (idReservas)
        REFERENCES Reservas(idReservas)
);