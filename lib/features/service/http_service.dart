import 'dart:convert';

import 'package:dictionary_app_bloc/features/model/word_model.dart';
import 'package:http/http.dart' as Client;

class HttpService {
  static const baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

  Future<T> getData<T>(endPoint) async {
    final uriAdres = Uri.parse("$baseUrl$endPoint");
    try {
      final response = await Client.get(uriAdres);
      if (response.statusCode == 200) {
        return WordModel.fromJson(jsonDecode(response.body)) as T;
      } else {
        return Exception("Error") as T;
      }
    } catch (e) {
      return Exception("Error") as T;
      print(e);
    }
  }
}
