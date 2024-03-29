import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_projeto/models/avalicao.dart';
import 'package:mini_projeto/widgets/button_widget_time.dart';

class DatetimePickerWidget extends StatefulWidget {
  Avaliacao avaliacao;
  late bool edit;
   DatetimePickerWidget({
    super.key,
    required  this.avaliacao,
    required this.edit
  });

  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<DatetimePickerWidget> {
  DateTime? dateTime;
  String getText() {
    if (dateTime == null && !widget.edit) {
      return 'Seleciona o dia e a hora';
    } else {
      return widget.avaliacao.data;
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
    title: 'DateTime',
    text: getText(),
    onClicked: () => pickDateTime(context),
  );

  Future pickDateTime(BuildContext context) async {
    widget.avaliacao.data = "Seleciona o dia e a hora";
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      widget.avaliacao.data = DateFormat('dd-MM-yyyy HH:mm').format(dateTime!);
      if(dateTime!.isBefore(DateTime.now())){
        widget.avaliacao.data = "Não podes selecionar datas passadas";
      }
    });
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );

    if (newTime == null) return null;


    return newTime;
  }
}