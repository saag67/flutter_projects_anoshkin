import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/map_screen.dart';
import 'package:places/ui/screen/sight_category_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

class AddSightScreen extends StatefulWidget {
  AddSightScreen({Key key}) : super(key: key);
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  FocusNode sightName;
  FocusNode latSight;
  FocusNode lonSight;
  FocusNode sightDescription;
  FocusNode createSight;
  final _formkey = GlobalKey<FormState>();

  bool isValid = false;

  @override
  void dispose() {
    sightName.dispose();
    latSight.dispose();
    lonSight.dispose();
    sightDescription.dispose();

    super.dispose();
  }

  final textControllerSightName = TextEditingController();
  final textControllerLat = TextEditingController();
  final textControllerLon = TextEditingController();
  final textControllerDescription = TextEditingController();

  String category;
  String currentCategory = not_selected;
  Sight newSight = Sight('', '', '', '', '', '');

  @override
  void initState() {
    super.initState();
    sightName = FocusNode();
    latSight = FocusNode();
    lonSight = FocusNode();
    sightDescription = FocusNode();
  }

  List<Sight> favoriteSights = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final fieldSightName = TextFormField(
      controller: textControllerSightName,
      autofocus: true,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }

        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
      ),
      focusNode: sightName,
      onFieldSubmitted: (term) {
        newSight.name = textControllerSightName.text;
        sightName.unfocus();
        FocusScope.of(context).requestFocus(latSight);
      },
    );

    final fieldSightLat = TextFormField(
      controller: textControllerLat,
      focusNode: latSight,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }

        return null;
      },
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            textControllerLat.clear();
          },
        ),
      ),
      onFieldSubmitted: (term) {
        newSight.lat = textControllerLat.text;
        FocusScope.of(context).requestFocus(lonSight);
      },
    );

    final fieldSightLon = TextFormField(
      controller: textControllerLon,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }

        return null;
      },
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            textControllerLon.clear();
          },
        ),
      ),
      focusNode: lonSight,
      onFieldSubmitted: (term) {
        newSight.lon = textControllerLon.text;
        FocusScope.of(context).requestFocus(sightDescription);
      },
    );

    final fieldSightDescription = TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }

        return null;
      },
      textInputAction: TextInputAction.done,
      maxLines: 5,
      controller: textControllerDescription,
      onFieldSubmitted: (term) {
        newSight.details = textControllerDescription.text;
        newSight.url =
            "https://3d-maps.kz/files/308/photos/308-1513156681-0806.jpg";
        isValid = _formkey.currentState.validate();
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
      ),
      focusNode: sightDescription,
    );

    Widget previewPhoto(Sight sight, int index) {
      return Dismissible(
        direction: DismissDirection.up,
        key: UniqueKey(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: 72,
                height: 72,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    sight.url,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      favoriteSights.removeAt(index);
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      'res/assets/cancel_white.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final firstItem = Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            favoriteSights.add(mocks[index]);
            if (index < mocks.length - 1) {
              index++;
            } else {
              index = 0;
            }
          });
        },
        child: Container(
          width: 72,
          height: 72,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SvgPicture.asset(
              'res/assets/add_card.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        title: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                  style: matSettingsScreenAppBarBlack,
                  text: cancel,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            RichText(
              text: TextSpan(
                style: matAddNewSightHeaderBlack,
                text: new_sight_header,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      firstItem,
                      for (int i = 0; i < favoriteSights.length; i++)
                        previewPhoto(favoriteSights[i], i),
                    ],
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       firstItem,
                //       for (int i = 0; i < favoriteSights.length; i++)
                //         previewPhoto(favoriteSights[i], i),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                      style: matSettingsScreenBodyCategoryItemBlackNormal,
                      text: category_subtitle,
                    ),
                  ),
                ),
                ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: matSelectCategory,
                        text: currentCategory,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      forwardArrow,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () async {
                      category = await Navigator.push(
                        context,
                        MaterialPageRoute<String>(
                            builder: (context) => SightCategoryScreen()),
                      );
                      currentCategory = category;
                      newSight.type = currentCategory ?? not_selected;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: RichText(
                    text: TextSpan(
                      style: matSettingsScreenBodyCategoryItemDarkGrey,
                      text: name_uppercase,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                  child: Container(
                    width: 328,
                    height: 40,
                    child: fieldSightName,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(
                          style: matSettingsScreenBodyCategoryItemBlackNormal,
                          text: latitude_uppercase,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(
                          style: matSettingsScreenBodyCategoryItemBlackNormal,
                          text: longitude_uppercase,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 156,
                      height: 40,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 10,
                          ),
                          child: fieldSightLat),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Container(
                      width: 156,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 10,
                        ),
                        child: fieldSightLon,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (context) => MapScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: matMap,
                      text: point_on_the_map,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                      style: matSettingsScreenBodyCategoryItemBlackNormal,
                      text: description_uppercase,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                  child: Container(
                    width: 328,
                    height: 80,
                    child: fieldSightDescription,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 10,
              left: 10,
              child: ElevatedButton(
                // key: _formkey,
                onPressed: isValid
                    ? () {
                        mocks.add(newSight);

                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: lmSettingScreenAppBarButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: !isValid ? matSubtitle2 : matSubtitleShow,
                      text: cfreate_uppecase,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
