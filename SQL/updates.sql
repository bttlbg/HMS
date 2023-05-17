# Actualizar el nombre de un huésped en la tabla Huesped:
UPDATE Huesped
SET nombre = 'Pedro'
WHERE idHuesped = 1;


# Actualizar la descripción de un tipo de habitación en la tabla Tipo_habitacion
UPDATE Tipo_habitacion
SET descripcion = 'Lujo'
WHERE idTipo_habitacion = 1;

# Actualizar la fecha de check-out de una habitación reservada en la tabla Habitaciones_reservadas
UPDATE Habitaciones_reservadas
SET check_out = '2023-05-22'
WHERE idHabitaciones_reservadas = 1;

# Actualizar el estado de una habitación en la tabla Habitacion
UPDATE Habitacion
SET status = 'Ocupada'
WHERE idHabitacion = 1;


# Actualizar el tipo de huesped de un huésped en la tabla Huesped:
UPDATE Huesped
SET idTipo_huesped = 2
WHERE idHuesped = 1;
