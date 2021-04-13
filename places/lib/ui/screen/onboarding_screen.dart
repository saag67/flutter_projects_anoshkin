import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/main.dart';
import 'package:places/res/colors/colors.dart';
import 'package:places/res/const/const.dart';
import 'package:places/res/strings/strings.dart';
import 'package:places/res/styles/styles.dart';
import 'package:places/ui/screen/home_page_screen.dart';

///класс начального экрана с гайдом по приложению
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    _selectedIndex = index;
  }

  void _onSetCurrentIndicator(int page) {
    setState(() {});
  }

  Widget pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _selectedIndex == i
                ? SvgPicture.asset(current_page_indicator)
                : SvgPicture.asset(page_indicator),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget pageIndicator() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _selectedIndex == i
                  ? SvgPicture.asset(current_page_indicator)
                  : SvgPicture.asset(page_indicator),
            ),
        ],
      );
    }

    Size size = MediaQuery.of(context).size;
    final welcomeScreen = SafeArea(
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
                child: RichText(
                  text: TextSpan(
                    style: matSettingsScreenAppBarGreen,
                    text: skip,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 4,
            ),
            Container(
              width: 80,
              height: 100,
              child: SvgPicture.asset(
                welcome,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: App.isDarkTheme
                      ? matSettingsScreenHeader
                      : matSettingsScreenHeaderBlack,
                  text: welcome_to_guide,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: matSubtitle2Grey,
                  text: search_new_location,
                ),
              ),
            ),
            SizedBox(height: size.height / 7),
            pageIndicator(),
          ],
        ),
      ),
    );

    final createNewRoute = SafeArea(
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
                child: RichText(
                  text: TextSpan(
                    style: matSettingsScreenAppBarGreen,
                    text: skip,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 4,
            ),
            Container(
              width: 80,
              height: 100,
              child: SvgPicture.asset(
                createRoute,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: App.isDarkTheme
                      ? matSettingsScreenHeader
                      : matSettingsScreenHeaderBlack,
                  text: create_new_route,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: matSubtitle2Grey,
                  text: reach_the_goal,
                ),
              ),
            ),
            SizedBox(height: size.height / 7),
            pageIndicator(),
          ],
        ),
      ),
    );

    final addSights = Stack(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 3.25,
              ),
              Container(
                width: 80,
                height: 100,
                child: SvgPicture.asset(
                  add_sight,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: App.isDarkTheme
                        ? matSettingsScreenHeader
                        : matSettingsScreenHeaderBlack,
                    text: add_new_sights,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: matSubtitle2Grey,
                    text: share_sights,
                  ),
                ),
              ),
              SizedBox(height: size.height / 7),
              pageIndicator(),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          right: 10,
          left: 10,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => HomePage(),
                ),
              );
            },
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
                  style: matDetailsButton,
                  text: create_route,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    List<Widget> _screens = [welcomeScreen, createNewRoute, addSights];

    return Scaffold(
      body: PageView.builder(
        itemCount: _screens.length,
        itemBuilder: (context, index) {
          _onPageChanged(index);
          return _screens[_selectedIndex];
        },
        controller: _pageController,
        onPageChanged: _onSetCurrentIndicator,
      ),
    );
  }
}
