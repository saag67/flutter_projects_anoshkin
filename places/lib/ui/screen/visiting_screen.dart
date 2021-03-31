import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/planned_sight_card.dart';
import 'package:places/ui/screen/visited_sight_card.dart';

///класс экрана планируемых к посещению/посещенных мест
class VisitingScreen extends StatefulWidget {
  VisitingScreen({Key key}) : super(key: key);
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

  List<Sight> plannedSights = [mocks[0], mocks[3], mocks[4]];
  List<Sight> visitedSights = [mocks[1], mocks[2], mocks[5]];

  Widget plannedItems(Sight sight, int index) {
    return PlannedSightCard(sight, onCancel: (index) {
      setState(() {
        plannedSights.removeAt(index);
      });
    });
  }

  Widget visitedItems(Sight sight, int index) {
    return VisitedSightCard(sight, onCancel: (index) {
      setState(() {
        visitedSights.removeAt(index);
      });
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      tabController.index == 0
                          ? tabController.index = 1
                          : tabController.index = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: tabController.index == 0
                          ? selectedColorTabIndicator
                          : unselectedColorTabIndicator,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.all(10),
                    width: 170,
                    height: 40,
                    child: Align(
                      child: Text(
                        planned_visit,
                        style: TextStyle(
                          color: tabController.index == 0
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      tabController.index == 1
                          ? tabController.index = 0
                          : tabController.index = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: tabController.index == 1
                          ? selectedColorTabIndicator
                          : unselectedColorTabIndicator,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.all(10),
                    width: 170,
                    height: 40,
                    child: Align(
                      child: Text(
                        visited_sight,
                        style: TextStyle(
                          color: tabController.index == 1
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(48),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Tab(
              child: ReorderableListView.builder(
                physics: Platform.isAndroid
                    ? ClampingScrollPhysics()
                    : BouncingScrollPhysics(),
                itemCount: plannedSights.length,
                scrollDirection: Axis.vertical,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final items = plannedSights.removeAt(oldIndex);
                    plannedSights.insert(newIndex, items);
                  });
                },
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        plannedSights.removeAt(index);
                      });
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 24,
                      height: 24,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                bucket,
                                fit: BoxFit.scaleDown,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: matDismissible,
                                  text: toDelete,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    key: ValueKey(plannedSights[index]),
                    child: plannedItems(plannedSights[index], index),
                  );
                },
              ),
            ),
            Tab(
              child: ReorderableListView.builder(
                physics: Platform.isAndroid
                    ? ClampingScrollPhysics()
                    : BouncingScrollPhysics(),
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final items = visitedSights.removeAt(oldIndex);
                    visitedSights.insert(newIndex, items);
                  });
                },
                scrollDirection: Axis.vertical,
                itemCount: visitedSights.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        visitedSights.removeAt(index);
                      });
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 24,
                      height: 24,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                bucket,
                                fit: BoxFit.scaleDown,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: matDismissible,
                                  text: toDelete,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    key: ValueKey(visitedSights[index]),
                    child: visitedItems(visitedSights[index], index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
