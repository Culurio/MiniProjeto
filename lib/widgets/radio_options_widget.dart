import 'package:flutter/material.dart';
import 'package:mini_projeto/tipo_avaliacao.dart';


class RadioOption extends StatefulWidget {
  const RadioOption({super.key});

  @override
  State<RadioOption> createState() => _RadioOptionState();
}

class _RadioOptionState extends State<RadioOption> {
  Tipo? tipo = Tipo.miniTeste;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Mini-Teste'),
          leading: Radio<Tipo>(
            value: Tipo.miniTeste,
            groupValue: tipo,
            onChanged: (Tipo? value) {
              setState(() {
                tipo = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Projeto'),
          leading: Radio<Tipo>(
            value: Tipo.projeto,
            groupValue: tipo,
            onChanged: (Tipo? value) {
              setState(() {
                tipo = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Defesa'),
          leading: Radio<Tipo>(
            value: Tipo.defesa,
            groupValue: tipo,
            onChanged: (Tipo? value) {
              setState(() {
                tipo = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Frequencia'),
          leading: Radio<Tipo>(
            value: Tipo.frequencia,
            groupValue: tipo,
            onChanged: (Tipo? value) {
              setState(() {
                tipo = value;
              });
            },
          ),
        )
      ],
    );
  }
  Tipo? giveTipo(){
    return tipo;
  }
}
