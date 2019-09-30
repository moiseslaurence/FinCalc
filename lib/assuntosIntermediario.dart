import 'package:flutter/material.dart';
import 'main.dart';
import 'package:fincalc_prod/questoes_services.dart' as service;

void assuntosIntermediario() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: AssuntosIntermediario(),
  ));
}

class AssuntosIntermediario extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinCalc - Intermédiario', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.5,),
          actions: <Widget>[
            FlatButton(
              // icon: Icon(Icons.home),
              child: Image.asset('img/house.png',height: 50, width: 50),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyApp()));},
            ),
          ]
      ),
      body: Center(
 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selecione o assunto',
              style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black54),
            ),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child:
            RaisedButton(
              onPressed: () {
                service.loadQuestoes('jurosSimplesIntermed',context);
              },
              child: Text('Juros Simples', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.7, ),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 118),
              color: Colors.blue[700],
            ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child:
            RaisedButton(
              onPressed: () {
                service.loadQuestoes('educaFinanIntermed',context);
              },
              child: Text('Educação Financeira', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.6, ),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
              color: Colors.blue[900],
            ),
            ),
            Divider(),

          ],

        ),
      ),
    );
  }
}

//class FirstRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Route'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Open route'),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondRoute()),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class SecondRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Route"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
//    );
//  }
//}