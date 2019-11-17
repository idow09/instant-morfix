import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_morfix/focus_bloc.dart';
import 'package:instant_morfix/translation_bloc.dart';
import 'package:instant_morfix/translation_engine.dart';
import 'package:instant_morfix/widgets/home_page.dart';

class InstantMorfixApp extends StatefulWidget {
  final TranslationEngine translationEngine;

  const InstantMorfixApp({Key key, this.translationEngine})
      : assert(translationEngine != null),
        super(key: key);

  @override
  _InstantMorfixAppState createState() => _InstantMorfixAppState();
}

class _InstantMorfixAppState extends State<InstantMorfixApp> {
  static const platform = const MethodChannel('app.channel.shared.data');

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TranslationBloc>(
            builder: (context) =>
                TranslationBloc(translationEngine: widget.translationEngine),
          ),
          BlocProvider<FocusBloc>(
            builder: (context) => FocusBloc(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      BlocProvider.of<TranslationBloc>(context)
          .add(FetchTranslation(query: sharedData));
    }
  }
}
