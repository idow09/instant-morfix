import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:instant_morfix/mock_morfix_api.dart';
import 'package:instant_morfix/models.dart';

void main() {
  test('Deserialization not throwing', () {
    var translationJson = MockMorfixApi().getTranslation("blah blah");
    FullTranslate.fromJson(json.decode(translationJson));
  });
}
