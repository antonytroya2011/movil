import 'package:unit2/settings/api_connection.dart';

class Country {
  dynamic name;
  String? region;
  dynamic flag;
  int? population;

  Country({this.name, this.region, this.flag, this.population});
  factory Country.fromDictionary(Map<String, dynamic> data) => Country(
        name: data['name'],
        region: data['region'],
        flag: data['flag'],
        population: data['population'], // extraer name de data
        // extraer name de data
      ); // extraer region de data

  //Esto se utiliza al momento de registrar datos (insert, update)
  //No acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'name': name, //asignar el valor de name al diccionario
        'region': region,
        'flag': flag, //asignar el valor de name al diccionario
        'population': population, //asignar el valor de name al diccionario
      };
  static Future<List<Country>> get() async {
    var response = await ApiConnection.get();
    if (response.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          response.length, (index) => Country.fromDictionary(response[index]));
    }
  }

  static select() {}
}
