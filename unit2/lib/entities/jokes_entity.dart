import 'package:unit2/settings/api_connection_joke.dart';

class Joke {
  bool? error;
  String? category;
  String? type;
  String? joke;
  String? setup;
  String? delivery;
  String? lang;

  Joke({
    this.error,
    this.category,
    this.type,
    this.joke,
    this.setup,
    this.delivery,
    this.lang,
  });

  factory Joke.fromDictionary(Map<String, dynamic> data) => Joke(
        error: data['error'],
        category: data['category'],
        type: data['type'],
        joke: data['joke'],
        setup: data['setup'],
        delivery: data['delivery'],
        lang: data['lang'],
      );

  Map<String, dynamic> toDictionary() => {
        'error': error,
        'category': category,
        'type': type,
        'joke': joke,
        'setup': setup,
        'delivery': delivery,
        'lang': lang,
      };

  static Future<Joke?> get() async {
    var response = await ApiConnection.get();
    if (response.isEmpty) {
      return null;
    } else {
      return Joke.fromDictionary(response);
    }
  }
}
