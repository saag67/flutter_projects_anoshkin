import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

///Класс экрана настроек приложения
class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var isValue = false;

  Widget onSwitchValueChanged(bool currentValue) {
    setState(() {
      isValue = currentValue;
      App.isDarkTheme = !App.isDarkTheme;
      AppBuilder.of(context).rebuild();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Center(
          child: RichText(
            text: TextSpan(
              style: App.isDarkTheme
                  ? matSettingsScreenHeader
                  : matSettingsScreenHeaderBlack,
              text: settings,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: App.isDarkTheme
                        ? matSettingsScreenBody
                        : matSettingsScreenHeaderBlack,
                    text: dark_theme,
                  ),
                ),
                Spacer(),
                Switch(
                    value: isValue,
                    onChanged: (currentValue) {
                      onSwitchValueChanged(currentValue);
                    }),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: App.isDarkTheme
                        ? matSettingsScreenBody
                        : matSettingsScreenHeaderBlack,
                    text: man_tutorial,
                  ),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      //print("printed Manual");
                    }),
              ],
            ),
          ),
        ],
      ),
      //bottomNavigationBar: NavigationBar(),
    );
  }
}
