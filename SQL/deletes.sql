# Eliminar todos los registros de la tabla "Habitaciones_reservadas" 
# que tengan una fecha de check-in anterior a una fecha específica
DELETE FROM Habitaciones_reservadas
WHERE check_in < '2023-01-01';

# Eliminar un huésped de la tabla Huesped:
DELETE FROM Huesped
WHERE idHuesped = 1;

# Eliminar una reserva de la tabla Reservas
DELETE FROM Reservas
WHERE idReservas = 1;

# Eliminar una habitación de la tabla Habitacion:
DELETE FROM Habitacion
WHERE idHabitacion = 1;

# Eliminar una habitación reservada de la tabla Habitaciones_reservadas
DELETE FROM Habitaciones_reservadas
WHERE idHabitaciones_reservadas = 1;
