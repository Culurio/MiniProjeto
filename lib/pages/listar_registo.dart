import 'package:flutter/material.dart';
import 'package:mini_projeto/main.dart';
import 'package:mini_projeto/widgets/note_card_widget.dart';

class ListarWidget extends StatefulWidget {
  const ListarWidget({
    super.key,
  });

  @override
  State<ListarWidget> createState() => _ListarWidgetState();
}

class _ListarWidgetState extends State<ListarWidget> {
  final items = avaliacaoLista;

  @override
  Widget build(BuildContext context) {
    String resposta = "";
    avaliacaoLista.ordenarData();
    return Scaffold(
        body: ListView.builder(
          itemCount: items.getLista().length,
          itemBuilder: (context, index) {
            final item = items.getItem(index);
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
                key: UniqueKey(),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  resposta = items.remover(index,items.getItem(index));
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(resposta)));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: ListTile(
                title: NoteCard(title:item.disciplina_nome
                  ,type:item.tipo.toString(),evaluationDate:item.data,difficulty:"${item.nivel}",
                  avaliacao: item,index:index),
              ),
            );
          },
        ),
    );
  }
}