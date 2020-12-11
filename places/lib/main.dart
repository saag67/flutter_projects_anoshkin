import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: new AppBar(),
        body:
            MyHomePage()), //Такое решение вынужденное, потому как набор виджетов был ограничен ТЗ,
    //При подстановке в body: MyFirstWidget() с указанием типа переменной final int _statlessCounter
    //проект будет крашится при попытке изменить ее значение, при установке типа int виджет будет пересоздаваться
    //При подстановке виджета MyHomePage() при hotreload будет вызван метод setState, который увеличит значение счетчика,
    //изменив состояние виджета, не пересоздавая его заново.
  ));
}

class MyFirstWidget extends StatelessWidget {
  // This widget is the root of your application.
  int _statelessCounter = 0;
  //не указан тип final int только для того чтобы можно было запустить проект в эмуляторе
  //с его указанием, что правильно, проект крашился, ибо есть попытка изменить значение в виджете Text
  @override
  Widget build(BuildContext context) {
    _statelessCounter++;
    print("Method stateless build: $_statelessCounter");
    return Container(
      //MyHomoPage(title: "Stateful Widget)
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
  int _statefulCounter = 0;

  void _incrementCounter() {
    setState(() {
      _statefulCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _incrementCounter();
    print("Method stateful build: $_statefulCounter");

    return Container(
      child: Center(
        child: Text("Stateful widget"),
      ),
    );
  }
}
