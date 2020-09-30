import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key, this.score, this.total}) : super(key: key);

  final int score;
  final int total;

  @override
  State<StatefulWidget> createState() {
    return _ResultPage();
  }
}

class _ResultPage extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Votre Resultat..."),
      ),
      body: Text("Nia ?"),
    );
  }
}
