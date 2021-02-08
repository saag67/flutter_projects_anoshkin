import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/text_styles.dart';
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
        title: decorateTitle(),
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
      bottomNavigationBar: btmNavigationBat(),
    );
  }
}

///класс кастомного виджета, наследника PreferredSize
class MyAppBar extends PreferredSize {
  MyAppBar({Key key, Widget title, Color color, int elevation})
      : super(
          key: key,
          preferredSize: Size.fromHeight(56.0),
          child: AppBar(
            title: title,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        );
}

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

///единый виджет меню BottomNavigationBar для экранов SightListScreen и VisitingScreen
Widget btmNavigationBat() {
  return BottomNavigationBar(
    currentIndex: 0,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map_outlined),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: '',
      ),
    ],
  );
}
