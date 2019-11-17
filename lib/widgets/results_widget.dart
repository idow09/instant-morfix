import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_morfix/translation_bloc.dart';
import 'package:instant_morfix/widgets/result_widget.dart';

class ResultsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, state) {
      if (state is NoTranslation) {
        return Container();
      }
      if (state is TranslationLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is TranslationError) {
        return Container(); // TODO error
      }
      if (state is TranslationLoaded) {
        final bool isToEng = state.translation.translationType == 'ToEnglish';
        return Column(
            children: state.translation.items.map((item) {
          return ResultWidget(
            item,
            isToEng,
          );
        }).toList());
      }
      return null;
    });
  }
}
