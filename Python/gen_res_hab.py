import random
import csv


def generar_registro(num):

    return [num, random.randint(1, 25), random.randint(1, 6)]


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
