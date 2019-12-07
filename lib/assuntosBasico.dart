import 'package:fincalc_prod/questoes_list.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:fincalc_prod/questoes_services.dart' as service;
// import 'embreve.dart';

void assuntosBasico() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: AssuntosBasico(),
  ));
}

class AssuntosBasico extends StatelessWidget {
  QuestoesList questoesList;
  String issue;
  List<String> links = ["", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'FinCalc - Básico',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white),
            textScaleFactor: 0.6,
          ),
          actions: <Widget>[
            FlatButton(
              // icon: Icon(Icons.home),
              child: Image.asset('img/house.png', height: 50, width: 50),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selecione o assunto',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.black54),
            ),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child: RaisedButton(
                onPressed: () {
                  service.loadQuestoes('porcentagemBasico', context);
                },
                child: Row(
                  children: <Widget>[
                    Image.asset("img/idea.png"),
                    Text(
                      "\t\t\tPorcentagem",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.white),
                      textScaleFactor: 0.6,
                    )
                  ],
                ),
                // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 122),
                color: Colors.lightGreenAccent[700],
              ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child: RaisedButton(
                onPressed: () {
                  service.loadQuestoes('educaFinanBasico', context);
                },
                child: Row(
                  children: <Widget>[
                    Image.asset("img/finance.png"),
                    Text(
                      "\t\t\tEducação financeira",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.white),
                      textScaleFactor: 0.6,
                    )
                  ],
                ),
                // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                color: Colors.green[900],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
