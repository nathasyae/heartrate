import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/programs.dart';

class BottomNavPage extends StatefulWidget {

  @override
  _BottomNavPageState createState() {
    return _BottomNavPageState();
  }
}

class _BottomNavPageState extends State<BottomNavPage> {

  int _selectedTabIndex = 1;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      Programs(),
      checkHeartRate(),
      Profile(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
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