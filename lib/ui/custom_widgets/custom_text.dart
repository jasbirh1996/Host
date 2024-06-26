import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.color = Colors.black,
      this.fontSize = 14,
      this.textDecoration = TextDecoration.none,
      this.fontWeight = FontWeight.w400,
      this.fontFamily = 'Montserrat'});

  final String text;
  final Color color;
  final double fontSize;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: color,

            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            decoration: textDecoration));
  }
}
