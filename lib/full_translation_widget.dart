import 'package:flutter/cupertino.dart';
import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/translation_item_widget.dart';

class FullTranslationWidget extends StatelessWidget {
  final FullTranslation translation;

  FullTranslationWidget(this.translation);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: translation.items.map((item) {
      return TranslationItemWidget(item);
    }).toList());
  }
}
