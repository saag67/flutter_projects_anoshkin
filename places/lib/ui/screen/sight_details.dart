import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';

///класс экрана-детализации интересного места
class SightDetails extends StatefulWidget {
  final Sight sight;
  SightDetails(this.sight);

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  void _omItemTaped(int index) {
    index == 0 ? print("Planned") : print("Added to Favorites");
  }

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: InkWell(
            onTap: () {
              Navigator.pop(context);
              print("Go back");
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Icon(Icons.arrow_back_ios_outlined),
            ),
          ),
          onPressed: () {},
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: width1,
                //height: height1 / 2,
                color: Colors.lightBlue,
                child: Image.network(
                  widget.sight.url,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(
                            child: RefreshProgressIndicator(),
                          );
                  },
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RichText(
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
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
                        text: "${widget.sight.details}",
                        style: matSubtitle2light,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 15,
            right: 10,
            left: 10,
            child: ElevatedButton(
              onPressed: () {
                print("the route created");
              },
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
        ],
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
        onTap: _omItemTaped,
      ),
    );
  }
}
