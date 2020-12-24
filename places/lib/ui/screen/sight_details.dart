import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SightDetails extends StatelessWidget with Mocks {
  //класс экрана-галереи интересных мест с применением миксина, так проще доступ к объектам типа Sight
  Sight sight;

  Widget details(sight) {
    return Container(
      //контейнер для одиночного превью
      child: Column(
        //выстраиваем контейнеры по вертикали
        crossAxisAlignment: CrossAxisAlignment
            .stretch, //растягиваем их во весь экран по горизонтали
        children: [
          Container(
              //контейнер для картинки и кнопки
              margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              color: Colors.grey,
              height: 150,
              child: Stack(
                children: [
                  Text("Image"),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      //контейнер, имитирующий кнопку-сердечко, позиционируется в верхнем правом углу превью
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              )),
          Container(
            //контейнер для детальной информации интересного места
            margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
            padding: EdgeInsets.all(10),
            color: Colors.lightBlue,
            height: 150,
            child: RichText(
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Наименование: ${sight.name}\n",
                    ),
                    TextSpan(
                      text: "Координаты: ${sight.lon}, ${sight.lat}\n",
                    ),
                    TextSpan(
                      text: "Сайт: ${sight.url}\n",
                    ),
                    TextSpan(
                      text: "Описание: ${sight.details}\n",
                    ),
                    TextSpan(
                      text: "Тип: ${sight.type}\n",
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          details(
              gelendzhik), //вызов функции с отдельным интересным местом в виде параметра
          details(
              bora_bora), //вызов функции с отдельным интересным местом в виде параметра
          details(
              formentera), //вызов функции с отдельным интересным местом в виде параметра
        ],
      ),
    );
  }
}
