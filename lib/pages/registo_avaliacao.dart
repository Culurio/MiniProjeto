import 'package:flutter/material.dart';
import 'package:mini_projeto/avalicao.dart';
import 'package:mini_projeto/widgets/build_text_widget.dart';
import 'package:mini_projeto/widgets/button_widget.dart';
import 'package:mini_projeto/main.dart';
import 'package:mini_projeto/tipo_avaliacao.dart';
import 'package:mini_projeto/widgets/date_hour_picker.dart';

import '../widgets/dateDay_widget.dart';

class RegistodWidget extends StatefulWidget {
  const RegistodWidget({
    super.key,
  });

  @override
  State<RegistodWidget> createState() => _RegistoWidgetState();
}

class _RegistoWidgetState extends State<RegistodWidget> {
  Avaliacao avaliacao = Avaliacao("", Tipo.frequencia, "", "", 3, "");
  final formKey = GlobalKey<FormState>();
  int _value = 3;
  Tipo? tipo = Tipo.miniTeste;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Column(
              children: [
                ListTile(
                  title: BuildText_widget(text: "Nome da disciplina", icon: Icons.person),
                  subtitle: buildForm("", false, "nome"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: BuildText_widget(text: "Data", icon: Icons.calendar_month),
                        subtitle: DateFormDayWidget(avaliacao:avaliacao),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ListTile(
                        title: BuildText_widget(text: "Horas", icon: Icons.watch_later_outlined),
                        subtitle: buildForm("ex: 14:30", false, "hora"),
                      ),
                    ),
                  ],
                ),
                buildOptions(),
                ListTile(
                  title: BuildText_widget(text: "Dificuldade", icon: Icons.warning_amber_rounded),
                  subtitle: sliderDificuldade(),
                ),
                SizedBox(
                  height: 200,
                  child: ListTile(
                    subtitle: buildForm(
                        "Escreve aqui alguma observação", true, "obs"),
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

  Widget buildForm(String hint, bool multiline, String formName) {
    if (multiline) {
      return TextFormField(
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
          hintText: hint,
        ),
      );
    }

    return TextFormField(
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
        hintText: hint,
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
        text: 'Submeter',
        onClicked: () {
          final isValid = formKey.currentState!.validate();
          // FocusScope.of(context).unfocus();
          debugPrint(avaliacao.data);
          if (isValid) {
            avaliacaoLista.adicionar(avaliacao2);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Criado com sucesso')));
          }
        },
      ),
    );
  }

}
