import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/checkHeartRate.dart';
import 'package:heartrate/pages/profile.dart';
import 'package:heartrate/pages/programs.dart';

class BottomNavPage extends StatefulWidget {

  const BottomNavPage({this.onSignedOut});
  final VoidCallback onSignedOut;

  // final String useruid;
  // final String email;
  //
  // const BottomNavPage({Key key, this.useruid, this.email}) : super(key: key);

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
      Text('Check'),
      Text('Profil'),
      // checkHeartRate(useruid: widget.useruid),
      // Profile(uid: widget.useruid, email: widget.email),
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
    );
  }
}