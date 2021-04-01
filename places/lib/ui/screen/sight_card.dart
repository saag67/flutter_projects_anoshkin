import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/ui/screen/sight_details.dart';

///класс карточки интересного места
class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight, {Key key}) : super(key: key);

  Widget buttonBar() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {
            //print("Added to Favorites");
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //double width2 = MediaQuery.of(context).size.width / 2;
    Size size = MediaQuery.of(context).size;

    final title = RichText(
      text: TextSpan(
        style: TextStyle(
          color:
              App.isDarkTheme ? lmCardBackgroundColor : dmCardBackgroundColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        text: sight.name,
      ),
    );

    final sightType = RichText(
      text: TextSpan(
          style: TextStyle(
            color: Colors.white,
          ),
          text: sight.type),
    );

    return Stack(
      children: [
        SafeArea(
          child: Card(
            color:
                App.isDarkTheme ? dmCardBackgroundColor : lmCardBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    sight.url,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : RefreshProgressIndicator();
                    },
                    height: size.height / 5,
                    width: size.width,
                  ),
                ),
                Container(
                  height: 100,
                  child: ListTile(
                    title: title,
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: SizedBox(
            width: size.width,
            height: size.height / 3,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (context) => SightDetails(sight),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 10,
          child: buttonBar(),
        ),
        Positioned(
          left: 20,
          top: 30,
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
    );
  }
}
