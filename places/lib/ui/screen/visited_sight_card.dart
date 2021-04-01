import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

///класс виджета-карточки посещенного места

class VisitedSightCard extends SightCard {
  final Sight sight;
  Function(int index) onCancel;
  VisitedSightCard(this.sight, {Key key, this.onCancel})
      : super(sight, key: key);

  int get index => null ?? 0;

  @override
  Widget buttonBar() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () {
            onCancel(index);
          },
        )
      ],
    );
  }
}
