import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/text_styles.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightListScreen extends StatefulWidget {
  //класс экрана списка интересных мест
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  Sight sight;

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
            style: textBlack,
          ),
          TextSpan(
            text: "и", //декорируется первая буква строки в желтый цвет
            style: textYellow,
          ),
          TextSpan(
            text: "нтересных мест",
            style: textBlack,
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
      body: SightDetails(), //экран галереи карточек
      //body: SightCard(),//экран карточки
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Запланировать"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "В Избранное")
        ],
      ),
    );
  }
}
