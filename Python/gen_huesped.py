import random
import csv


def generar_registro(num):
    nombres = [
    "Liam", "Olivia", "Noah", "Emma", "Sophia", "Jackson", "Ava", "Aiden", "Isabella", "Lucas",
    "Mia", "Caden", "Charlotte", "Oliver", "Amelia", "Mateo", "Harper", "Muhammad", "Evelyn", "Mason",
    "Abigail", "Elijah", "Emily", "Grayson", "Elizabeth", "Jacob", "Mila", "Michael", "Ella", "Benjamin",
    "Avery", "Carter", "Sofia", "James", "Camila", "Sebastian", "Aria", "Alexander", "Scarlett", "Jack",
    "Victoria", "William", "Madison", "Daniel", "Luna", "Owen", "Grace", "Luke", "Chloe", "Henry",
    "Penelope", "Matthew", "Layla", "Wyatt", "Riley", "Jayden", "Zoey", "Levi", "Nora", "David",
    "Lily", "Olivia", "Ethan", "Aubrey", "Christopher", "Hannah", "Joseph", "Bella", "Samuel", "Aurora",
    "Gabriel", "Addison", "Caleb", "Stella", "Anthony", "Natalie", "John", "Zoe", "Dylan", "Leah",
    "Isaac", "Hazel", "Andrew", "Violet", "Joshua", "Aria", "Landon", "Audrey", "Julian", "Skylar",
    "Ryan", "Claire", "Nathan", "Brooklyn", "Aaron", "Lucy", "Eli", "Paisley", "Hunter", "Everly",
    "Christian", "Anna", "Jonathan", "Caroline", "Cameron", "Nova", "Connor", "Genesis", "Santiago", "Emilia",
    "Jeremiah", "Kennedy", "Ezekiel", "Savannah", "Angel", "Maya", "Roman", "Adeline", "Easton", "Alice",
    "Maverick", "Gabriella", "Alan", "Madelyn", "Nicholas", "Elena", "Dominic", "Ruby", "Austin", "Isla",
    "Leo", "Sadie", "Adam", "Eva", "Jaxon", "Quinn", "Jose", "Nevaeh", "Ian", "Piper",
    "Cooper", "Lydia", "Hudson", "Elise", "Carson", "Josephine", "Nolan", "Emery", "Miles", "Valentina",
    "Micah", "Autumn", "Luca", "Willow", "Vincent", "Brooke", "Asher", "Emery", "Silas", "Everleigh",
    "Josiah", "Athena", "Maxwell", "Nina", "Elias", "Charlie", "Cole", "Rachel", "Max", "Mya",
    "Bryson", "Katherine", "Jace", "Lauren", "Sawyer", "Gianna", "Gavin", "Faith", "Leonardo", "Alexandra",
    "Camden", "Mary", "Aidan", "Melanie", "Finley", "Jordyn", "Kai", "Liliana"]

    apellidos = [
    "Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor",
    "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson",
    "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King",
    "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter",
    "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins",
    "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell", "Murphy", "Bailey",
    "Rivera", "Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres", "Peterson", "Gray", "Ramirez",
    "James", "Watson", "Brooks", "Kelly", "Sanders", "Price", "Bennett", "Wood", "Barnes", "Ross",
    "Henderson", "Coleman", "Jenkins", "Perry", "Powell", "Long", "Patterson", "Hughes", "Flores", "Washington",
    "Butler", "Simmons", "Foster", "Gonzales", "Bryant", "Alexander", "Russell", "Griffin", "Diaz", "Hayes",
    "Myers", "Ford", "Hamilton", "Graham", "Sullivan", "Wallace", "Woods", "Cole", "West", "Jordan",
    "Owens", "Reynolds", "Fisher", "Ellis", "Harrison", "Gibson", "Mcdonald", "Cruz", "Marshall", "Ortiz",
    "Gomez", "Murray", "Freeman", "Wells", "Webb", "Simpson", "Stevens", "Tucker", "Porter", "Hunter",
    "Hicks", "Crawford", "Henry", "Boyd", "Mason", "Morales", "Kennedy", "Warren", "Dixon", "Ramos",
    "Reyes", "Burns", "Gordon", "Shaw", "Holmes", "Rice", "Robertson", "Hunt", "Black", "Daniels",
    "Palmer", "Mills", "Nichols", "Grant", "Knight", "Ferguson", "Rose", "Stone", "Hawkins", "Dunn",
    "Perkins", "Hudson", "Spencer", "Gardner", "Stephens", "Payne", "Pierce", "Berry", "Matthews", "Arnold"]

    nom = nombres[random.randint(1,150)]
    apl = apellidos[random.randint(1,150)]

    return [num, nom, apl, random.randint(1, 4)]


def main():
    registros = []
    for i in range(1, 51):
        registros.append(generar_registro(i))

    # Exportar registros a un archivo CSV
    nombre_archivo = "txt/registro_huesped.csv"
    with open(nombre_archivo, mode='w', newline='') as file:
        writer = csv.writer(file)
        #writer.writerow(["ID", "Nombre", "Apellido", "Valor"])
        writer.writerows(registros)

    print("Registros exportados exitosamente al archivo:", nombre_archivo)

if __name__ == "__main__":
    main()
