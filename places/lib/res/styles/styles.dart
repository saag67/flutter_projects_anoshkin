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

TextStyle matSubtitleShow = _text.copyWith(
  fontWeight: FontWeight.w700,
  fontSize: 14,
);

TextStyle matSubtitle2light = _text.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle matSettingsScreenHeader = _text.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w500,
);

TextStyle matSettingsScreenHeaderBlack = _text.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: dmPrimaryColor,
);

TextStyle matSettingsScreenBody = _text.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle matSettingsScreenBodyBlack = _text.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: dmPrimaryColor,
);

TextStyle matSettingsScreenAppBarGreen = _text.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: lmSettingScreenAppBarButton,
);

TextStyle matSettingsScreenBodyCategory = _text.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: lmSettingsScreenBodyCategory,
);

TextStyle matSettingsScreenBodyCategoryItem = _text.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle matSettingsScreenBodyCategoryItemBlack = _text.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: dmPrimaryColor,
);
