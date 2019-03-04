import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instant_morfix/instant_morfix_bloc.dart';

class QueryInput extends StatefulWidget {
  final InstantMorfixBLoC bloc;

  const QueryInput(this.bloc);

  @override
  _QueryInputState createState() => _QueryInputState();
}

class _QueryInputState extends State<QueryInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print('focusNode did something');
      if (_focusNode.hasFocus) {
        print('focusNode has focus!');
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });

    widget.bloc.focusCommand
        .listen((_) => FocusScope.of(context).requestFocus(_focusNode));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      focusNode: _focusNode,
      controller: _controller,
      maxLines: 1,
      onFieldSubmitted: (s) => widget.bloc.search.add(s),
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
    );
  }
}
