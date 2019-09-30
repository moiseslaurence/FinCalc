import 'package:flutter/material.dart';
import 'main.dart';
import 'package:fincalc_prod/questoes_services.dart' as service;

void assuntosAvancado() {
  runApp(MaterialApp(
    title: 'FinCalc - Avaçado',
    home: AssuntosAvancado(),
  ));
}

class AssuntosAvancado extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinCalc - Avançado', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.5,),
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
                service.loadQuestoes('JurosCompostosAvancado',context);
              },
              child: Text('Juros Compostos', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55, ),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 110),
              color: Colors.deepPurple[500],
            ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child:
            RaisedButton(
              onPressed: () {
                service.loadQuestoes('educaFinanAvancado',context);
              },
              child: Text('Educação Financeira', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55, ),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
              color: Colors.deepPurple[800],
            ),
            ),
            Divider(),
          ],

        ),
      ),
    );
  }
}