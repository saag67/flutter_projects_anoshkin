import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/search_bar.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

///класс экрана списка интересных мест
class SightListScreen extends StatefulWidget {
  SightListScreen({Key key}) : super(key: key);
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

///класс состояния экрана списка интересных мест
class _SightListScreenState extends State<SightListScreen> {
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            expandedHeight: 80,
            pinned: true,
            floating: true,
            snap: true,
            title: Center(
              child: RichText(
                text: TextSpan(
                  text: list_of_interesting_sights,
                  style: App.isDarkTheme
                      ? matAddNewSightHeader
                      : matAddNewSightHeaderBlack,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned(
                    top: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                            builder: (context) => SightSearchScreen(),
                          ),
                        );
                      },
                      child: SearchBar(enabled),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SightCard(mocks[index]);
              },
              childCount: mocks.length,
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                  builder: (context) => AddSightScreen()));
        },
        child: Container(
          width: 177,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [lmFloatingActionButton, lmSettingScreenAppBarButton],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 3,
              ),
              RichText(
                text: TextSpan(
                  style: matHeadline6,
                  text: plus,
                ),
              ),
              Spacer(flex: 1),
              RichText(
                text: TextSpan(
                  style: matSubtitleShow,
                  text: new_sight,
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

///класс кастомного виджета, наследника PreferredSize

class MyAppBar extends PreferredSize {
  MyAppBar({
    Key key,
    Widget leading,
    Widget title,
    Widget child,
    Color color,
    int elevation,
    bool automaticallyImplyLeading,
  }) : super(
          key: key,
          preferredSize: Size.fromHeight(56.0),
          child: AppBar(
            title: title,
            //backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
        );
}
