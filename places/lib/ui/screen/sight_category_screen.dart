import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

class SightCategoryScreen extends StatefulWidget {
  SightCategoryScreen({Key key}) : super(key: key);
  @override
  _SightCategoryScreenState createState() => _SightCategoryScreenState();
}

class _SightCategoryScreenState extends State<SightCategoryScreen> {
  Widget addCategory(int i) {
    return CheckboxListTile(
      value: checkCategory[i],
      checkColor: Colors.lightGreen,
      activeColor: Colors.white,
      title: RichText(
        text: TextSpan(
          style: matSettingsScreenBodyBlack,
          text: listCategories[i],
        ),
      ),
      onChanged: (bool value) {
        setState(() {
          checkCategory[i] = value;
        });
      },
    );
  }

  void clearAll() {
    for (int i = 0; i < listCategories.length; i++) {
      checkCategory[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String category;
    return Scaffold(
      appBar: MyAppBar(
        title: RichText(
          text: TextSpan(
            style: matAddNewSightHeaderBlack,
            text: category_header,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (int i = 0; i < listCategories.length; i++) addCategory(i)
            ],
          ),
          Positioned(
            bottom: 15,
            right: 10,
            left: 10,
            child: ElevatedButton(
              onPressed: () {
                for (int i = 0; i < listCategories.length; i++) {
                  if (checkCategory[i]) {
                    category = listCategories[i];

                    break;
                  }
                }

                Navigator.pop(context, category);
                clearAll();
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
                    style: matSubtitleShow,
                    text: cfreate_uppecase,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
