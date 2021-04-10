import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/ui/screen/onboarding_screen.dart';

///класс заставки при запуске программы
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  Future isInitialized;
  static void reverseString(int number) {
    Stopwatch stopwatch = new Stopwatch()..start();
    var res = loremIpsum.split('').reversed.join();
    debugPrint("reversePrintIsolate() executed in ${stopwatch.elapsed}");
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNext(String res) {
    debugPrint('Future started');
    debugPrint(res);
    Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (context) => OnBoardingScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
      () => go_to_next_screen,
    ).then(
      (value) => _navigateToNext(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [lmFloatingActionButton, lmSettingScreenAppBarButton],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height / 2.5,
          ),
          Container(
            height: 160,
            width: 160,
            child: SvgPicture.asset(
              'res/assets/splash.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
