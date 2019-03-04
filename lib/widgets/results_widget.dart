import 'package:flutter/cupertino.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';
import 'package:instant_morfix/models.dart';
import 'package:instant_morfix/widgets/result_widget.dart';

class ResultsWidget extends StatelessWidget {
  final InstantMorfixBLoC _bloc;

  const ResultsWidget(this._bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FullTranslation>(
        stream: _bloc.result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bool isToEng = snapshot.data.translationType == 'ToEnglish';
            return Column(
                children: snapshot.data.items.map((item) {
              return ResultWidget(
                item,
                isToEng,
              );
            }).toList());
          } else {
            return Container();
          }
        });
  }
}
