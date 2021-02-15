import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/res/screens/themes.dart';
import 'package:places/ui/screen/sight_details.dart';

void main() {
  runApp(App());
}

///класс приложения "Список интересных мест"
class App extends StatelessWidget {
  //статическая переменная для переключения тем,
  // темы переключаются путем изменения значения и перезагрузки эмулятора
  static bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? darkTheme : lightTheme,
      title: "Places",
      home: SightDetails(mocks[1]),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Hello"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Stateful widget"),
      ),
    );
  }
}
