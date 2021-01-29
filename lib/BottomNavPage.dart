import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/programs.dart';

class BottomNavPage extends StatefulWidget {

  final String useruid;
  final String email;

  const BottomNavPage({Key key, this.useruid, this.email}) : super(key: key);

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
      checkHeartRate(useruid: widget.useruid),
      Profile(uid: widget.useruid, email: widget.email),
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