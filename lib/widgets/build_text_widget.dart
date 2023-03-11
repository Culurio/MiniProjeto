import 'package:flutter/material.dart';
class BuildText_widget extends StatelessWidget {
  const BuildText_widget({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
    child: Row(
      children: <Widget>[
        Icon(icon, color: Color(0xFF227C9D), size: 25),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )
      ],
    ),
  );
}