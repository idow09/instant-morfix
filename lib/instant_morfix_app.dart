import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instant_morfix/home_page.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';
import 'package:instant_morfix/morfix_api.dart';

class InstantMorfixApp extends StatefulWidget {
  const InstantMorfixApp({Key key}) : super(key: key);

  @override
  _InstantMorfixAppState createState() => _InstantMorfixAppState();
}

class _InstantMorfixAppState extends State<InstantMorfixApp> {
  InstantMorfixBLoC _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = InstantMorfixBLoC(MorfixApi());
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red[500],
        accentColorBrightness: Brightness.light,
        fontFamily: 'Alef',
      ),
      home: HomePage(_bloc),
    );
  }
}
