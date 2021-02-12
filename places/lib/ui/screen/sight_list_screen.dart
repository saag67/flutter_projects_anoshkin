import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/strings/strings.dart';
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
            text: list_interesting_sights,
            style: App.isDarkTheme ? matHeadline6 : matHeadline6Black,
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
      bottomNavigationBar: NavigationBar(),
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
            //backgroundColor: Colors.white,
            elevation: 0,
          ),
        );
}

///класс меню BottomNavigationBar для экранов SightListScreen и VisitingScreen

class NavigationBar extends BottomNavigationBar {
  NavigationBar({Key key})
      : super(
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
