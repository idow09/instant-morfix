import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:instant_morfix/models.dart';

import 'mock_morfix_api.dart';

void main() {
  test('Deserialization not throwing', () async {
    var translationJson = await MockMorfixApi().getTranslation("blah blah");
    FullTranslation.fromJson(json.decode(translationJson));
  });
}
