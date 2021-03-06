import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';

///класс экрана-детализации интересного места
class SightDetails extends StatefulWidget {
  final Sight sight;
  SightDetails(this.sight, {Key key}) : super(key: key);

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  double left = 0.0;
  double right = 0.0;
  int currentPage = 0;
  int _id = 0;
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;

    void moveIndicator(int page) {
      currentPage = page;

      setState(() {});
    }

    final Widget galerySection = Stack(
      children: [
        Container(
          width: width1,
          height: height1 / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          //color: Colors.transparent,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sight.url.length,
              onPageChanged: moveIndicator,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.sight.url[index],
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : Center(
                              child: RefreshProgressIndicator(),
                            );
                    },
                    fit: BoxFit.cover,
                  ),
                );
              }),
        ),
        Positioned(
          top: size.height / 2 - 8,
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: [
                for (int i = 0; i <= widget.sight.url.length - 1; i++)
                  Container(
                    height: 8,
                    width: size.width / widget.sight.url.length,
                    color:
                        currentPage == i ? lmCheckBoxFill : Colors.transparent,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
    final Widget descriptionSection = Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.justify,
        overflow: TextOverflow.visible,
        maxLines: 300,
        text: TextSpan(
          style: TextStyle(
            color: App.isDarkTheme ? Colors.white : Colors.black,
          ),
          children: [
            TextSpan(
              text: "${widget.sight.name}\n",
              style: matHeadline5,
            ),
            TextSpan(
              text: "${widget.sight.type}\n",
              style: matSubtitle2,
            ),
            TextSpan(
              text: " \n",
            ),
            TextSpan(
              text: "ID: ${widget.sight.id} ${widget.sight.details}",
              style: matSubtitle2light,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [galerySection],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [descriptionSection],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 10,
              left: 10,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: lmSettingScreenAppBarButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: matDetailsButton,
                      text: create_route,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.clear),
                  ),
                ),
                onPressed: () {},
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 10,
              left: size.width / 2 - 20,
              child: SvgPicture.asset(btm_sheet_rect),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: to_schedule,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: add_to_favourites,
          ),
        ],
      ),
    );
  }
}
