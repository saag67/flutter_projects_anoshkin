import 'package:flutter/material.dart';

///файл стилей шрифтов
const TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
);

TextStyle matHeadline6 = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 26,
  letterSpacing: 0.15,
  //color: Colors.white,
);

TextStyle matHeadline6Black = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 26,
  letterSpacing: 0.15,
  color: Colors.black,
);

TextStyle matHeadline6Yellow = _text.copyWith(
  fontWeight: FontWeight.w500,
  //fontSize: 26,
  //letterSpacing: 0.15,
  color: Colors.yellow,
);

TextStyle matHeadline6LightGreen = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 26,
  //letterSpacing: 0.15,
  color: Colors.lightGreen,
);
