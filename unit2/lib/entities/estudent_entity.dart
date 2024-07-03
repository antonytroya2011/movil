import 'package:unit2/settings/db_connection.dart';

class Student {
  int? id;
  String name;
  String lastName;

  Student(
      { //Crear constructor
      this.id // opcional
      //Requeridos
      ,
      required this.name,
      required this.lastName});
  factory Student.fromDictionary(Map<String, dynamic> data) => Student(
      id: data['id'], // extraer id de data
      name: data['name'], // extraer name de data
      lastName: data['last_name']); // extraer last_name de data

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor de id al diccionario
        'name': name, //asignar el valor de name al diccionario
        'last_name': lastName //asignar el valor de lastName al diccionario
      };
  static Future<List<Student>> select() async {
    var data = await DbConnection.list("estudiante");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Student.fromDictionary(data[index]));
    }
  }
}
