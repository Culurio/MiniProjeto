import 'package:flutter/material.dart';
import 'package:mini_projeto/avalicao.dart';
import 'package:mini_projeto/widgets/build_text_widget.dart';
import 'package:mini_projeto/widgets/button_widget.dart';
import 'package:mini_projeto/main.dart';
import 'package:mini_projeto/tipo_avaliacao.dart';

class EditarRegistodWidget extends StatefulWidget {
   Avaliacao avaliacao;
   int index;
   EditarRegistodWidget({required this.avaliacao,required this.index,
    super.key,
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
        title: Text(
          "Agenda IQueChumbei",
          style: TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.bold, fontSize: 20),
        ),
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
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: BuildText_widget(text: "Editar data", icon: Icons.calendar_month),
                        subtitle: buildForm(avaliacao.data, false, "data"),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ListTile(
                        title: BuildText_widget(text: "Editar horas", icon: Icons.watch_later_outlined),
                        subtitle: buildForm(avaliacao.hora, false, "hora"),
                      ),
                    ),
                  ],
                ),
                buildOptions(),
                ListTile(
                  title: BuildText_widget(text: "Editar dificuldade", icon: Icons.warning_amber_rounded),
                  subtitle: sliderDificuldade(),
                ),
                SizedBox(
                  height: 200,
                  child: ListTile(
                    subtitle: buildForm(
                        "Editar observação", true, "obs"),
                  ),
                ),
              ],
            ),
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

  Slider sliderDificuldade() {
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
        switch (formName) {
          case "nome":
            avaliacao.disciplina_nome = value;
            break;
          case "data":
            avaliacao.data = value;
            break;
          case "hora":
            avaliacao.hora = value;
            break;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null && value.length < 4) {
          return 'Enter at least 4 characters';
        } else {
          return null;
        }
      },
      maxLength: 30,
    );
  }

  Widget buildSubmit() {

    Avaliacao avaliacao2 = Avaliacao(avaliacao.disciplina_nome, avaliacao.tipo,
        avaliacao.data, avaliacao.hora, avaliacao.nivel, avaliacao.observacoes);
    return Builder(
      builder: (context) => ButtonWidget(
        text: 'Confirmar edição',
        onClicked: () {
          final isValid = formKey.currentState!.validate();
          // FocusScope.of(context).unfocus();

          if (isValid) {
            avaliacaoLista.remover(widget.index);
            avaliacaoLista.adicionar(avaliacao2);
          }
        },
      ),
    );
  }

}
