import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstWidget());
  
}

class MyFirstWidget extends StatelessWidget {
  // This widget is the root of your application.
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All are widget',

      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text("Hello ${counter++}"),
            ),
          ),
          MyHomePage(title: "Statefull Widget")
        ],
      )
    );

  }
  void display() {
    print(counter);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          child: Center(
            child: Text("Stateful widget", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.7)),
          ),
          
        ),
        RaisedButton(
            onPressed: _incrementCounter,
        child: Text("Press me"),)
      ],
    );

  }
}
