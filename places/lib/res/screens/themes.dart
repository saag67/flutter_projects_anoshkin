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
  sliderTheme: SliderThemeData(
    activeTrackColor: lmSettingScreenAppBarButton,
    thumbColor: lmPrimaryColorDark,
    inactiveTrackColor: lmSettingsScreenBodyCategory,
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  //timePickerTheme: TimePickerThemeData(
  //dayPeriodColor: Colors.lightGreenAccent,
  // dayPeriodShape: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(4),
  // ),
  // dayPeriodTextColor: lmSettingScreenAppBarButton,
  // dialHandColor: lmSettingScreenAppBarButton,
  // dialBackgroundColor: lmPrimaryColorDark,
  // hourMinuteColor: Colors.lightGreenAccent,
  // hourMinuteTextColor: lmPrimaryColor,
  //    ),
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
  // timePickerTheme: TimePickerThemeData(
  //   backgroundColor: dmPrimaryColor,
  //   dialBackgroundColor: dmPrimaryColorLight,
  // ),
  textTheme: TextTheme(
      headline6: matHeadline6,
      headline5: matHeadline5,
      subtitle2: matSubtitle2,
      subtitle1: matSubtitle2light,
      headline4: matSettingsScreenHeader,
      bodyText2: matSettingsScreenBody,
      bodyText1: matSettingsScreenBodyCategory,
      button: matSettingsScreenAppBarGreen,
      caption: matSettingsScreenBodyCategoryItemBlack),
  toggleableActiveColor: lmPrimaryColorDark,
);
