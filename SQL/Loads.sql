USE HMS;

#################################################

# Importacion tipos de clientes
LOAD DATA INFILE 'HMS/txt/registro_tipo_huesped.csv'
    INTO TABLE Tipo_huesped
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

# Importacion Huespedes
LOAD DATA INFILE 'HMS/txt/registro_huesped.csv'
    INTO TABLE Huesped
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

#################################################

# Importacion tipo de Habitaciones
LOAD DATA INFILE 'HMS/txt/registro_tipos_habitaciones.csv'
    INTO TABLE Tipo_habitacion
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

# Importacion Habitaciones
LOAD DATA INFILE 'HMS/txt/registro_habitaciones.csv'
    INTO TABLE Habitacion
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

################################################

# Importacion Reservas
LOAD DATA INFILE 'HMS/txt/registro_reservas.csv'
    INTO TABLE Reservas
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';


# Importacion Habitaciones reservadas
LOAD DATA INFILE 'HMS/txt/registro_habitaciones_reservadas.csv'
    INTO TABLE Habitaciones_reservadas
	FIELDS TERMINATED BY ',' 
	LINES TERMINATED BY '\n' 
	(idHabitaciones_reservadas, idReservas, idHabitacion, check_in, check_out);
UPDATE Habitaciones_reservadas AS hr
JOIN Reservas AS r ON hr.idReservas = r.idReservas
JOIN Habitacion AS h ON hr.idHabitacion = h.idHabitacion
SET hr.idHuesped = r.idHuesped,
    hr.idTipo_habitacion = h.idTipo_habitacion;