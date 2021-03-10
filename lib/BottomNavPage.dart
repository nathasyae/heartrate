import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/calendar.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/consultation.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/programs.dart';

class BottomNavPage extends StatefulWidget {

  @override
  _BottomNavPageState createState() {
    return _BottomNavPageState();
  }
}

class _BottomNavPageState extends State<BottomNavPage> {

  int _selectedTabIndex = 2;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      Calendar(),
      Programs(),
      checkHeartRate(),
      Consultation(),
      Profile(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage("assets/images/runnning icon.png")),
        label: 'Routines',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Check',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Consultation'
      ),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/User.png")),
          label: 'Profile'
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
          child: _listPage[_selectedTabIndex]
      ),
      bottomNavigationBar: _bottomNavBar,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //
      //   },
      //   child: ImageIcon(AssetImage("assets/images/User.png")),
      //   text
      //   backgroundColor: Colors.red,
      // ),
    );
  }
}