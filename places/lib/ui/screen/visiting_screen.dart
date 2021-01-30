import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/styles/text_styles.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: VisitingAppBar(
          title: decorateTitle(),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                //хочу посетить
                children: [
                  SightCard(mocks[2]),
                ],
              ),
            ),
            Center(
              child: Column(
                //посещенные песта
                children: [
                  SightCard(mocks[0]),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined),
              label: list_interesting_sights,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_to_photos_outlined),
              label: visited_sights,
            ),
          ],
        ),
      ),
    );
  }
}

///класс-наследник класса MyAppBar для применения настроек Appbar'a текущего экрана
class VisitingAppBar extends MyAppBar {
  VisitingAppBar({Key key, Widget title}) : super(key: key, title: title);
}
