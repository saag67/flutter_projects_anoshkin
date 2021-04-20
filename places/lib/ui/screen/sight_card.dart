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

  Widget buttonBar(BuildContext context) {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              color: App.isDarkTheme
                  ? dmCardBackgroundColor
                  : lmCardBackgroundColor,
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
                      sight.url[0],
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : RefreshProgressIndicator();
                      },
                      height: 120,
                      width: size.width,
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListTile(
                      title: title,
                    ),
                  ),
                ],
              ),
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
                showModalBottomSheet<Widget>(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      minChildSize: 0.25,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) {
                        return SightDetails(sight);
                      }),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 30,
          child: buttonBar(context),
        ),
        Positioned(
          left: 30,
          top: 50,
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
