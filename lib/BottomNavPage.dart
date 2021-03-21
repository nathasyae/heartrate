import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/calendarScreen.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/consultation.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/programs.dart';
import 'package:heartrate/pages/resultProVersion.dart';

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
      CalendarScreen(),
      Programs(),
      checkHeartRate(),
      // Consultation(),
      ResultProVersion(),
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
          label: 'Check',
          icon: ImageIcon(AssetImage("assets/images/icon-white.png")),
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
      type: BottomNavigationBarType.fixed,
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );

    return Scaffold(
      body: Center(
          child: _listPage[_selectedTabIndex]
      ),
      bottomNavigationBar: _bottomNavBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(
                elevation: 0,
              onPressed: () {
                setState(() {
                  _selectedTabIndex = 2;
                });
              },
              child: ImageIcon(AssetImage("assets/images/icon-white.png"), size: 30,),
              backgroundColor: Colors.red,
      ),
      ),
      );
  }
}