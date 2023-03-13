import 'package:flutter/material.dart';
import 'package:mini_projeto/models/avalicao.dart';
import 'package:mini_projeto/pages/editar_avaliacao.dart';

import '../pages/listar_registo.dart';
import 'build_details_widget.dart';


class NoteCard extends StatefulWidget {
  late final String title;
  late final String type;
  late final String evaluationDate;
  late final String difficulty;
  final VoidCallback? onClicked;
  Avaliacao avaliacao;
  int index;

  NoteCard(
      {required this.title,
      required this.type,
      required this.evaluationDate,
      required this.difficulty,
        required this.avaliacao,
        required this.index,
      this.onClicked});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Color(0xFF17C3B2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tipo:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.type,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Data da Avaliação',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.evaluationDate,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Dificuldade:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.difficulty,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push( context, MaterialPageRoute( builder: (context) => SubjectDetailsCard(
                        avaliacao: widget.avaliacao)),
                    );
                  },
                  child: const Text(
                    'Ver Detalhes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 140,
                ),
                ElevatedButton(
                  onPressed: () {
                    if(widget.avaliacao.edit() == ""){
                      Navigator.push( context, MaterialPageRoute( builder: (context) => EditarRegistodWidget(
                          avaliacao: widget.avaliacao,index: widget.index)),
                      );
                    }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(widget.avaliacao.edit())));
                    }
                  },
                  child: const Text(
                    'Editar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

  }
}
