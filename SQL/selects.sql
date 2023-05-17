# Obtener todos los tipos de habitación disponibles
SELECT *
FROM Tipo_habitacion;

# Obtener los nombres de los huéspedes y su tipo de habitación reservada
SELECT h.nombre, h.apellidos, th.descripcion AS tipo_habitacion
FROM Huesped h
JOIN Habitaciones_reservadas hr ON h.idHuesped = hr.idHuesped
JOIN Habitacion hab ON hr.idHabitacion = hab.idHabitacion
JOIN Tipo_habitacion th ON hab.idTipo_habitacion = th.idTipo_habitacion;

# Obtener las reservas realizadas por un huésped específico
SELECT r.idReservas, r.idHuesped, hr.idHabitaciones_reservadas, hr.idHabitacion, hr.check_in, hr.check_out
FROM Reservas r
JOIN Habitaciones_reservadas hr ON r.idReservas = hr.idReservas
WHERE r.idHuesped = 17; -- Cambiar el valor 1 por el ID del huésped deseado

# Obtener el número de habitaciones reservadas por tipo de habitación
SELECT th.descripcion AS tipo_habitacion, COUNT(*) AS cantidad_reservadas
FROM Habitaciones_reservadas hr
JOIN Habitacion hab ON hr.idHabitacion = hab.idHabitacion
JOIN Tipo_habitacion th ON hab.idTipo_habitacion = th.idTipo_habitacion
GROUP BY th.descripcion;

# Obtener las habitaciones reservadas que están actualmente ocupadas
SELECT hr.idHabitaciones_reservadas, hab.numero, hr.check_in, hr.check_out
FROM Habitaciones_reservadas hr
JOIN Habitacion hab ON hr.idHabitacion = hab.idHabitacion
WHERE hr.check_out IS NULL; -- Habitaciones reservadas sin fecha de check-out
