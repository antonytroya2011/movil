import 'package:unit2/settings/db_connection.dart';

class Teacher {
  int? id;
  String name;
  String lastName;
  String idCard;
  String email;
  String phoneNumber;

  Teacher({
    //Crear constructor
    this.id // opcional
    //Requeridos
    ,
    required this.name,
    required this.lastName,
    required this.idCard,
    required this.email,
    required this.phoneNumber,
  });
  factory Teacher.fromDictionary(Map<String, dynamic> data) => Teacher(
        id: data['id'], // extraer id de data
        name: data['name'], // extraer name de data
        lastName: data['last_name'], // extraer last_name de data
        idCard: data['id_card'],
        email: data['email'],
        phoneNumber: data['phone_nunmber'],
      );

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor de id al diccionario
        'name': name, //asignar el valor de name al diccionario
        'last_name': lastName, //asignar el valor de lastName al diccionario
        'id_card': idCard,
        'email': email,
        'phone_nunmber': phoneNumber,
      };
  static Future<List<Teacher>> select() async {
    var data = await DbConnection.list("teachers");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Teacher.fromDictionary(data[index]));
    }
  }
}
