import 'package:flutter/material.dart';

void embreve(){
  runApp(MaterialApp(
    title: 'Em breve', 
    home: Embreve(),
  ));
}

class Embreve extends StatefulWidget {
  @override
  _EmbreveState createState() => _EmbreveState();
}

class _EmbreveState extends State<Embreve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinCalc App'),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue,
          alignment: Alignment.center,
          child:
              Text('Em breve...',
              style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),

//          foregroundDecoration: BoxDecoration(
//            image: DecorationImage(
//              image: NetworkImage('https://www.example.com/images/frame.png'),
//              centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//            ),
//          ),
//          transform: Matrix4.rotationZ(0.1),
        )
      )
    );

  }
}
