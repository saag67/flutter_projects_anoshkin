import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/res/colors/colors.dart';

import '../../main.dart';

///класс виджета-карточки посещенного места
class VisitedSightCard extends StatelessWidget {
  final Sight sight;

  VisitedSightCard(this.sight);
  @override
  Widget build(BuildContext context) {
    double width2 = MediaQuery.of(context).size.width / 2;
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              sight.url,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : Center(
                        child: RefreshProgressIndicator(),
                      );
              },
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin:
                  EdgeInsets.only(left: 10, top: 0.0, right: 10, bottom: 0.0),
              decoration: BoxDecoration(
                color: App.isDarkTheme
                    ? dmCardBackgroundColor
                    : lmCardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: 200,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: width2,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: App.isDarkTheme
                                ? lmCardBackgroundColor
                                : dmCardBackgroundColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          text: sight.name,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    text: sight.type),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
