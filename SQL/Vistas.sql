# Vista de todas las habitaciones reservadas
CREATE VIEW Vista_Habitaciones_Reservadas AS
SELECT hr.idHabitaciones_reservadas, hr.idReservas, hr.idHabitacion, hr.idTipo_habitacion,
       h.nombre AS nombre_huesped, th.descripcion AS tipo_habitacion,
       hr.check_in, hr.check_out
FROM Habitaciones_reservadas hr
JOIN Huesped h ON hr.idHuesped = h.idHuesped
JOIN Tipo_habitacion th ON hr.idTipo_habitacion = th.idTipo_habitacion;

# Vista de las habitaciones reservadas con información del tipo de huesped
CREATE VIEW Vista_Habitaciones_Reservadas_Huesped AS
SELECT hr.idHabitaciones_reservadas, hr.idReservas, hr.idHabitacion, hr.idTipo_habitacion,
       h.nombre AS nombre_huesped, th.descripcion AS tipo_habitacion, thp.descripcion AS tipo_huesped,
       hr.check_in, hr.check_out
FROM Habitaciones_reservadas hr
JOIN Huesped h ON hr.idHuesped = h.idHuesped
JOIN Tipo_habitacion th ON hr.idTipo_habitacion = th.idTipo_habitacion
JOIN Tipo_huesped thp ON h.idTipo_huesped = thp.idTipo_huesped;

# Vista de las reservas con información del tipo de habitación
CREATE VIEW Vista_Reservas_TipoHabitacion AS
SELECT r.idReservas, r.idHuesped, th.descripcion AS tipo_habitacion,
       hr.idHabitaciones_reservadas, hr.idHabitacion, hr.check_in, hr.check_out
FROM Reservas r
JOIN Habitaciones_reservadas hr ON r.idReservas = hr.idReservas
JOIN Habitacion h ON hr.idHabitacion = h.idHabitacion
JOIN Tipo_habitacion th ON h.idTipo_habitacion = th.idTipo_habitacion;

# Vista de los huéspedes y su tipo de habitación reservada
CREATE VIEW Vista_Huespedes_TipoHabitacion AS
SELECT h.idHuesped, h.nombre, h.apellidos, th.descripcion AS tipo_habitacion,
       hr.idHabitaciones_reservadas, hr.idHabitacion, hr.check_in, hr.check_out
FROM Huesped h
JOIN Habitaciones_reservadas hr ON h.idHuesped = hr.idHuesped
JOIN Habitacion hab ON hr.idHabitacion = hab.idHabitacion
JOIN Tipo_habitacion th ON hab.idTipo_habitacion = th.idTipo_habitacion;

# Vista de todas las habitaciones y su estado
CREATE VIEW Vista_Habitaciones_Estado AS
SELECT hab.idHabitacion, th.descripcion AS tipo_habitacion, hab.numero, hab.status
FROM Habitacion hab
JOIN Tipo_habitacion th ON hab.idTipo_habitacion = th.idTipo_habitacion;
