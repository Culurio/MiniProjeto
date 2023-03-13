import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onPressed;

  ShareButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.share,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }
}