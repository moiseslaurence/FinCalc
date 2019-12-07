import 'package:fincalc_prod/about.dart';

import 'main.dart';
import 'questoes.dart' as questoes;
import 'package:flutter/material.dart';

void desempenho() {
  runApp(MaterialApp(
    title: 'Desempenho',
    home: Desempenho(
      tentativas: questoes.tentativas,
      acertos: questoes.acertos,
      consulta: questoes.consulta,
      coringa: questoes.coringa,
      erros: questoes.erros,
    ),
  ));
}

class Desempenho extends StatelessWidget {
  final acertos, erros, consulta, coringa, tentativas;

  // In the constructor, require a Todo.
  Desempenho(
      {Key key,
      @required this.tentativas,
      @required this.acertos,
      @required this.erros,
      @required this.consulta,
      @required this.coringa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desempenho'),
        actions: <Widget>[
          FlatButton(
            // icon: Icon(Icons.home),
            child: Image.asset(
              'img/house.png',
              height: 50,
              width: 50,
            ),
            onPressed: () {
              clear();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          )
        ],
      ),
      body: Container(
        // padding: const EdgeInsets.all(3),
        color: Colors.blue,
        alignment: Alignment.center,

        child: DataTable(
          columnSpacing: 50,
          horizontalMargin: 50,
          dataRowHeight: 60,
          columns: [
            DataColumn(label: Text("")),
            DataColumn(label: Text("")),
            DataColumn(label: Text(""))
          ],
          rows: [
            DataRow(cells: [
              DataCell(Image.asset(
                "img/goal-2.png",
                width: 40,
              )),
              DataCell(Text("Tentativas",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                  textScaleFactor: 0.55)),
              DataCell(Text(
                tentativas.toString(),
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white),
                textScaleFactor: 0.55,
                textAlign: TextAlign.center,
              ))
            ]),
            DataRow(cells: [
              DataCell(Image.asset(
                "img/answer.png",
                width: 40,
              )),
              DataCell(Text("Acertos",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                  textScaleFactor: 0.55)),
              DataCell(Text(
                acertos.toString(),
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white),
                textScaleFactor: 0.55,
                textAlign: TextAlign.center,
              ))
            ]),
            DataRow(cells: [
              DataCell(Image.asset(
                "img/answer-2.png",
                width: 40,
              )),
              DataCell(Text("Erros",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                  textScaleFactor: 0.55)),
              DataCell(Text(
                erros.toString(),
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white),
                textScaleFactor: 0.55,
                textAlign: TextAlign.center,
              ))
            ]),
            DataRow(cells: [
              DataCell(Image.asset(
                "img/instruction.png",
                width: 40,
              )),
              DataCell(Text("Consultas",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                  textScaleFactor: 0.55)),
              DataCell(Text(
                consulta.toString(),
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white),
                textScaleFactor: 0.55,
                textAlign: TextAlign.center,
              ))
            ]),
            DataRow(cells: [
              DataCell(Image.asset(
                "img/joker-2.png",
                width: 40,
              )),
              DataCell(Text("Coringas",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white),
                  textScaleFactor: 0.55)),
              DataCell(Text(
                coringa.toString(),
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white),
                textScaleFactor: 0.55,
                textAlign: TextAlign.center,
              ))
            ]),
          ],
          // final acertos, erros, consulta, coringa, tentativas;
          // sortColumnIndex: 0,
          // sortAscending: true,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Sobre()));
        },
        label: Text('Sobre nós'),
        icon: Icon(Icons.assignment_late),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

void clear() {
  questoes.tentativas = 0;
  questoes.acertos = 0;
  questoes.erros = 0;
  questoes.consulta = 0;
  questoes.coringa = 0;
  questoes.placar = 0;
}

Widget myDetailsContainer3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Tentativas",
          style: TextStyle(
              color: Color(0xffe6020a),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      Container(
          child: Text(
        questoes.tentativas.toString(),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18.0,
        ),
      )),
    ],
  );
}
