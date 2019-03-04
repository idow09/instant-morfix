import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instant_morfix/models.dart';

class ResultWidget extends StatelessWidget {
  final TranslationItem item;

  ResultWidget(this.item);

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
