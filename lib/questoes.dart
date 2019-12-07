import 'package:fincalc_prod/videoAvancado.dart';
import 'package:fincalc_prod/videoBasico.dart';
import 'package:fincalc_prod/videoIntermediario.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'questoes_list.dart';
import 'desempenho.dart';

enum SingingCharacter { A, B, C, D, E }
var _id = 0, placar = 0;
var tentativas = 0, acertos = 0, erros = 0, coringa = 0, consulta = 0;

void questoes_ui() {
  runApp(MaterialApp(
    title: 'FinCalc App',
    home: Questoes_ui(),
  ));
}

class Questoes_ui extends StatefulWidget {
  // final String foo;
  final QuestoesList questoesList;

  const Questoes_ui({Key key, this.questoesList}) : super(key: key);

  @override
  _Questoes_uiState createState() =>
      _Questoes_uiState(questoesList: questoesList);
}

class _Questoes_uiState extends State<Questoes_ui> {
  SingingCharacter _character; // = SingingCharacter.lafayette;
  var resultado, cont = false; //, _textRadio = '-1';
  var _textRadioA, _textRadioB, _textRadioC, _textRadioD, _textRadioE;
  QuestoesList questoesList;
  String foo, issue;
  var corrigeFlag = true;
  var eliminaCont = 0;

  _Questoes_uiState({this.questoesList});

  @override
  void initState() {
    // _id =0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (!cont) {
      montaChoice();
    }

    return Scaffold(
        appBar: AppBar(
            title: Text('Questões'),
            centerTitle: true,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (_id > 0) {
                  --_id;
                }
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              // action button
              FlatButton(
                child: Image.asset(
                  'img/house.png',
                  height: 40,
                  width: 40,
                ),
                onPressed: () {
                  clear();
                  _id = placar = 0;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),

              FlatButton(
                child: Image.asset(
                  'img/checklist.png',
                  height: 40,
                  width: 40,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Desempenho(
                              tentativas: tentativas,
                              acertos: acertos,
                              erros: erros,
                              consulta: consulta,
                              coringa: coringa)));
                },
              ),
            ]),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            new ListTile(
                // leading: const Icon(Icons.question_answer),
                title: new Text(questoesList.questoes[_id].enunciado)),
            RadioListTile<SingingCharacter>(
              title: _textRadioA,
              value: SingingCharacter.A,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: _textRadioB,
              value: SingingCharacter.B,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: _textRadioC,
              value: SingingCharacter.C,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: _textRadioD,
              value: SingingCharacter.D,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: _textRadioE,
              value: SingingCharacter.E,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            imprimeResultado(resultado),
            // new SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   // padding: EdgeInsets.only(left: 12),
            //   // color: Colors.blue,
            //   child: Row(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                      onPressed: corrige,
                      color: Colors.blue,
                      child:
                          Image.asset('img/goal.png', height: 40, width: 40)),
                  flex: 14,
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: elimina,
                      color: Colors.blue,
                      child:
                          Image.asset('img/joker.png', height: 40, width: 40)),
                  flex: 14,
                ),
                Expanded(
                  child: FlatButton(
                      child:
                          Image.asset('img/leitura.png', height: 40, width: 40),
                      color: Colors.blue,
                      onPressed: () {
                        _launchURL(questoesList.questoes[_id].link);
                      }),
                  flex: 14,
                ),
                Expanded(
                  child: FlatButton(
                      child: Image.asset('img/video-player.png',
                          height: 40, width: 40),
                      color: Colors.blue,
                      onPressed: exibeVideo),
                  flex: 12,
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        proxQuestao();
                      },
                      color: Colors.blue,
                      child: Image.asset('img/right-arrow.png',
                          height: 40, width: 40)),
                  flex: 14,
                ),
              ],
            ),
            // ),
            Column(
              children: <Widget>[
                Text('Pontuação', style: TextStyle(fontSize: 30)),
                Text(
                  '$placar',
                  //  style: Theme.of(context).textTheme.display1,
                  style: TextStyle(fontSize: 100),
                ),
              ],
            )
          ],
        ))));
  }

  void exibeVideo() {
    print(questoesList.questoes[_id].video);

    var redir = questoesList.questoes[_id].video;

    switch (redir) {
      case "basico":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VideosBasico()));
        break;
      case "intermediario":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VideosIntermediario()));
        break;
      case "avancado":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VideosAvancado()));
        break;
      default:
    }
  }

  void montaChoice() {
    _textRadioA = Text(questoesList.questoes[_id].altA);
    _textRadioB = Text(questoesList.questoes[_id].altB);
    _textRadioC = Text(questoesList.questoes[_id].altC);
    _textRadioD = Text(questoesList.questoes[_id].altD);
    _textRadioE = Text(questoesList.questoes[_id].altE);
  }

  imprimeResultado(resultado) {
    if (resultado == null) {
      return Text('');
    } else if (resultado) {
      return Text('Correta',
          style: TextStyle(fontSize: 20, color: Colors.green[800]));
    } else {
      return Text('Incorreta',
          style: TextStyle(fontSize: 20, color: Colors.red[600]));
    }
  }

  void corrige() {
    var choice;
    if (corrigeFlag) {
      setState(() {
        switch (questoesList.questoes[_id].correta) {
          case 'A':
            choice = SingingCharacter.A;
            break;
          case 'B':
            choice = SingingCharacter.B;
            break;
          case 'C':
            choice = SingingCharacter.C;
            break;
          case 'D':
            choice = SingingCharacter.D;
            break;
          case 'E':
            choice = SingingCharacter.E;
            break;
        }
        if (_character == choice) {
          resultado =
              true; // "Text(\"Correta\",style: TextStyle(fontSize: 20, color: Colors.blueGrey[500]))";
//        return Text('Correta',style: TextStyle(fontSize: 20, color: Colors.lightGreenAccent[500]));
          placar++;
          corrigeFlag = false;
        } else {
          resultado = false;
//        return Text('Errada',style: TextStyle(fontSize: 20, color: Colors.blueGrey[500]));
          placar--;
        }
        tentativas++;
        desempenho('corrige');
      });
    }
  }

  void elimina() {
    var list = ['A', 'B', 'C', 'D', 'E'];

    print(eliminaCont);

    if (eliminaCont < 2) {
      while (true) {
        var randomItem = ((list..shuffle()).first);

        if (questoesList.questoes[_id].correta == randomItem) {
          continue;
        } else {
          setState(() {
            switch (randomItem) {
              case 'A':
                _textRadioA = Text(questoesList.questoes[_id].altA,
                    style: TextStyle(backgroundColor: Colors.red));
                break;
              case 'B':
                _textRadioB = Text(questoesList.questoes[_id].altB,
                    style: TextStyle(backgroundColor: Colors.red));
                break;
              case 'C':
                _textRadioC = Text(questoesList.questoes[_id].altC,
                    style: TextStyle(backgroundColor: Colors.red));
                break;
              case 'D':
                _textRadioD = Text(questoesList.questoes[_id].altD,
                    style: TextStyle(backgroundColor: Colors.red));
                break;
              case 'E':
                _textRadioE = Text(questoesList.questoes[_id].altE,
                    style: TextStyle(backgroundColor: Colors.red));
                break;
            }
          });
          cont = true;
          break;
        }
      }
      ++eliminaCont;
    }
    desempenho('elimina');
    setState(() {});
  }

  _launchURL(url) async {
    print(url);
    desempenho('consulta');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void proxQuestao() {
//    corrige();
    // print("Questiolist tamanho:");
    // print(this.questoesList.questoes.length);
    // print("ID");
    // print(_id);
    corrigeFlag = true;
    eliminaCont = 0;

    if (_id >= this.questoesList.questoes.length - 1) {
      _id = 0;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Desempenho(
                  tentativas: tentativas,
                  acertos: acertos,
                  erros: erros,
                  consulta: consulta,
                  coringa: coringa)));
    } else {
      _id++;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Questoes_ui(questoesList: this.questoesList)));
    }
  }

  // Calcula o desempenho
  void desempenho(funcao) {
    switch (funcao) {
      case 'elimina':
        coringa++;
        break;
      case 'consulta':
        consulta++;
        break;
      default:
        if (resultado) {
          acertos++;
        } else {
          erros++;
        }
    }
  }
}
