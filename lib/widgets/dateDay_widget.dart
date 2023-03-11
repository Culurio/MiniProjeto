import 'package:flutter/material.dart';
import 'package:mini_projeto/avalicao.dart';
class DateFormDayWidget extends StatefulWidget {
  Avaliacao avaliacao;
   DateFormDayWidget({
    super.key,
     required this.avaliacao
  });

  @override
  State<DateFormDayWidget> createState() => _DateFormDayWidgetState();
}

class _DateFormDayWidgetState extends State<DateFormDayWidget> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.avaliacao.data = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "ex: 2023/01/31",
      ),
      validator: (value) {
        if (value != null && value.length < 4) {
          return 'Enter at least 10 characters';
        } else {
          return null;
        }
      },
      maxLength: 30,
    );
  }
}