import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';

class InstantMorfixBLoC {
  InstantMorfixBLoC() {
    _searchController.stream.listen((query) async {
      List<Result> x = searchFor(query);
      _results.add(x);
    });
  }

  final StreamController<String> _searchController = StreamController<String>();
  final BehaviorSubject<List<Result>> _results =
      BehaviorSubject<List<Result>>();

  Sink<String> get search => _searchController.sink;

  Stream<UnmodifiableListView<Result>> get results =>
      _results.stream.map((list) => UnmodifiableListView(list));

  void dispose() {
    _searchController.close();
  }

  List<Result> searchFor(String query) {
    return new List.of([
      Result("שָׁלוֹם", "שם ז'", ["Hi", "Hello"]),
      Result("להתראות", "שם נ'", ["Bye", "Chau"])
    ]);
  }
}

class Result {
  final String inputMeaning;
  final String partOfSpeech;
  final List<String> outputMeanings;

  Result(this.inputMeaning, this.partOfSpeech, this.outputMeanings);
}
