import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  //класс экрана списка интересных мест
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  //класс состояния экрана списка интересных мест
  Widget decorateTitle() {
    //функция декорирующа заголовок AppBar
    return RichText(
      text: TextSpan(
        text: "C", //декорируется первая буква строки в зеленый цвет
        style: TextStyle(
          color: Colors.lightGreen,
          fontSize:
              26, //максимально возможный размер шрифта для AppBar, иначе такст наползает на границы виджета
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: "писок\n",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "и", //декорируется первая буква строки в желтый цвет
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
          TextSpan(
            text: "нтересных мест",
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
      textAlign: TextAlign.start,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            56.0), //установлен максимально возможная высота виджета, ограничение в 56 задано фреймворком
        child: AppBar(
          title: decorateTitle(), //функция возвращающая декорированную строку
          backgroundColor:
              Colors.white, //установка цвета фона основного окна приложения
          elevation: 0.0, //утановлена высота AppBar в 0, тени не отображаются
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Mail")
        ],
      ),
    );
  }
}
