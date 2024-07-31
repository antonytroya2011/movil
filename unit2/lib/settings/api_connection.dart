// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConnection {
  static String url = "https://restcountries.com/v3.1/all";
  static Future<List<Map<String, dynamic>>> get() async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri).timeout(const Duration(seconds: 50));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        return List.empty();
      }
    } catch (e) {
      //si accede a un error
      // ignore: avoid_print
      print(e); //logea el error
      return List.empty(); //retorna una lista vacia
    }
  }
}

class ApiConnectio {
  static String url = "https://v2.jokeapi.dev/joke/Any?lang=es";
  static Future<List<Map<String, dynamic>>> get() async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri).timeout(const Duration(seconds: 50));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        return List.empty();
      }
    } catch (e) {
      //si accede a un error
      // ignore: avoid_print
      print(e); //logea el error
      return List.empty(); //retorna una lista vacia
    }
  }
}
