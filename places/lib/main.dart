import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(App());
}

///класс приложения "Список интересных мест"
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Places",
      home: SightListScreen(),
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
