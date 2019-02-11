import 'package:flutter/material.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';
import 'package:instant_morfix/mock_morfix_api.dart';
import 'package:instant_morfix/models.dart';

void main() => runApp(InstantMorfixApp());

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
    _bloc = InstantMorfixBLoC(MockMorfixApi());
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
        fontFamily: 'Alef',
        scaffoldBackgroundColor: Colors.redAccent,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(_bloc),
    );
  }
}

class HomePage extends StatelessWidget {
  final InstantMorfixBLoC bloc;

  const HomePage(this.bloc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
    );
  }
}

class QueryInput extends StatelessWidget {
  final InstantMorfixBLoC bloc;

  const QueryInput(this.bloc);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Type in English / Hebrew',
        labelText: 'Translate',
//        suffixIcon: GestureDetector(
//          dragStartBehavior: DragStartBehavior.down,
//          onTap: () {},
//          child: Icon(
//            thereIsText ? Icons.visibility : Icons.visibility_off,
//              Icons.close
//            semanticLabel: _obscureText ? 'show password' : 'hide password',
//              ),
//        ),
      ),
      maxLines: 1,
      onFieldSubmitted: (s) => bloc.search.add(s),
    );
  }
}

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
              : SizedBox(
                  height: 48.0,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )));
        });
  }
}

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

class TranslationItemWidget extends StatelessWidget {
  final TranslationItem item;

  TranslationItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  item.partOfSpeech,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.body1,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  item.inputMeanings[0],
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          Divider(color: Colors.black),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: item.outputMeanings.map((meaning) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meaning,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
