import 'dart:async';
import 'dart:convert';

import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/morfix_api.dart';
import 'package:rxdart/rxdart.dart';

class InstantMorfixBLoC {
  final MorfixApi _api;

  InstantMorfixBLoC(this._api) {
    _searchController.stream.listen((query) async {
      _result.add(await searchFor(query));
    });
  }

  final StreamController<String> _searchController = StreamController<String>();
  final StreamController<void> _focusController = StreamController<void>();
  final BehaviorSubject<FullTranslation> _result =
      BehaviorSubject<FullTranslation>();

  Sink<String> get search => _searchController.sink;

  Sink<void> get focusRequest => _focusController.sink;

  Stream<FullTranslation> get result => _result.stream;

  Stream<void> get focusCommand => _focusController.stream;

  void dispose() {
    _searchController.close();
    _focusController.close();
    _result.close();
  }

  Future<FullTranslation> searchFor(String query) async {
    String translation = await _api.getTranslation(query);
    return FullTranslation.fromJson(json.decode(translation));
  }
}
