import 'package:flutter/material.dart';

import 'main.dart';

void sobre() {
  runApp(MaterialApp(
    title: 'Sobre',
    home: Sobre(),
  ));
}

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sobre'),
          actions: <Widget>[
            FlatButton(
              // icon: Icon(Icons.home),
              child: Image.asset(
                'img/house.png',
                height: 50,
                width: 50,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            )
          ],
        ),
        body: new Column(children: <Widget>[
          Text(
              '\n\n\nAplicativo: App FinCalc\n\nAno de Criação: 2019\n\nCriadores do FinCalc: \n\t - Josenilma Silva; \n\t - Moises Laurence; \n\t - Valci Ferreira Victor.\n\nPós-Graduação: Mestrado Profissional em Educação Profissional e Tecnológica - ProfEPT',
              style: TextStyle(fontSize: 16)),
          Expanded(
            child: Image.asset('img/logos.png', width: 240),
          ),
        ]));
  }
}
