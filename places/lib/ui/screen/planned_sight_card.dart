import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/ui/screen/sight_card.dart';

///класс виджета-карточки планируемых к посещению мест

class PlannedSightCard extends SightCard {
  final Sight sight;

  Function(int index) onCancel;
  PlannedSightCard(this.sight, {Key key, this.onCancel})
      : super(sight, key: key);

  int get index => null ?? 0;
  DateTime dateTime = DateTime.now();

  @override
  Widget buttonBar(BuildContext context) {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          onPressed: () async {
            if (Platform.isIOS) {
              await showCupertinoModalPopup<Widget>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: lmPrimaryColor,
                      height: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: CupertinoDatePicker(
                                initialDateTime: dateTime,
                                mode: CupertinoDatePickerMode.dateAndTime,
                                onDateTimeChanged: (DateTime newDateTime) {
                                  dateTime = newDateTime;
                                }),
                            height: 280,
                          ),
                        ],
                      ),
                    );
                  });
            }
            await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (BuildContext context, Widget child) {
                  return App.isDarkTheme
                      ? Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: lmSettingScreenAppBarButton,
                            ),
                          ),
                          child: child,
                        )
                      : Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: lmSettingScreenAppBarButton,
                            ),
                            buttonTheme: ButtonThemeData(
                                colorScheme: ColorScheme.light(
                              primary: Colors.green,
                            )),
                          ),
                          child: child,
                        );
                  // return MediaQuery(
                  //     data: MediaQuery.of(context)
                  //         .copyWith(alwaysUse24HourFormat: false),
                });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {
            onCancel(index);
          },
        )
      ],
    );
  }
}
