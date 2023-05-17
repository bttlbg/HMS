# Obtener el tipo de habitación de una habitación específica
SELECT descripcion
FROM Tipo_habitacion
WHERE idTipo_habitacion = (SELECT idTipo_habitacion FROM Habitacion WHERE idHabitacion = 1); -- Cambiar el valor 1 por el ID de la habitación deseada

# Obtener el número total de reservas realizadas por un huésped
SELECT COUNT(*) AS total_reservas
FROM Reservas
WHERE idHuesped = 27; -- Cambiar el valor 1 por el ID del huésped deseado

# Obtener el nombre del tipo de huesped de un huésped específico
SELECT descripcion
FROM Tipo_huesped
WHERE idTipo_huesped = (SELECT idTipo_huesped FROM Huesped WHERE idHuesped = 1); -- Cambiar el valor 1 por el ID del huésped deseado

# Obtener el número de habitaciones reservadas por un huésped específico
SELECT COUNT(*) AS total_reservadas
FROM Habitaciones_reservadas
WHERE idHuesped = 30; -- Cambiar el valor 1 por el ID del huésped deseado

# Obtener las reservas realizadas en una fecha específica
SELECT r.idReservas, r.idHuesped
FROM Reservas r
WHERE r.idReservas IN (SELECT idReservas FROM Habitaciones_reservadas WHERE check_in = '2020-05-01'); -- Cambiar por la fecha deseada

#**
# Obtener el número de habitaciones reservadas por tipo de habitación para una reserva específica
#SELECT th.descripcion AS tipo_habitacion, COUNT(*) AS cantidad_reservadas
#FROM Habitaciones_reservadas hr
#JOIN Habitacion hab ON hr.idHabitacion = hab.idHabitacion
#JOIN Tipo_habitacion th ON hab.idTipo_habitacion = th.idTipo_habitacion
#WHERE hr.idReservas = (SELECT idReservas FROM Reservas WHERE idHuesped = 27); -- Cambiar el valor 1 por el ID del huésped deseado
#GROUP BY th.descripcion;

# Obtener el nombre del huésped que realizó la reserva más reciente
SELECT CONCAT(h.nombre, ' ', h.apellidos) AS nombre_huesped
FROM Huesped h
JOIN Reservas r ON h.idHuesped = r.idHuesped
WHERE r.idReservas = (SELECT MAX(idReservas) FROM Reservas);

# Obtener la cantidad total de habitaciones disponibles por tipo de habitación
SELECT th.descripcion AS tipo_habitacion, th.capacidad - COUNT(*) AS habitaciones_disponibles
FROM Habitacion hab
JOIN Tipo_habitacion th ON hab.idTipo_habitacion = th.idTipo_habitacion
LEFT JOIN Habitaciones_reservadas hr ON hab.idHabitacion = hr.idHabitacion
WHERE hr.idHabitacion IS NULL OR hr.check_out < CURDATE()
GROUP BY th.descripcion;

# Obtener el número total de habitaciones reservadas por un tipo de huesped específico
SELECT COUNT(*) AS total_reservadas
FROM Habitaciones_reservadas hr
JOIN Reservas r ON hr.idReservas = r.idReservas
JOIN Huesped h ON r.idHuesped = h.idHuesped
WHERE h.idTipo_huesped = (SELECT idTipo_huesped FROM Tipo_huesped WHERE descripcion = 'Frecuente'); -- Cambiar 'Frecuente' por el tipo de huesped deseado

# Obtener el promedio de días de estadía de todas las reservas
SELECT AVG(DATEDIFF(check_out, check_in)) AS promedio_estadia
FROM Habitaciones_reservadas;

# Obtener el nombre del huésped con la estancia más larga
SELECT CONCAT(h.nombre, ' ', h.apellidos) AS nombre_huesped
FROM Huesped h
JOIN Reservas r ON h.idHuesped = r.idHuesped
JOIN Habitaciones_reservadas hr ON r.idReservas = hr.idReservas
WHERE DATEDIFF(hr.check_out, hr.check_in) = (SELECT MAX(DATEDIFF(check_out, check_in)) FROM Habitaciones_reservadas);

