import 'package:flutter/material.dart';
import 'package:places/res/screens/themes.dart';
import 'package:places/ui/screen/filters_screen.dart';

void main() => runApp(App());

///класс приложения "Список интересных мест"
class App extends StatefulWidget {
  //статическая переменная для переключения тем,
  // темы переключаются путем изменения значения и перезагрузки эмулятора
  static bool isDarkTheme = false;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: App.isDarkTheme ? darkTheme : lightTheme,
        title: "Places",
        home: FiltersScreen(),
      );
    });
  }
}

//класс для перерисовки всего приложения при переключении тем
class AppBuilder extends StatefulWidget {
  final Function(BuildContext) builder;

  const AppBuilder({Key key, this.builder}) : super(key: key);

  @override
  AppBuilderState createState() => new AppBuilderState();

  static AppBuilderState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<AppBuilderState>());
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}
