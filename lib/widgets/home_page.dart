import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_morfix/focus_bloc.dart';
import 'package:instant_morfix/translation_bloc.dart';
import 'package:instant_morfix/widgets/input_widget.dart';
import 'package:instant_morfix/widgets/results_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<TranslationBloc, TranslationState>(
      listener: (context, state) {
        if (state is TranslationError) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("An error occured.")));
        }
      },
      child: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => BlocProvider.of<FocusBloc>(context).add(FocusEvent()),
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      InputWidget(),
                      const SizedBox(height: 24.0),
                      ResultsWidget()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
