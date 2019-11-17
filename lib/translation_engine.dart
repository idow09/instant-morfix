import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';

import 'models.dart';
import 'morfix_api.dart';

class TranslationEngine {
  final MorfixApi morfixApi;

  TranslationEngine({@required this.morfixApi}) : assert(morfixApi != null);

  Future<FullTranslation> translate(String query) async {
    String translation = await morfixApi.getTranslation(query);
    return FullTranslation.fromJson(json.decode(translation));
  }
}
