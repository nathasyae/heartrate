// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:heartrate/pages/checkHeartRate.dart';
// import 'package:heartrate/pages/profile.dart';
// import 'package:heartrate/pages/programs.dart';
//
//
// class CustomNavigation extends StatefulWidget {
//   CustomNavigation({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _CustomNavigationState createState() => _CustomNavigationState();
// }
//
// class _CustomNavigationState extends State<CustomNavigation> {
//   // Custom navigator takes a global key if you want to access the
//   // navigator from outside it's widget tree subtree
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // Here's the custom scaffold widget
//     // It takes a normal scaffold with mandatory bottom navigation bar
//     // and children who are your pages
//     return CustomScaffold(
//       scaffold: Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           items: _items,
//         ),
//       ),
//
//       // Children are the pages that will be shown by every click
//       // They should placed in order such as
//       // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
//       children: <Widget>[
//         Programs(),
//         checkHeartRate(),
//         Profile(),
//       ],
//
//       // Called when one of the [items] is tapped.
//       onItemTap: (index) {},
//     );
//   }
//
//   final _items = [
//     BottomNavigationBarItem(
//       icon: ImageIcon(
//           AssetImage("assets/images/runnning icon.png")),
//       label: 'Routines',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.favorite),
//       label: 'Check',
//     ),
//     BottomNavigationBarItem(
//         icon: ImageIcon(
//             AssetImage("assets/images/User.png")),
//         label: 'Profile'
//     ),
//   ];
// }