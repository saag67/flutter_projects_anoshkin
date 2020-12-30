import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/text_styles.dart';

//класс экрана-галереи интересных мест с применением миксина, так проще доступ к объектам типа Sight
class SightDetails extends StatelessWidget with Mocks {
  Sight sight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDetails(mocks[
              0]), //вызов функции с отдельным интересным местом в виде параметра
          buildDetails(mocks[
              1]), //вызов функции с отдельным интересным местом в виде параметра
          buildDetails(mocks[
              2]), //вызов функции с отдельным интересным местом в виде параметра
        ],
      ),
    );
  }

  Widget buildDetails(Sight sight) {
    return Container(
      //контейнер для одиночного превью
      child: Column(
        //выстраиваем контейнеры по вертикали
        crossAxisAlignment: CrossAxisAlignment
            .stretch, //растягиваем их во весь экран по горизонтали
        children: [
          Container(
            //контейнер для картинки и кнопки
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero),
            ),
            margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    //контейнер, имитирующий кнопку-сердечко, позиционируется в верхнем правом углу превью
                    child: Icon(Icons.favorite_border),

                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Container(
            //контейнер для детальной информации интересного места
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
            padding: EdgeInsets.all(10),

            height: 150,
            child: RichText(
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
              text: TextSpan(
                style: textBlack,
                children: [
                  TextSpan(
                    text: "Категория: ${sight.type}\n",
                  ),
                  TextSpan(
                    text: "Наименование: ${sight.name}\n",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
