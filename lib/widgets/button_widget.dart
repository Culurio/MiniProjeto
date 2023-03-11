import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      backgroundColor: Color(0xFF17C3B2),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    onPressed: onClicked,
    child: Text(
      text!,
      style: TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.bold, fontSize: 28,
      color: Colors.white),
    ),
  );
}
