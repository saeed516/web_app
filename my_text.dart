import 'package:flutter/material.dart';



class MyText extends StatelessWidget {
  final String? text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  const MyText(
      {required this.text,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 14.0,
      this.color = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style:
          TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color),
    );
  }
}
