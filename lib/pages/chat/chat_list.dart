// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
//
// class ChatScreen extends StatefulWidget {
//   final String currentUserId;
//
//   ChatScreen({Key key, @required this.currentUserId}) : super(key: key);
//
//   @override
//   State createState() => ChatScreenState(currentUserId: currentUserId);
// }
//
// class ChatScreenState extends State<ChatScreen> {
//   ChatScreenState({Key key, @required this.currentUserId});
//
//   final String currentUserId = '4LuhSXvV9MMJJA3i3ocWbZNTCVn2';
//   final ScrollController listScrollController = ScrollController();
//
//   int _limit = 20;
//   int _limitIncrement = 20;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     listScrollController.addListener(scrollListener);
//   }
//
//
//   void scrollListener() {
//     if (listScrollController.offset >= listScrollController.position.maxScrollExtent &&
//         !listScrollController.position.outOfRange) {
//       setState(() {
//         _limit += _limitIncrement;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MAIN',
//           style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: WillPopScope(
//         child: Stack(
//           children: <Widget>[
//             // List
//             Container(
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance.collection('users').limit(_limit).snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
//                       ),
//                     );
//                   } else {
//                     return ListView.builder(
//                       padding: EdgeInsets.all(10.0),
//                       itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
//                       itemCount: snapshot.data.documents.length,
//                       controller: listScrollController,
//                     );
//                   }
//                 },
//               ),
//             ),
//
//             // Loading
//             Positioned(
//               child: isLoading ? const Loading() : Container(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildItem(BuildContext context, DocumentSnapshot document) {
//     if (document.data()['id'] == currentUserId) {
//       return Container();
//     } else {
//       return Container(
//         child: FlatButton(
//           child: Row(
//             children: <Widget>[
//               Material(
//                 child: document.data()['photoUrl'] != null
//                     ? CachedNetworkImage(
//                   placeholder: (context, url) => Container(
//                     child: CircularProgressIndicator(
//                       strokeWidth: 1.0,
//                       valueColor: AlwaysStoppedAnimation<Color>(themeColor),
//                     ),
//                     width: 50.0,
//                     height: 50.0,
//                     padding: EdgeInsets.all(15.0),
//                   ),
//                   imageUrl: document.data()['photoUrl'],
//                   width: 50.0,
//                   height: 50.0,
//                   fit: BoxFit.cover,
//                 )
//                     : Icon(
//                   Icons.account_circle,
//                   size: 50.0,
//                   color: greyColor,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                 clipBehavior: Clip.hardEdge,
//               ),
//               Flexible(
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         child: Text(
//                           'Nickname: ${document.data()['nickname']}',
//                           style: TextStyle(color: primaryColor),
//                         ),
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
//                       ),
//                       Container(
//                         child: Text(
//                           'About me: ${document.data()['aboutMe'] ?? 'Not available'}',
//                           style: TextStyle(color: primaryColor),
//                         ),
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
//                       )
//                     ],
//                   ),
//                   margin: EdgeInsets.only(left: 20.0),
//                 ),
//               ),
//             ],
//           ),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => Chat(
//                       peerId: document.id,
//                       peerAvatar: document.data()['photoUrl'],
//                     )));
//           },
//           color: greyColor2,
//           padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         ),
//         margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
//       );
//     }
//   }
// }
