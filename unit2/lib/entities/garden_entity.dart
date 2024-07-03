import 'package:unit2/settings/db_connection.dart';

class Garden {
  int? id;
  String name;
  String type;
  int amount;
  String price;
  String origin;

  Garden({
    //Crear constructor
    this.id // opcional
    //Requeridos
    ,
    required this.name,
    required this.type,
    required this.amount,
    required this.price,
    required this.origin,
  });
  factory Garden.fromDictionary(Map<String, dynamic> data) => Garden(
        id: data['id'], // extraer id de data
        name: data['name'], // extraer name de data
        type: data['type'], // extraer last_name de data
        amount: data['amount'],
        price: data['price'],
        origin: data['origin'],
      );

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor de id al diccionario
        'name': name, //asignar el valor de name al diccionario
        'type': type, //asignar el valor de lastName al diccionario
        'amount': amount,
        'price': price,
        'origin': origin,
      };
  static Future<List<Garden>> select() async {
    var data = await DbConnection.list("garden");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Garden.fromDictionary(data[index]));
    }
  }
}
