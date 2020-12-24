import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  //класс карточки интересного места
  Sight sight;
  //SightCard(this.sight);
  Widget card() {
    //функция верстки экрана карточки интересного места
    return Column(
      children: [
        Expanded(
          child: Container(
            //контейнер для изображения интересного места
            //margin: EdgeInsets.all(10),
            color: Colors.lightBlue,
          ),
          flex: 2,
        ),
        Expanded(
          flex: 1,
          child: Container(
            //контейнер для описания интересного места
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: "text",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              textAlign: TextAlign.start,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Container(
          //контейнер-кнопка для построения маршрута к интересному месту
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              "построить маршрут",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return card();
  }
}
