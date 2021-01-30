import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/res/strings/strings.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
