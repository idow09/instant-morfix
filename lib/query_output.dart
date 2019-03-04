import 'package:flutter/cupertino.dart';
import 'package:instant_morfix/full_translation_widget.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';
import 'package:instant_morfix/models.dart';

class QueryOutput extends StatelessWidget {
  final InstantMorfixBLoC _bloc;

  const QueryOutput(this._bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FullTranslation>(
        stream: _bloc.result,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? FullTranslationWidget(snapshot.data)
              : Container();
        });
  }
}
