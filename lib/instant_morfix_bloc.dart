import 'dart:async';
import 'dart:convert';

import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/morfix_api.dart';
import 'package:rxdart/rxdart.dart';

class InstantMorfixBLoC {
  final MorfixApi api;

  InstantMorfixBLoC(this.api) {
    _searchController.stream.listen((query) async {
      FullTranslation x = await searchFor(query);
      _result.add(x);
    });
  }

  final StreamController<String> _searchController = StreamController<String>();
  final BehaviorSubject<FullTranslation> _result =
      BehaviorSubject<FullTranslation>();

  Sink<String> get search => _searchController.sink;

  Stream<FullTranslation> get result => _result.stream;

  void dispose() {
    _searchController.close();
  }

  Future<FullTranslation> searchFor(String query) async {
    String translation = await api.getTranslation(query);
    return FullTranslation.fromJson(json.decode(translation));
  }
}
