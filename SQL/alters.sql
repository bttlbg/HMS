# Agregar una nueva columna a la tabla Huesped:
ALTER TABLE Huesped
ADD correo VARCHAR(50);

# Eliminar la columna "status" de la tabla Habitacion
ALTER TABLE Habitacion
DROP COLUMN status;

# Modificar el tipo de datos de la columna "capacidad" en la tabla Tipo_habitacion
ALTER TABLE Tipo_habitacion
MODIFY capacidad INT UNSIGNED;

# Agregar una restricción de clave foránea (FK) a la tabla Reservas
ALTER TABLE Reservas
ADD CONSTRAINT fk_reservas_huesped FOREIGN KEY (idHuesped)
REFERENCES Huesped(idHuesped);

# Agregar una restricción CHECK a la tabla Habitacion para asegurarse de que el número de habitación sea positivo
ALTER TABLE Habitacion
ADD CONSTRAINT check_numero_habitacion CHECK (numero > 0);

# Eliminar la restricción de clave foránea (FK) "fk_h_reservadas" de la tabla Habitaciones_reservadas
ALTER TABLE Habitaciones_reservadas
DROP FOREIGN KEY fk_h_reservadas;

# agregar una restricción de clave foránea 
# a la tabla "Habitaciones_reservadas" en la columna "idTipo_habitacion"
# que hace referencia a la tabla "Tipo_habitacion" en la columna "idTipo_habitacion"
ALTER TABLE Habitaciones_reservadas
ADD CONSTRAINT fk_tipo_habitacion
FOREIGN KEY (idTipo_habitacion) REFERENCES Tipo_habitacion(idTipo_habitacion);
