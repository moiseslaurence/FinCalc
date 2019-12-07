class QuestoesList {
  final List<Questoes> questoes;

  QuestoesList({
    this.questoes,
  });

  factory QuestoesList.fromJson(List<dynamic> parsedJson) {
    List<Questoes> questoes = new List<Questoes>();
    questoes = parsedJson.map((i) => Questoes.fromJson(i)).toList();

    return new QuestoesList(questoes: questoes);
  }
}

class Questoes {
  final String video;
  final String id;
  final String enunciado;
  final String altA;
  final String altB;
  final String altC;
  final String altD;
  final String altE;
  final String correta;
  final String link;

  Questoes(
      {this.video,
      this.id,
      this.enunciado,
      this.altA,
      this.altB,
      this.altC,
      this.altD,
      this.altE,
      this.correta,
      this.link});

  factory Questoes.fromJson(Map<String, dynamic> json) {
    return new Questoes(
      id: json['id'].toString(),
      video: json['video'],
      enunciado: json['enunciado'],
      altA: json['altA'],
      altB: json['altB'],
      altC: json['altC'],
      altD: json['altD'],
      altE: json['altE'],
      correta: json['correta'],
      link: json['link'],
    );
  }
}
