import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

class MorfixApi {
  final String baseUrl;
  final http.Client _client;

  MorfixApi({
    HttpClient client,
    this.baseUrl =
        'http://services.morfix.com/translationhebrew/TranslationService/GetTranslation/',
  }) : this._client = client ?? http.Client();

  Future<String> getTranslation(String query) async {
    final response = await _client.post(Uri.parse('$baseUrl'),
        headers: {'Content-Type': 'application/json'},
        body: '{"Query":"$query"}');
    return response.body;
  }
}
