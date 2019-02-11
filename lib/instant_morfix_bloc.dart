import 'dart:async';
import 'dart:convert';

import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/morfix_api.dart';
import 'package:rxdart/rxdart.dart';

class InstantMorfixBLoC {
  final MorfixApi api;

  InstantMorfixBLoC(this.api) {
    _searchController.stream.listen((query) async {
      FullTranslate x = await searchFor(query);
      _result.add(x);
    });
  }

  final StreamController<String> _searchController = StreamController<String>();
  final BehaviorSubject<FullTranslate> _result =
      BehaviorSubject<FullTranslate>();

  Sink<String> get search => _searchController.sink;

  Stream<FullTranslate> get result => _result.stream;

  void dispose() {
    _searchController.close();
  }

  Future<FullTranslate> searchFor(String query) async {
    return Future.value(FullTranslate.fromJson(json.decode(api.getTranslation(query))));
  }
}
