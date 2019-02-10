class FullTranslate {
  final List<TranslateItem> items;

  FullTranslate(this.items);

  @override
  String toString() {
    return 'FullTranslate{items: $items}';
  }

  factory FullTranslate.fromJson(dynamic json) {
    final items = ((json as Map<String, Object>)['Words'] as List)
        .cast<Map<String, Object>>()
        .map((Map<String, Object> item) {
      return TranslateItem.fromJson(item);
    }).toList();

    return FullTranslate(items);
  }

  bool get isPopulated => items.isNotEmpty;

  bool get isEmpty => items.isEmpty;
}

class TranslateItem {
  final List<String> inputMeanings;
  final String partOfSpeech;
  final List<String> outputMeanings;

  @override
  String toString() {
    return 'TranslateItem{inputMeanings: $inputMeanings, partOfSpeech: $partOfSpeech, outputMeanings: $outputMeanings}';
  }

  TranslateItem(this.inputMeanings, this.partOfSpeech, this.outputMeanings);

  factory TranslateItem.fromJson(Map<String, Object> json) {
    return TranslateItem(
      (json['InputLanguageMeanings'] as List)
          .cast<List<dynamic>>()
          .expand((i) => i)
          .cast<Map<String, Object>>()
          .map((item) => item['DisplayText'])
          .cast<String>()
          .toList(),
      json['PartOfSpeech'] as String,
      (json['OutputLanguageMeaningsString'] as String).split('  ; '),
    );
  }
}
