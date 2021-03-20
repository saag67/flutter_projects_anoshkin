import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/search_bar.dart';
import 'package:places/ui/screen/sight_details.dart';

///экран поиска интересного места
class SightSearchScreen extends StatefulWidget {
  Sight sight;

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  bool isSearched = false;

  bool enabled = true;

  //список для отображения найденных мест
  List<Sight> items = [];
  //список для получения отфильтрованных по расстоянию мест из FiltersScreen class'a
  List<Sight> mySights = [];
  //текущий список, в него загружаются данные в зависимости производилась фильтрация мест или нет
  List<Sight> currentList = [];

  Widget searchEngine(String string) {
    items.clear();

    if (mySights.isNotEmpty) {
      currentList.clear();
      currentList.addAll(mySights);
    } else {
      currentList.clear();
      currentList.addAll(mocks);
    }

    for (int i = 0; i < currentList.length; i++) {
      if (currentList[i].name.contains(RegExp(string, caseSensitive: false))) {
        items.add(currentList[i]);

        isSearched = true;
      } else {
        setState(() {
          isSearched = false;
        });
      }
    }
  }

  Widget searchedItem(Sight sight, int index) {
    return ListTile(
      trailing: IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: () {
          setState(() {
            items.removeAt(index);
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (context) => SightDetails(sight),
          ),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            sight.url,
            width: 56,
            height: 56,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : const Center(
                      child: RefreshProgressIndicator(),
                    );
            },
          ),
        ),
      ),
      title: RichText(
        text: TextSpan(
            style: App.isDarkTheme
                ? matSearchScreenResult
                : matSearchScreenResultBlack,
            text: sight.name),
      ),
      subtitle: RichText(
        text: TextSpan(
          style: App.isDarkTheme ? matSubtitle2light : matSubtitle2Grey,
          text: sight.type,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String text;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: App.isDarkTheme
                                ? dmSecondaryBlack
                                : lmPrimaryColor,
                          ),
                          child: const Icon(Icons.arrow_back_ios_outlined),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Expanded(
                    flex: 3,
                    child: RichText(
                      text: TextSpan(
                        text: list_of_interesting_sights,
                        style: App.isDarkTheme
                            ? matAddNewSightHeader
                            : matAddNewSightHeaderBlack,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SearchBar(enabled, onChange: (val) {
                setState(() {
                  searchEngine(val);
                });
                //print(result);
              }, getSights: (sights) {
                setState(() {
                  mySights = sights;
                });
              }),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: matSettingsScreenBodyCategoryItemDarkGrey,
                      text: you_were_looking_for,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: isSearched == true
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.startToEnd,
                        key: UniqueKey(),
                        child: searchedItem(items[index], index),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      items.clear();
                      currentList.clear();
                      mySights.clear();
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      style: matSettingsScreenAppBarGreen,
                      text: clear_history,
                    ),
                  ),
                ),
              ],
            )
          : EmptyState(),
    );
  }
}

///виджет-заглушка если поиск не увенчался успем
class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width / 2;
    double height1 = MediaQuery.of(context).size.height / 8;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height1,
          ),
          Container(
            width: 50,
            height: 50,
            child: SvgPicture.asset(
              'res/assets/search_icon.svg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                style: matAddNewSightHeaderGrey,
                text: search_failed,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: RichText(
              text: TextSpan(
                style: matSubtitle2Grey,
                text: change_conditions,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///Экран-заглушка в случае потери соединения
class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width / 2;
    double height1 = MediaQuery.of(context).size.height / 8;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height1,
          ),
          Container(
            width: 50,
            height: 50,
            child: SvgPicture.asset(
              'res/assets/wifi_off-24px.svg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                style: matAddNewSightHeaderGrey,
                text: no_connection,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: RichText(
              text: TextSpan(
                style: matSubtitle2Grey,
                text: check_connection,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
