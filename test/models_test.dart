import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:instant_morfix/models.dart';

import 'mock_morfix_api.dart';

void main() {
  test('Deserialization not throwing', () async {
    var translationJson = await MockMorfixApi().getTranslation("blah blah");
    var fullTranslation =
        FullTranslation.fromJson(json.decode(translationJson));
    expect(fullTranslation.translationType, isNotEmpty);
    expect(fullTranslation.items[0].outputMeanings[0], isNotEmpty);
  });
}
