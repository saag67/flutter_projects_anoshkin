import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/planned_sight_card.dart';
import 'package:places/ui/screen/visited_sight_card.dart';

///класс экрана планируемых к посещению/посещенных мест
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: RichText(
              text: TextSpan(
                  style: App.isDarkTheme
                      ? matHeadline6
                      : matHeadline6Black, //TextStyle(

                  text: favorite),
            ),
          ),
          bottom: PreferredSize(
            child: CustomTabIndicator(
              tabController: tabController,
            ),
            preferredSize: Size.fromHeight(48),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Tab(
              child: Column(
                //хочу посетить
                children: [
                  PlannedSightCard(mocks[2]), //SightCard(mocks[2]),
                ],
              ),
            ),
            Tab(
              child: Column(
                //посещенные песта
                children: [
                  VisitedSightCard(mocks[0]),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: NavigationBar(),
      ),
    );
  }
}

///класс виджета кастомного таб-индикатора
class CustomTabIndicator extends StatelessWidget {
  TabController tabController;

  CustomTabIndicator({Key key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 2; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: tabController.index == i
                    ? selectedColorTabIndicator
                    : unselectedColorTabIndicator,
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.all(10),
              width: 170,
              height: 40,
              child: i == 0
                  ? Align(
                      child: Text(
                        planned_visit,
                        style: TextStyle(
                          color: tabController.index == i
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    )
                  : Align(
                      child: Text(
                        visited_sight,
                        style: TextStyle(
                          color: tabController.index == i
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
            ),
          ),
      ],
    );
  }
}
