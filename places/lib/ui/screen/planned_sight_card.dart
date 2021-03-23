import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

///класс виджета-карточки планируемых к посещению мест

class PlannedSightCard extends SightCard {
  final Sight sight;
  PlannedSightCard(this.sight) : super(sight);
  @override
  Widget buttonBar() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
