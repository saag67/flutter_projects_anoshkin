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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        title: Row(
          children: [
            FlatButton(
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
            Spacer(
              flex: 1,
            ),
            RichText(
              text: TextSpan(
                style: matAddNewSightHeaderBlack,
                text: new_sight_header,
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Divider(),
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
                    //New  sight name=============================================
                    child: TextFormField(
                      controller: textControllerSightName,
                      autofocus: true,
                      enabled: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          borderSide: BorderSide(color: Colors.lightGreen),
                        ),
                      ),
                      focusNode: sightName,
                      onFieldSubmitted: (term) {
                        newSight.name = textControllerSightName.text;
                        sightName.unfocus();
                        FocusScope.of(context).requestFocus(latSight);
                      },
                    ),
                  ),
                ),
                SizedBox(
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
                    Spacer(
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
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                //horizontal forms================================================
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
                        //latitude================================================
                        child: TextFormField(
                          controller: textControllerLat,
                          focusNode: latSight,
                          enabled: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              borderSide: BorderSide(color: Colors.lightGreen),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                textControllerLat.clear();
                              },
                            ),
                          ),
                          onFieldSubmitted: (term) {
                            newSight.lat = textControllerLat.text;
                            FocusScope.of(context).requestFocus(lonSight);
                            //latSight.unfocus();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
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
                        //longetude===============================================
                        child: TextFormField(
                          controller: textControllerLon,
                          enabled: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              borderSide: BorderSide(color: Colors.lightGreen),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                textControllerLon.clear();
                              },
                            ),
                          ),
                          focusNode: lonSight,
                          onFieldSubmitted: (term) {
                            newSight.lon = textControllerLon.text;
                            FocusScope.of(context)
                                .requestFocus(sightDescription);
                          },
                        ),
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
                    //description================================================
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          borderSide: BorderSide(color: Colors.lightGreen),
                        ),
                      ),
                      focusNode: sightDescription,
                    ),
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
