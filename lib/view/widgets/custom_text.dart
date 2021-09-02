import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int maxLines;
  final double height;
  final FontWeight fontWeight;

  const CustomText(
      {Key key,
      this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.maxLines,
      this.height = 1,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight),
      ),
    );
  }
}
