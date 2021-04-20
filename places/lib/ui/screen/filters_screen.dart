import 'dart:core';
import 'dart:io';
import 'dart:math';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';

///Класс фильтров интересных мест
class FiltersScreen extends StatefulWidget {
  FiltersScreen({Key key}) : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Sight sight;

  //список для хранения названий интересных мест
  List<Widget> names = [];
  List<Sight> mySights = [];

  //метод очистки chtckbox'ов
  void clearAll(int i) {
    checkboxButtons[i] = false;
  }

  //переменная для хранения координат пользователя, сделано так потому что
  // радиус 10 км, а данные берутся из моков, то что вокруг меня
  Map<String, double> centerPoint = {"lat": 47.093373, "lon": 51.876929};
  //переменная для хранения координат интересного места
  Map<String, double> checkPoint = {"lat": 0.0, "lon": 0.0};
  //метод для проверки существует ли точка интереса в заданных радиусах от пользователя
  bool arePointsNears(Map<String, double> checkPoint,
      Map<String, double> centerPoint, double min, double max) {
    var ky = 40000 / 360;
    double kx = cos(pi * centerPoint["lat"] / 180.0) * ky;
    double dx = (centerPoint["lon"] - checkPoint["lon"]).abs() * kx;
    double dy = (centerPoint["lat"] - checkPoint["lat"]).abs() * ky;
    return sqrt(dx * dx + dy * dy) >= min && sqrt(dx * dx + dy * dy) <= max;
  }

  //метод получениякоординат из моковых данных, проверки их и добавления в список,
  // если они находятся между максимальным и минимальным радиусом от пользователя
  void getCoords(Sight sight, double minRadius, double maxRadius) {
    mySights.clear();
    for (int i = 0; i < mocks.length; i++) {
      checkPoint["lat"] = double.parse(mocks[i].lat);
      checkPoint["lon"] = double.parse(mocks[i].lon);

      if (arePointsNears(checkPoint, centerPoint, minRadius, maxRadius)) {
        names.add(Text(mocks[i].name));
        mySights.add(mocks[i]);
      }
    }
  }

  //метод отрисовки шаблона фильтра в цикле с его кастомизацией в итерации
  Widget addFilter(int i) {
    List<Widget> footers = [
      RichText(
        text: TextSpan(
          style: matSettingsScreenBodyCategoryItemBlack,
          text: hotel,
        ),
      ),
      RichText(
        text: TextSpan(
          style: matSettingsScreenBodyCategoryItemBlack,
          text: restaurant,
        ),
      ),
      RichText(
        text: TextSpan(
          style: matSettingsScreenBodyCategoryItemBlack,
          text: special_place,
        ),
      ),
      RichText(
        text: TextSpan(
          style: matSettingsScreenBodyCategoryItemBlack,
          text: park,
        ),
      ),
      RichText(
        text: TextSpan(
          style: matSettingsScreenBodyCategoryItemBlack,
          text: museum,
        ),
      ),
      RichText(
        text: TextSpan(
          style: matSettingsScreenBodyCategoryItemBlack,
          text: cafe,
        ),
      ),
    ];

    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkboxButtons[i] = !checkboxButtons[i];
                  });
                },
                child: Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4cAF50).withOpacity(0.15),
                  ),
                  child: SvgPicture.asset(pictures[i], fit: BoxFit.scaleDown),
                ),
              ),
              Positioned(
                right: -11,
                bottom: -11,
                child: CircularCheckBox(
                  activeColor: Colors.black,
                  value: checkboxButtons[i],
                  onChanged: (currentValue) {
                    setState(() {
                      checkboxButtons[i] = currentValue;
                    });
                  },
                ),
              ),
            ],
          ),
          footers[i],
        ],
      ),
    );
  }

  RangeValues values = RangeValues(100, 10000);
  double start = 100;
  double end = 10000;
  String quantuty = "";

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, mySights);
              },
              icon: Icon(Icons.arrow_back_ios_outlined),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < checkboxButtons.length; i++)
                      clearAll(i);
                  });
                },
                child: RichText(
                  text: TextSpan(
                    style: matSettingsScreenAppBarGreen,
                    text: clear_all,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 40,
                        maxHeight: MediaQuery.of(context).size.height / 3),
                    child: GridView.count(
                      scrollDirection: orientation == Orientation.portrait
                          ? Axis.vertical
                          : Axis.horizontal,
                      shrinkWrap: true,
                      crossAxisCount:
                          orientation == Orientation.portrait ? 3 : 1,
                      children: [
                        for (int i = 0; i < checkboxButtons.length; i++)
                          addFilter(i),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: App.isDarkTheme
                                ? matSettingsScreenBody
                                : matSettingsScreenBodyBlack,
                            text: distance,
                          ),
                        ),
                        Spacer(),
                        RichText(
                          text: TextSpan(
                            style: App.isDarkTheme
                                ? matSettingsScreenBody
                                : matSettingsScreenBodyBlack,
                            text: "От ${start} до ${end} км.",
                          ),
                        ),
                      ],
                    ),
                  ),
                  RangeSlider(
                    values: values,
                    divisions: 10,
                    min: 100,
                    max: 10000,
                    onChanged: (RangeValues currentValue) {
                      setState(() {
                        values = currentValue;
                      });
                    },
                    onChangeStart: (RangeValues startData) {
                      setState(() {
                        start = values.start.roundToDouble() / 1000;
                      });
                    },
                    onChangeEnd: (RangeValues endData) {
                      setState(() {
                        end = values.end.roundToDouble() / 1000;

                        names.clear();
                        getCoords(sight, start, end);
                      });
                    },
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                        physics: Platform.isAndroid
                            ? ClampingScrollPhysics()
                            : BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          for (var name in names)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, bottom: 8),
                              child: name,
                            ),
                        ]),
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                right: 10,
                left: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, mySights);
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
                        text: show,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
