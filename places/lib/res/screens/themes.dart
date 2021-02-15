import 'package:flutter/material.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/styles/styles.dart';

///файл настроек светлой и темной тем
final lightTheme = ThemeData(
  primaryColor: lmPrimaryColor,
  backgroundColor: lmPrimaryColor,
  scaffoldBackgroundColor: lmPrimaryColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lmPrimaryColor,
    selectedItemColor: lmBottomBarSelectedColor,
    unselectedItemColor: lmBottomBarUnselectedColor,
  ),
);
final darkTheme = ThemeData(
  primaryColor: dmPrimaryColor,
  backgroundColor: dmBackgroundColor,
  scaffoldBackgroundColor: dmBackgroundColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dmBackgroundColor,
    selectedItemColor: dmBottomBarSelectedColor,
    unselectedItemColor: dmBottomBarUnselectedColor,
  ),
  textTheme: TextTheme(
    headline6: matHeadline6,
    headline5: matHeadline5,
    subtitle2: matSubtitle2,
    subtitle1: matSubtitle2light,
  ),
);
