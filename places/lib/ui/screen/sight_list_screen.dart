import 'package:flutter/material.dart';
import 'package:places/styles/text_styles.dart';
import 'package:places/ui/screen/sight_details.dart';

///класс экрана списка интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

///класс состояния экрана списка интересных мест
class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          title: decorateTitle(),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      body: SightDetails(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Запланировать",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "В Избранное",
          ),
        ],
      ),
    );
  }

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
}
