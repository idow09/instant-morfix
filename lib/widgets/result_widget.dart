import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instant_morfix/models.dart';

class ResultWidget extends StatelessWidget {
  final TranslationItem item;
  final bool isToEnglish;

  ResultWidget(this.item, this.isToEnglish);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection:
                  isToEnglish ? TextDirection.rtl : TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    item.inputMeanings[0],
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.display1,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    item.partOfSpeech,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          Directionality(
            textDirection: isToEnglish ? TextDirection.ltr : TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: item.outputMeanings.map((meaning) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meaning,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
