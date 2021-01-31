import 'package:heartrate/pages/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/dailyroutines.dart';
import 'package:heartrate/pages/measuring.dart';
import 'package:heartrate/pages/programs.dart';
import 'package:heartrate/pages/register.dart';
import 'package:heartrate/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/symptomps.dart';

import 'BottomNavPage.dart';
import 'homePage.dart';
import 'models/User.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// void main() {
//   runApp(MyApp());
// }

class MyAppBr extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);

  PersistentTabController _controller = PersistentTabController(initialIndex:1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
    curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
    animateTabTransition: true,
    curve: Curves.ease,
    duration: Duration(milliseconds: 200),
    ),
    navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }


  List<Widget> _buildScreens() {
    return [
      Programs(),
      checkHeartRate(),
      Profile(),
    ];
  }

}


List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: ImageIcon(
          AssetImage("assets/images/runnning icon.png")),
      title: 'Routines',
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.favorite),
      title: 'Check',
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: ImageIcon(
          AssetImage("assets/images/User.png")),
      title: 'Profile',
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
    ),
  ];
}



