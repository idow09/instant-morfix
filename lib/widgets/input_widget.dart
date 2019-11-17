import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_morfix/focus_bloc.dart';
import 'package:instant_morfix/translation_bloc.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FocusBloc, FocusState>(
      listener: (context, state) {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: TextFormField(
        style: Theme.of(context).textTheme.display1,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.done,
        focusNode: _focusNode,
        controller: _controller,
        maxLines: 1,
        onFieldSubmitted: (query) => BlocProvider.of<TranslationBloc>(context)
            .add(FetchTranslation(query: query)),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Type / הקלד',
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
      ),
    );
  }
}
