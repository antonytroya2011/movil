import 'package:unit2/settings/db_connection.dart';

class Medication {
  int? id;
  String name;
  String description;
  int amount;
  String batch;
  String supplier;

  Medication({
    //Crear constructor
    this.id // opcional
    //Requeridos
    ,
    required this.name,
    required this.description,
    required this.amount,
    required this.batch,
    required this.supplier,
  });
  factory Medication.fromDictionary(Map<String, dynamic> data) => Medication(
        id: data['id'], // extraer id de data
        name: data['name'], // extraer name de data
        description: data['description'], // extraer last_name de data
        amount: data['amount'],
        batch: data['batch'],
        supplier: data['supplier'],
      );

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor de id al diccionario
        'name': name, //asignar el valor de name al diccionario
        'description':
            description, //asignar el valor de lastName al diccionario
        'amount': amount,
        'batch': batch,
        'supplier': supplier,
      };
  static Future<List<Medication>> select() async {
    var data = await DbConnection.list("medication");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Medication.fromDictionary(data[index]));
    }
  }
}
