# Insertar un nuevo tipo de huesped en la tabla Tipo_huesped
INSERT INTO Tipo_huesped (idTipo_huesped, descripcion)
VALUES (5, 'Evento');

# Insertar un nuevo huésped en la tabla Huesped:
INSERT INTO Huesped (idHuesped, idTipo_huesped, nombre, apellidos)
VALUES (51, 5, 'Juan', 'Pérez');

# Insertar una nueva reserva en la tabla Reservas
INSERT INTO Reservas (idReservas, idHuesped)
VALUES (25, 51);

# Insertar una nueva habitación en la tabla Habitacion
INSERT INTO Habitacion (idHabitacion, idTipo_habitacion, numero, status)
VALUES (31, 1, 101, 'Disponible');

# Insertar una nueva habitación reservada en la tabla Habitaciones_reservadas
INSERT INTO Habitaciones_reservadas (idHabitaciones_reservadas, idReservas, idHabitacion, check_in, check_out)
VALUES (25, 25, 31, '2023-05-18', '2023-05-20');
