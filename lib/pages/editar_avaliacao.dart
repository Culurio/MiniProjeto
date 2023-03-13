import 'package:flutter/material.dart';
import 'package:mini_projeto/models/avalicao.dart';
import 'package:mini_projeto/widgets/build_text_widget.dart';
import 'package:mini_projeto/widgets/button_widget.dart';
import 'package:mini_projeto/main.dart';
import 'package:mini_projeto/models/tipo_avaliacao.dart';
import 'package:mini_projeto/widgets/date_hour_picker.dart';

class EditarRegistodWidget extends StatefulWidget {
  Avaliacao avaliacao;
  int index;
  EditarRegistodWidget({
    super.key,
    required this.index,
    required this.avaliacao
  });

  @override
  State<EditarRegistodWidget> createState() => _EditarRegistoWidgetState();
}

class _EditarRegistoWidgetState extends State<EditarRegistodWidget> {
  final formKey = GlobalKey<FormState>();
  late int _value;
  Tipo? tipo;
  var avaliacao;
  @override
  Widget build(BuildContext context) {
    avaliacao = widget.avaliacao;
    tipo = avaliacao.tipo;
    _value = avaliacao.nivel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar formulário"),
      ),
      body: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Column(
              children: [
                ListTile(
                  title: BuildText_widget(text: "Editar nome da disciplina", icon: Icons.person),
                  subtitle: buildForm(avaliacao.disciplina_nome, false, "nome"),
                ),
                DatetimePickerWidget(avaliacao:avaliacao,edit: true),
                const SizedBox(height: 50),
                BuildText_widget(text: "Editar tipo da avalição", icon: Icons.text_snippet_outlined),
                buildOptions(),
                const SizedBox(height: 50),
                ListTile(
                  title: BuildText_widget(text: "Editar dificuldade", icon: Icons.warning_amber_rounded),
                  subtitle: sliderDificuldade(),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 200,
                  child: ListTile(
                    subtitle: buildForm(
                        avaliacao.observacoes, true, "obs"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Column buildOptions() {
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
              avaliacao.tipo = tipo;
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
              avaliacao.tipo = tipo;
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
              avaliacao.tipo = tipo;
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
              avaliacao.tipo = tipo;
            },
          ),
        )
      ],
    );
  }

  Widget sliderDificuldade() {
    return Slider(
      value: _value.toDouble(),
      min: 1.0,
      max: 5.0,
      divisions: 4,
      activeColor: Color(0xFF17C3B2),
      inactiveColor: Color(0xFFFFCB77),
      label: "$_value",
      onChanged: (double newValue) {
        setState(() {
          _value = newValue.round();
          avaliacao.nivel = _value;
        });
      },
    );
  }

  Widget buildForm(String initialText, bool multiline, String formName) {
    if (multiline) {
      return TextFormField(
        initialValue: initialText,
        onChanged: (value) {
          avaliacao.observacoes = value;
        },
        keyboardType: TextInputType.multiline,
        maxLength: 200,
        maxLines: 20,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        ),
      );
    }

    return TextFormField(
      initialValue: initialText,
      onChanged: (value) {
        avaliacao.disciplina_nome = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null && value.length < 0) {
          return 'O campo está vazio';
        } else {
          return null;
        }
      },
      maxLength: 30,
    );
  }

  Widget buildSubmit() {

    return Builder(
      builder: (context) => ButtonWidget(
        text: 'Editar',
        onClicked: () {
          Avaliacao avaliacaob = Avaliacao(avaliacao.disciplina_nome, avaliacao.tipo,
              avaliacao.data, avaliacao.nivel, avaliacao.observacoes);
          final isValid = formKey.currentState!.validate();
          // FocusScope.of(context).unfocus();
          if (isValid && avaliacaob.data != "Não podes selecionar datas passadas"
              && avaliacaob.data != "Seleciona o dia e a hora") {
            avaliacaoLista.remover(widget.index,widget.avaliacao);
            avaliacaoLista.adicionar(avaliacaob);
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('O registo de avaliação selecionado foi editado com sucesso.')));
          }
        },
      ),
    );
  }

}
