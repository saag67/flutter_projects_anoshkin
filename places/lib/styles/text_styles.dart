import 'package:flutter/material.dart';

var textBlack = TextStyle(color: Colors.black); //стили текста черного цвета
var textLightGreen =
    TextStyle(color: Colors.lightGreen); //стили текста светло-зеленого цвета
var textYellow = TextStyle(color: Colors.yellow); //стили текста желтого цвета
///метод декорирования заголовка AppBar
Widget decorateTitle() {
  //функция декорирующа заголовок AppBar
  return RichText(
    text: TextSpan(
      text: "C", //декорируется первая буква строки в зеленый цвет
      style: TextStyle(
        color: Colors.lightGreen,
        fontSize:
            24, //максимально возможный размер шрифта для AppBar, иначе такст наползает на границы виджета
        fontWeight: FontWeight.w600,
      ),
      children: [
        TextSpan(
          text: "писок\n",
          style: textBlack,
        ),
        TextSpan(
          text: "и", //декорируется первая буква строки в желтый цвет
          style: textYellow,
        ),
        TextSpan(
          text: "нтересных мест",
          style: textBlack,
        )
      ],
    ),
    textAlign: TextAlign.start,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
  );
}
