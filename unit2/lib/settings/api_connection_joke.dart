// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConnection {
  static String url = "https://v2.jokeapi.dev/joke/Any?lang=es";
  static Future<Map<String, dynamic>> get() async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri).timeout(const Duration(seconds: 50));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      // Log the error
      // ignore: avoid_print
      print(e);
      return {};
    }
  }
}
