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
      //   body: Center(
      //       child: Container(
      //     // constraints: BoxConstraints.expand(
      //     //   height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      //     // ),
      //     padding: const EdgeInsets.only(left: 30, top: 30),
      //     color: Colors.blue,
      //     alignment: Alignment.center,
      //     child: GridView.count(
      //       // Create a grid with 2 columns. If you change the scrollDirection to
      //       // horizontal, this produces 2 rows.
      //       crossAxisCount: 3,
      //       padding: const EdgeInsets.all(0.0),
      //       mainAxisSpacing: 30,
      //       crossAxisSpacing: 30,
      //       childAspectRatio: 4,

      //       children: <Widget>[
      //         Image.asset('img/checklist.png',height: 2,width: 2,),
      //         Text('Tentativas:',
      //             style: Theme.of(context).textTheme.headline), //TextStyle(fontSize: 20, color: Colors.green[800])),
      //         Text(tentativas.toString(),
      //             style: Theme.of(context).textTheme.headline),
      //         Image.asset('img/checklist.png',height: 2,width: 2,),
      //         Text('Erros', style: Theme.of(context).textTheme.headline),
      //         Text(erros.toString(),
      //             style: Theme.of(context).textTheme.headline),
      //         Image.asset('img/checklist.png',height: 2,width: 2,),
      //         Text('Acertos', style: Theme.of(context).textTheme.headline),
      //         Text(acertos.toString(),
      //             style: Theme.of(context).textTheme.headline),
      //         Image.asset('img/checklist.png',height: 2,width: 2,),
      //         Text('Consultas', style: Theme.of(context).textTheme.headline),
      //         Text(consulta.toString(),
      //             style: Theme.of(context).textTheme.headline),
      //         Image.asset('img/checklist.png',height: 0.5,width: 0.5,),
      //         Text('Coringa', style: Theme.of(context).textTheme.headline),
      //         Text(coringa.toString(),
      //             style: Theme.of(context).textTheme.headline),

      //       ],
      //     ),
      //   )
      // )
      //   body: SingleChildScrollView(
      //     padding: EdgeInsets.only(top: 12),
      //     child: Table(
      //       // border: _isBorderEnabled ? TableBorder.all() : null,
      //       defaultVerticalAlignment: TableCellVerticalAlignment.top,
      //       children: <TableRow>[
      //         ///First table row with 3 children
      //         TableRow(children: <Widget>[
      //           FittedBox(
      //             fit: BoxFit.contain,
      //             child: Container(
      //               // margin: EdgeInsets.all(2),
      //               color: Colors.red,
      //               width: 30.0,
      //               height: 10.0,
      //               child:
      //                 Image.asset("img/checklist.png"),

      //             ),
      //           ),
      //           FittedBox(
      //             fit: BoxFit.contain,
      //             child: Container(
      //               // margin: EdgeInsets.all(2),
      //               color: Colors.orange,
      //               width: 50.0,
      //               height: 10.0,
      //               // child: Center(
      //                 child: Text(
      //                   "Tentativas",
      //                   textAlign: TextAlign.left,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 6.0,
      //                       ),
      //                 ),
      //               // ),
      //             ),
      //           ),
      //           FittedBox(
      //             fit: BoxFit.contain,
      //             child: Container(
      //               margin: EdgeInsets.all(2),
      //               color: Colors.blue,
      //               width: 50.0,
      //               height: 50.0,
      //               child: Center(
      //                 child: Text(
      //                   tentativas.toString(),
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 6.0,
      //                       ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ]),
      //         ///Second table row with 3 children
      //         TableRow(children: <Widget>[
      //           FittedBox(
      //             fit: BoxFit.contain,
      //             child: Container(
      //               margin: EdgeInsets.all(2),
      //               color: Colors.lightBlue,
      //               width: 50.0,
      //               height: 48.0,
      //               child: Center(
      //                 child: Text(
      //                   "Row 2 \n Element 1",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 6.0,
      //                       ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           FittedBox(
      //             fit: BoxFit.contain,
      //             child: Container(
      //               margin: EdgeInsets.all(2),
      //               color: Colors.green,
      //               width: 48.0,
      //               height: 48.0,
      //               child: Center(
      //                 child: Text(
      //                   "Row 2 \n Element 2",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 6.0,
      //                       ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           FittedBox(
      //             fit: BoxFit.contain,
      //             child: Container(
      //               margin: EdgeInsets.all(2),
      //               color: Colors.blue,
      //               width: 50.0,
      //               height: 100.0,
      //               child: Center(
      //                 child: Text(
      //                   "Row 2 \n Element 3",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 6.0,
      //                     ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ]),
      //       ],
      //     ),
      //   ),
      // body: ListView(
      //     scrollDirection: Axis.vertical,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.all(50.0),
      //         child: Container(
      //           child: new FittedBox(
      //             child: Material(
      //                 color: Colors.blueAccent,
      //                 elevation: 14.0,
      //                 borderRadius: BorderRadius.circular(24.0),
      //                 shadowColor: Color(0x802196F3),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: <Widget>[
      //                     Container(
      //                       child: Padding(
      //                         padding: const EdgeInsets.only(left: 200.0),
      //                         child: myDetailsContainer3(),
      //                       ),
      //                     ),

      //                     Container(
      //                       width: 250,
      //                       height: 200,
      //                       child: ClipRRect(
      //                         borderRadius: new BorderRadius.circular(24.0),
      //                         child: Image(
      //                           fit: BoxFit.contain,
      //                           alignment: Alignment.topRight,
      //                           image: NetworkImage(
      //                               "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
      //                         ),
      //                       ),),
      //                   ],)
      //             ),
      //           ),
      //         ),
      //       ),

      //     ],
      //   ),
      // backgroundColor: Colors.redAccent,
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
            DataRow(
              cells: [
                DataCell(Image.asset("img/goal-2.png",width: 40,)),
                DataCell(Text("Tentativas", style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55)),
                DataCell(Text(tentativas.toString(), style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55,textAlign: TextAlign.center,))
            ]),
            DataRow(
              cells: [
                DataCell(Image.asset("img/answer.png",width: 40,)),
                DataCell(Text("Acertos", style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55)),
                DataCell(Text(acertos.toString(), style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55,textAlign: TextAlign.center,))
            ]),
            DataRow(
              cells: [
                DataCell(Image.asset("img/answer-2.png",width: 40,)),
                DataCell(Text("Erros", style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55)),
                DataCell(Text(erros.toString(), style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55,textAlign: TextAlign.center,))
            ]),
            DataRow(
              cells: [
                DataCell(Image.asset("img/instruction.png",width: 40,)),
                DataCell(Text("Consultas", style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55)),
                DataCell(Text(consulta.toString(), style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55,textAlign: TextAlign.center,))
            ]),
            DataRow(
              cells: [
                DataCell(Image.asset("img/joker-2.png",width: 40,)),
                DataCell(Text("Coringas", style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55)),
                DataCell(Text(coringa.toString(), style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white), textScaleFactor: 0.55,textAlign: TextAlign.center,))
            ]),
          ],
          // final acertos, erros, consulta, coringa, tentativas;
          // sortColumnIndex: 0,
          // sortAscending: true,
        ),
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
