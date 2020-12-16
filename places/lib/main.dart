import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fundamential",
      home: MyFirstWidget(
          //title: "Fundamential",      //свойство title для Stateful виджета MyHomePage
          ),
    );
  }
}

class MyFirstWidget extends StatelessWidget with ContextType {
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }
    print(
        "Stateless Context: ${getContext()}"); //выводим тип полученного элемента в консоль
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

class _MyHomePageState extends State<MyHomePage> with ContextType {
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }
    print(
        "Context: ${getContext()}"); ////выводим тип полученного элемента в консоль

    return Container(
      child: Center(
        child: Text("Stateful widget"),
      ),
    );
  }
}

mixin ContextType {
  //миксин для исключения дублирования кода, не определяя функцию getContext() в каждом классе
  BuildContext _context;
  getContext() {
    //функция для получения типа элемента
    return _context.runtimeType;
  }
}
