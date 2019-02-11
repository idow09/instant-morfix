import 'dart:async';
import 'dart:convert';

import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/morfix_api.dart';
import 'package:rxdart/rxdart.dart';

class InstantMorfixBLoC {
  final MorfixApi api;

  InstantMorfixBLoC(this.api) {
    _searchController.stream.listen((query) async {
      FullTranslate x = searchFor(query);
      _results.add(x);
    });
  }

  final StreamController<String> _searchController = StreamController<String>();
  final BehaviorSubject<FullTranslate> _results =
      BehaviorSubject<FullTranslate>();

  Sink<String> get search => _searchController.sink;

  Stream<FullTranslate> get results => _results.stream;

  void dispose() {
    _searchController.close();
  }

  FullTranslate searchFor(String query) {
    return FullTranslate.fromJson(json.decode(api.getTranslation(query)));
  }
}
