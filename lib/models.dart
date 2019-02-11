class FullTranslation {
  final List<TranslationItem> items;

  FullTranslation(this.items);

  @override
  String toString() {
    return 'FullTranslate{items: $items}';
  }

  factory FullTranslation.fromJson(dynamic json) {
    final items = ((json as Map<String, Object>)['Words'] as List)
        .cast<Map<String, Object>>()
        .map((Map<String, Object> item) {
      return TranslationItem.fromJson(item);
    }).toList();

    return FullTranslation(items);
  }

  bool get isPopulated => items.isNotEmpty;

  bool get isEmpty => items.isEmpty;
}

class TranslationItem {
  final List<String> inputMeanings;
  final String partOfSpeech;
  final List<String> outputMeanings;

  @override
  String toString() {
    return 'TranslateItem{inputMeanings: $inputMeanings, partOfSpeech: $partOfSpeech, outputMeanings: $outputMeanings}';
  }

  TranslationItem(this.inputMeanings, this.partOfSpeech, this.outputMeanings);

  factory TranslationItem.fromJson(Map<String, Object> json) {
    return TranslationItem(
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
