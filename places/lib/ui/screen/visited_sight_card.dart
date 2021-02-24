import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

///класс виджета-карточки посещенного места

class VisitedSightCard extends SightCard {
  final Sight sight;

  VisitedSightCard(this.sight) : super(sight);

  @override
  Widget buttonBar() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
          onPressed: () {
            print("Shared");
          },
        ),
        IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {
            print("Canceled");
          },
        )
      ],
    );
  }
}
