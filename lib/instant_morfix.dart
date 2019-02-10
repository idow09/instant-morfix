import 'package:flutter/material.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';

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
    _bloc = InstantMorfixBLoC();
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
    return Card(
        child: StreamBuilder<Object>(
            stream: _bloc.results,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.display1,
                    )
                  : SizedBox(
                      height: 48.0,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )));
            }));
  }
}
