import 'package:flutter/material.dart';
import '../class/Question.dart';

class QuizzPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizzPage();
  }
}

class _QuizzPage extends State<QuizzPage> {
  // VARIABLES
  List<Question> listQuestions = [
    Question('La devise de la Belgique est l\'union fait la force', true,
        'Bah forcement ! Un pays si uni...', 'belgique.JPG'),
    Question('La lune va finir par tomber sur terre à cause de la gravité',
        false, 'Au contraire la lune s\'éloigne', 'lune.jpg'),
    Question('La Russie est plus grande en superficie que Pluton', true, '',
        'russie.jpg'),
    Question('Nyctalope est une race naine d\'antilope', false,
        'C’est une aptitude à voir dans le noir', 'nyctalope.jpg'),
    Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true,
        '', 'commodore.jpg'),
    Question('Le nom du drapeau des pirates est black skull', false,
        'Il est appelé Jolly Roger', 'pirate.png'),
    Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou',
        'tintin.jpg'),
    Question('La barbe des pharaons était fausse', true,
        'A l\'époque déjà ils utilisaient des postiches', 'pharaon.jpg'),
    Question('Au Québec tire toi une bûche veut dire: Viens t\'asseoir', true,
        'La bûche, fameuse chaise de bucheron', 'buche.jpg'),
    Question('Le module lunaire Eagle ne possédait que 4Ko de Ram', true,
        'Dire que je me plains avec mes 8GO de ram sur mon mac', 'eagle.jpg'),
  ];

  int score = 0;
  int index = 0;

  // FUNCTIONS
  void checkResult(bool result) {
    print("Index: $index - Length: ${listQuestions.length}");
    if (index < listQuestions.length - 1) {
      if (result == listQuestions[index].response) {
        dialog(true, "");
        setState(() {
          score++;
        });
      } else {
        dialog(false, listQuestions[index].explaination);
      }
    } else {
      if (result == listQuestions[index].response) {
        setState(() {
          score++;
        });
      }

      print("Votre score final: $score / ${listQuestions.length}");
      Navigator.pop(context);
    }
  }

  Future<Null> dialog(bool result, String text) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            result ? "Correct !" : "Incorrect !",
            style: TextStyle(
                color: result ? Colors.green : Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          children: [
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 10,
                      child: Image.asset(
                        "assets/" + (result ? "vrai.jpg" : "faux.jpg"),
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 25,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      height: 25,
                    ),
                    RaisedButton(
                        child: Text(
                          "Suivant",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            index++;
                          });
                          Navigator.pop(context);
                        })
                  ],
                )),
          ],
        );
      },
    );
  }

  // WIDGETS
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizzz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Question N° ${index + 1}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Score: ${score.toString()}/" + listQuestions.length.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Card(
              elevation: 10,
              child: Image.asset(
                "assets/" + listQuestions[index].imagePath,
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.width / 1.3,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              listQuestions[index].question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    elevation: 10,
                    color: Colors.blue,
                    child: Text(
                      "Vrai",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () => checkResult(true)),
                RaisedButton(
                    elevation: 10,
                    color: Colors.blue,
                    child: Text(
                      "Faux",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () => checkResult(false)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
