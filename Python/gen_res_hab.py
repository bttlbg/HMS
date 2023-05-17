import random
import csv
from datetime import datetime, timedelta

# Script para generar registros para la tabla habitaciones reservadas

def generar_fecha():
    # Fecha de inicio para generar fechas aleatorias
    start_date = datetime(2020, 1, 1)
    end_date = datetime.now()  # Fecha actual como límite superior

    # Generar una fecha aleatoria entre start_date y end_date
    time_between_dates = end_date - start_date
    random_number_of_days = random.randrange(time_between_dates.days)
    random_date = start_date + timedelta(days=random_number_of_days)
    random_time = timedelta(hours=random.randint(
        0, 23), minutes=random.randint(0, 59))
    random_datetime = random_date + random_time

    return random_datetime


def generar_registro(num):

    fecha_in = generar_fecha()
    fecha_out = generar_fecha()
    while fecha_out <= fecha_in or fecha_out >= fecha_in + timedelta(days=14):
        fecha_out = generar_fecha()

    idres = random.randint(1,24)
    idhbt = random.randint(1,24)
    '''
    idhsp = random.randint(1,50)
    idtph = 1
    if idhbt >= 1 and idhbt <= 5:
        idtph = 1
    elif idhbt >= 6 and idhbt <= 10:
        idtph = 2
    elif idhbt >= 11 and idhbt <= 15:
        idtph = 3
    elif idhbt >= 16 and idhbt <= 20:
        idtph = 4
    elif idhbt >= 21 and idhbt <= 25:
        idtph = 5
    elif idhbt >= 26 and idhbt <= 30:
        idtph = 6
    '''

    # Columnas de la tabla en orden
    # idHabitacionReservada, idReserva, idHabitacion
    #return [num, idres, idhsp, idhbt, idtph, fecha_in, fecha_out]
    return [num, idres, idhbt, fecha_in, fecha_out]


def main():
    registros = []
    for i in range(1, 25):
        registros.append(generar_registro(i))

    # Exportar
    nombre_archivo = "txt/registro_habitaciones_reservadas.csv"
    with open(nombre_archivo, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(registros)

    print("Registros exportados exitosamente al archivo:", nombre_archivo)


if __name__ == "__main__":
    main()
