import 'dart:convert';

import 'package:fincalc_prod/questoes.dart';
import 'package:fincalc_prod/questoes_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

  Future<String> _loadQuestaoAsset(issue) async{
  // String texto = issue;
    return await rootBundle.loadString(issue);
  }


  Future loadQuestoes(String foo, BuildContext context) async{
    String issue;
    QuestoesList questoesList;
    
    switch (foo) {
    case 'porcentagemBasico':
      issue = 'questions/basicoPorcentagem.json';
      break;
    case 'educaFinanBasico':
      issue = 'questions/basicoEducaFincanceira.json';
      break;
    case 'jurosSimplesIntermed':
      issue = 'questions/intermediarioJurosSimples.json';
      break;
    case 'educaFinanIntermed':
      issue = 'questions/intermediarioEducaFincanceira.json';
      break;
    case 'JurosCompostosAvancado':
      issue = 'questions/avancadoJurosCompostos.json';
      break;
    case 'educaFinanAvancado':
      issue = 'questions/avancadoEducaFinanceira.json';
      break;
    default:
    }

    String jsonQuestoes = await _loadQuestaoAsset(issue);
    final jsonResponse = jsonDecode(jsonQuestoes);
    questoesList = QuestoesList.fromJson(jsonResponse); 

    Navigator.push(context, MaterialPageRoute(builder: (context) => Questoes_ui(
                  questoesList: questoesList,))); 
  }