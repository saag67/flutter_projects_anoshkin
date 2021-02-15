import 'package:flutter/material.dart';
import 'package:places/res/colors/colors.dart';

///файл стилей шрифтов
const TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
);

TextStyle matHeadline6 = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 26,
  letterSpacing: 0.15,
);

TextStyle matHeadline6Black = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 26,
  letterSpacing: 0.15,
  color: Colors.black,
);

TextStyle matHeadline6Yellow = _text.copyWith(
  fontWeight: FontWeight.w500,
  color: Colors.yellow,
);

TextStyle matHeadline6LightGreen = _text.copyWith(
  fontWeight: FontWeight.w500,
  fontSize: 26,
  color: Colors.lightGreen,
);

TextStyle matHeadline5 = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 24,
);

TextStyle matSubtitle2 = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: dmSecondaryBlack,
);

TextStyle matSubtitle2light = _text.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: 14,
);
