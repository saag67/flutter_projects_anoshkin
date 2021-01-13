import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';

///класс карточки интересного места
class SightCard extends StatelessWidget {
  final Sight sight;
  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return card();
  }

  Widget card() {
    //функция верстки экрана карточки интересного места
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                //контейнер для изображения интересного места

                color: Colors.lightBlue,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //контейнер для описания интересного места
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: RichText(
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
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
          FlatButton(
            onPressed: () {},
            child: Container(
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
          ),
        ],
      ),
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
}
