import 'package:flutter/material.dart';

///экран-заглушка для проверки переключения тем в приложении,
///может быть понадобится в будущем

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Map"),
      ),
    );
  }
}
