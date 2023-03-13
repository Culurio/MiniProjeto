import 'package:flutter/material.dart';
import 'package:mini_projeto/models/avalicao.dart';
import 'package:mini_projeto/widgets/share_button.dart';
import 'package:share_plus/share_plus.dart';


class SubjectDetailsCard extends StatelessWidget {
  final Avaliacao avaliacao;

  SubjectDetailsCard({
    required this.avaliacao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ver Detalhes"),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xFF17C3B2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.book,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      avaliacao.disciplina_nome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(Icons.calendar_today, color: Colors.white),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Data da avaliação: ${avaliacao.data}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Icon(Icons.assessment, color: Colors.white),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Dificuldade: ${avaliacao.nivel}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  ShareButton(
                    onPressed: (){
                      Share.share("Mensagem do Dealer!!\n"+
                          "Vamos ter avaliação de ${avaliacao.disciplina_nome},"+
                          " em ${avaliacao.data}, com a dificuldade de ${avaliacao.nivel} numa escala de 1 a 5."+
                          "Observações para esta avaliação:"+
                          "${avaliacao.observacoes}");
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Partilhar',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Divider(),
              Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xFFFE6D73),
                ),
                child: Center(
                  child: Text(
                    'Observations',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade200,
                ),
                padding: EdgeInsets.all(16.0),
                child: Text(
                  avaliacao.observacoes,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}