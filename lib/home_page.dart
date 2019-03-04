import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';
import 'package:instant_morfix/query_input.dart';
import 'package:instant_morfix/query_output.dart';

class HomePage extends StatelessWidget {
  final InstantMorfixBLoC bloc;

  const HomePage(this.bloc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => bloc.focusRequest.add(null),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    QueryInput(bloc),
                    const SizedBox(height: 24.0),
                    QueryOutput(bloc)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
