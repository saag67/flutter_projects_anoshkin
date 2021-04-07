import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/ui/screen/filters_screen.dart';

///виджет-поле поиска
class SearchBar extends StatefulWidget {
  bool enabled = false;
  SearchBar(this.enabled, {Key key, this.onChange, this.getSights})
      : super(key: key);
  Function(String) onChange;
  Function(List<Sight>) getSights;
  List<Sight> sights = [];

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width * 0.95;

    return Container(
      width: width1,
      child: Center(
        child: TextField(
          onSubmitted: (String text) {
            widget.onChange(controller.text);
          },
          controller: controller,
          autofocus: true,
          enabled: this.widget.enabled,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            fillColor: App.isDarkTheme ? dmSecondaryBlack : lmPrimaryColor,
            filled: true,
            hintText: search,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            prefixIcon: SvgPicture.asset(
              search_icon,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: IconButton(
              onPressed: () async {
                widget.sights = await Navigator.push(
                  context,
                  MaterialPageRoute<List<Sight>>(
                    builder: (context) => FiltersScreen(),
                  ),
                );

                setState(() {});

                widget.getSights(widget.sights);
              },
              icon: SvgPicture.asset(
                filter_icon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
