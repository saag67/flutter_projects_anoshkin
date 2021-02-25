import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/sight_card.dart';

///класс экрана списка интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

///класс состояния экрана списка интересных мест
class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: RichText(
          text: TextSpan(
            text: "",
            style: App.isDarkTheme ? matHeadline6 : matHeadline6Black,
            children: [
              TextSpan(
                text: "C",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.lightGreen,
                ),
              ),
              TextSpan(
                text: "писок\n",
              ),
              TextSpan(
                text: "и",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 26,
                ),
              ),
              TextSpan(
                text: "нтересных мест",
              ),
            ],
          ),
          textAlign: TextAlign.start,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SightCard(mocks[0]),
            SightCard(mocks[1]),
            SightCard(mocks[2]),
          ],
        ),
      ),
    );
  }
}

///класс кастомного виджета, наследника PreferredSize
class MyAppBar extends PreferredSize {
  MyAppBar({Key key, Widget leading, Widget title, Color color, int elevation})
      : super(
          key: key,
          preferredSize: Size.fromHeight(56.0),
          child: AppBar(
            title: title,
            //backgroundColor: Colors.white,
            elevation: 0,
          ),
        );
}
