import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/checkHeartRate.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() {
    return _BottomNavPageState();
  }
}

class _BottomNavPageState extends State<BottomNavPage> {

  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      Text('Program'),
      checkHeartRate(),
      // Text('Check'),
      Text('Profil'),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Program',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Check',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
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
    );
  }
}