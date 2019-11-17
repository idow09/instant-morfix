import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_morfix/translation_bloc.dart';
import 'package:instant_morfix/translation_engine.dart';
import 'package:instant_morfix/widgets/home_page.dart';

class InstantMorfixApp2 extends StatelessWidget {
  final TranslationEngine translationEngine;

  const InstantMorfixApp2({Key key, this.translationEngine})
      : assert(translationEngine != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instant Morfix',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red[500],
        accentColorBrightness: Brightness.light,
        fontFamily: 'Alef',
      ),
      home: BlocProvider(
        builder: (context) =>
            TranslationBloc(translationEngine: translationEngine),
        child: HomePage(),
      ),
    );
  }
}
