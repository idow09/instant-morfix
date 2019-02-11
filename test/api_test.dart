import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/morfix_api.dart';

void main() {
  test('API returns serializable data', () async {
    var translationJson = await MorfixApi().getTranslation("Israel");
    expect(translationJson, contains('יִשְׂרָאֵל'));
    FullTranslation.fromJson(json.decode(translationJson));
  });
}
