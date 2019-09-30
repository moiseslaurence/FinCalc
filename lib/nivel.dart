import 'package:flutter/material.dart';
import 'assuntosBasico.dart';
import 'assuntosIntermediario.dart';
import 'assuntosAvancado.dart';
import 'main.dart';

void nivel() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Nivel(),
  ));
}

class Nivel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("FinCalc - Níveis"),
          actions: <Widget>[
            // action button
            FlatButton(
              // icon: Icon(Icons.home),
              child:
              Image.asset('img/house.png',height: 50, width: 50),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyApp()));},
            ),
          ]
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selecione o nível',
              style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black54),
            ),
            Divider(),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child:
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AssuntosBasico()));
              },
              child: Text('Básico', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.8,),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 128),
              color: Colors.green,
            ),
            ),
            Divider(),

            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child:
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AssuntosIntermediario()));
              },
              child: Text('Intermediário',style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.8),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
              color: Colors.blue,
            ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity, // match_parent
              height: 100,
              child:
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AssuntosAvancado()));
              },
              child: Text('Avançado', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.8),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 110),
              color: Colors.deepPurpleAccent,
            ),
            ),Divider(),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}