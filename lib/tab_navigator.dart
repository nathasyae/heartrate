import 'package:flutter/material.dart';
import 'package:heartrate/app.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/programs.dart';
// import 'package:heartrate/bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child ;
    if(tabItem == "Page1")
      child = Programs();
    else if(tabItem == "Page2")
      child = checkHeartRate(useruid: '4LuhSXvV9MMJJA3i3ocWbZNTCVn2');
    else if(tabItem == "Page3")
      child = Profile(uid: '4LuhSXvV9MMJJA3i3ocWbZNTCVn2',email: 'nathasya.eliora@ui.ac.id');

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child
        );
      },
    );
  }
}