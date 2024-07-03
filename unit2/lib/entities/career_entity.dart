import 'package:unit2/settings/db_connection.dart';

class Career {
  int? id;
  String name;
  String description;
  int durationYears;
  String degreeAwarded;
  String department;

  Career({
    //Crear constructor
    this.id // opcional
    //Requeridos
    ,
    required this.name,
    required this.description,
    required this.durationYears,
    required this.degreeAwarded,
    required this.department,
  });
  factory Career.fromDictionary(Map<String, dynamic> data) => Career(
        id: data['id'], // extraer id de data
        name: data['name'], // extraer name de data
        description: data['description'], // extraer last_name de data
        durationYears: data['duration_years'],
        degreeAwarded: data['degree_awarded'],
        department: data['department'],
      );

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor de id al diccionario
        'name': name, //asignar el valor de name al diccionario
        'description':
            description, //asignar el valor de lastName al diccionario
        'duration_years': durationYears,
        'degree_awarded': degreeAwarded,
        'department': department,
      };
  static Future<List<Career>> select() async {
    var data = await DbConnection.list("career");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Career.fromDictionary(data[index]));
    }
  }
}
