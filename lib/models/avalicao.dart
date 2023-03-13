import 'package:intl/intl.dart';
import 'package:mini_projeto/models/tipo_avaliacao.dart';

class Avaliacao {
  /*
● Nome da disciplina;
● Tipo de avaliação - frequência, mini-teste, projeto, defesa;
● Data e hora da realização - no formato exemplo 2023/01/31 14:30;
● Nível de dificuldade esperado pelo aluno - de 1 a 5;
● Observações (opcional) - este campo é opcional e deverá ter no máximo 200
caracteres (incluindo espaços);
   */
  String disciplina_nome = "";
  String data = "";
  Tipo? tipo = Tipo.frequencia;
  int nivel = 0;
  String observacoes = "";

  Avaliacao (this.disciplina_nome, this.tipo, this.data, this.nivel, this.observacoes);

  String edit (){
    DateTime data = DateFormat('dd-MM-yyyy HH:mm').parse(this.data);
    if(data.isBefore(DateTime.now())){
      return "Só podem ser editadas registos de avaliações futuras.";
    }
    return "";
  }

}