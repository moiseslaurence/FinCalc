import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'questoes_list.dart';
// import 'desempenho.dart';

enum SingingCharacter { A, B, C, D }
var _id = 0, placar = 0;
var tentativas = 0, acertos = 0, erros = 0, coringa = 0, consulta = 0;

void questoes_ui() {
  runApp(MaterialApp(
    title: 'FinCalc App',
    home: Questoes_ui(),
  ));
} 

class Questoes_ui extends StatefulWidget {
  final String foo;

  const Questoes_ui({Key key, this.foo}): super(key: key);

  @override
  _Questoes_uiState createState() => _Questoes_uiState(foo: foo);
}

class _Questoes_uiState extends State<Questoes_ui> {
  SingingCharacter _character; // = SingingCharacter.lafayette;
  var resultado, cont = false;//, _textRadio = '-1';
  var _textRadioA, _textRadioB, _textRadioC, _textRadioD;
  QuestoesList questoesList;
  String foo, issue;

  _Questoes_uiState({this.foo});

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 1));
  }

  Future<String> _loadQuestaoAsset() async{
    // String texto = issue;
  print(issue);
  return await rootBundle.loadString(issue);
}

Future loadQuestoes() async{
  String jsonQuestoes = await _loadQuestaoAsset();
  final jsonResponse = jsonDecode(jsonQuestoes);
  // 
  setState(() {
    questoesList = QuestoesList.fromJson(jsonResponse);  
  });
 }
 
  @override
  void initState() {
    // print('iniciou');
    switch (foo) {
    case 'jurosSimples':
      issue = 'questions/basicoJurosSimples.json';
      break;
    default:
    }
    _getThingsOnStartup().then((value){
      print('Async done');
      loadQuestoes();
    });

     
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(questoesList);

    if (!cont) {
      print(questoesList.questoes[_id].altA); 
      print("Rota $foo");
      montaChoice(); 
    }
    // print(mapQuestions['01']);

    return Scaffold(
      appBar:
          AppBar(title: Text('Questões'), centerTitle: true, actions: <Widget>[
        // action button
        FlatButton(
          child: 
          Image.asset('img/house.png',height: 40,width: 40,),
          onPressed: () {
            // clear();
          // _id = placar = 0;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
          },

        ),

        FlatButton(
          child: 
          Image.asset('img/checklist.png',height: 40,width: 40,),
          onPressed: () {
            // Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => Desempenho(
          //               tentativas: tentativas,
          //               acertos: acertos,
          //               erros: erros,
          //               consulta: consulta,
          //               coringa: coringa)));
          },
        ),
      ]),
      body: new Column(
        
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.question_answer),
            title: new Text(questoesList.questoes[_id].enunciado)
          ),
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
          imprimeResultado(resultado),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: corrige,
                  child: 
                  Image.asset('img/goal.png',height: 50, width: 50)
                ),
                FlatButton(
                  onPressed: elimina,
                  child: 
                  Image.asset('img/joker.png',height: 50, width: 50)
                ),
                FlatButton(
                    child: 
                    Image.asset('img/leitura.png',height: 50, width: 50),
                    onPressed: () {
                      if (coringa <= 5) {
                        _launchURL(questoesList.questoes[_id].link);  
                      
                      }
                    }
                ),
                FlatButton(
                  onPressed: () {
                    proxQuestao();
                  },
                  child: 
                  Image.asset('img/right-arrow.png',height:50,width:50)
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text('Pontuação', style: TextStyle(fontSize: 30)),
              Text(
                '$placar',
//            style: Theme.of(context).textTheme.display1,
                style: TextStyle(fontSize: 100),
              ),
            ],
          )
            ],
          )
    );
  }

  void montaChoice(){ 
    // print(questoesList); 
    _textRadioA = Text(questoesList.questoes[_id].altA);
    _textRadioB = Text(questoesList.questoes[_id].altB);
    _textRadioC = Text(questoesList.questoes[_id].altC);
    _textRadioD = Text(questoesList.questoes[_id].altD); 
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
      }
      if (_character == choice) {
        resultado =
            true; // "Text(\"Correta\",style: TextStyle(fontSize: 20, color: Colors.blueGrey[500]))";
//        return Text('Correta',style: TextStyle(fontSize: 20, color: Colors.lightGreenAccent[500]));
        placar++;
      } else {
        resultado = false;
//        return Text('Errada',style: TextStyle(fontSize: 20, color: Colors.blueGrey[500]));
        placar--;
      }
      tentativas++;
      // desempenho('corrige');
    });
  }

  void elimina() {
    var list = ['A', 'B', 'C', 'D'];

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
          }
        });
        cont = true;
        break;
      }
    }
    // desempenho('elimina');
    setState(() {});
  }

  _launchURL(url) async {
    // desempenho('consulta');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    } 
  }

  void proxQuestao() {
//    corrige();
    if (_id >= 20) {
      _id = 0;
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Desempenho(
      //                   tentativas: tentativas,
      //                   acertos: acertos,
      //                   erros: erros,
      //                   consulta: consulta,
      //                   coringa: coringa)));
    } else { 
      _id++;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Questoes_ui(foo: this.foo)));
    }
  }
}
