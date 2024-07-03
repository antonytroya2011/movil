import 'package:unit2/settings/db_connection.dart';

class Subject {
  int? id;
  String name;
  String code;
  int credits;
  String semester;
  String instructor;

  Subject({
    //Crear constructor
    this.id // opcional
    //Requeridos
    ,
    required this.name,
    required this.code,
    required this.credits,
    required this.semester,
    required this.instructor,
  });
  factory Subject.fromDictionary(Map<String, dynamic> data) => Subject(
        id: data['id'], // extraer id de data
        name: data['name'], // extraer name de data
        code: data['code'], // extraer last_name de data
        credits: data['credits'],
        semester: data['semester'],
        instructor: data['instructor'],
      );

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, //asignar el valor de id al diccionario
        'name': name, //asignar el valor de name al diccionario
        'code': code, //asignar el valor de lastName al diccionario
        'credits': credits,
        'semester': semester,
        'instructor': instructor
      };

  static Future<List<Subject>> select() async {
    var data = await DbConnection.list("subject");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Subject.fromDictionary(data[index]));
    }
  }
}
