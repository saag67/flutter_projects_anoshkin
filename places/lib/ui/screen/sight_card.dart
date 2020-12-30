import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';

///класс карточки интересного места
class SightCard extends StatelessWidget {
  final Sight sight;
  SightCard(this.sight);

  Widget card() {
    //функция верстки экрана карточки интересного места
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Container(
              //контейнер для изображения интересного места

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
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: "${sight.type}:\n",
                    ),
                    TextSpan(
                      text: "${sight.name}\n",
                    ),
                    TextSpan(
                      text: "${sight.details}\n",
                    ),
                  ],
                ),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return card();
  }
}
