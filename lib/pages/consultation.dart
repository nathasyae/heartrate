import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:heartrate/pages/register.dart';
import 'package:intl/intl.dart';

import '../auth.dart';
import 'login.dart';

class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  bool isLoading = true;
  DateTime retrievedDateTime;
  FirebaseAuth auth = FirebaseAuth.instance;
  String stringDateTime = '';
  String email = 'Loading..';
  String uid;
  String msg='';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: Container(
          margin: const EdgeInsets.all(30),
          child: SafeArea(
            child: Column(
              children: [
                Image(image: AssetImage("assets/images/User.png")),
                SizedBox(height:10),
                Text(email),
                SizedBox(height:10),
                FlatButton(
                  minWidth: 200,
                  // color: Colors.red,
                  color: Theme.of(context).backgroundColor,
                  textColor: Colors.black,
                  // textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(10.0),
                  // splashColor: secondaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black),
                    // side: BorderSide(color: Colors.red)
                  ),
                  onPressed: () async {
                    await auth.signOut();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                SizedBox(height:10),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height:20),
                Text("92%", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
                SizedBox(height:5),
                Text("Daily goals achieved this week"),
                SizedBox(height:30),
                Divider(
                  color: Colors.grey,
                ),
                Text("Health Check Record", style: TextStyle(fontSize: 24.0)),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height:10),
                Text(msg),
                isLoading ?
                    new CircularProgressIndicator() :
                StreamBuilder(
                  stream: Firestore.instance.collection("log").where('uiduser', isEqualTo: uid).snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    } else{
                      List<DocumentSnapshot> items = snapshot.data.documents;
                      return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.documents[index];

                          retrievedDateTime = ds["dateTime"].toDate();
                          var formatter = new DateFormat('dd-MM-yyyy hh:mm');
                          stringDateTime = formatter.format(retrievedDateTime);

                          print('retrieved ' + retrievedDateTime.toString());

                          print('datetime ' + ds['dateTime'].toString());
                          return new Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                  children: [
                                    Column(
                                      children: [
                                      Text(ds["heartCondition"]),
                                      Text(stringDateTime, style: TextStyle(fontSize: 14.0)),
                                    ]),
                                    SizedBox(width: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.favorite, size:10, color: Colors.red),
                                        Text(ds["avgBPM"].toInt().toString(),
                                            style: TextStyle(fontSize: 24.0)),
                                        Text(" BPM",
                                            style: TextStyle(fontSize: 16.0))
                                      ]
                                    ),
                                ]
                              )
                            )
                          );
                        }
                      );
                    }
                  }
                )
              ],
            )
          ),
        ),
      )
      )
    );
  }

  void signOut() async {
    await auth.signOut();
  }

  void getData() async {
    FirebaseUser user = await auth.currentUser();
    setState(() {
      uid = user.uid;
      email = user.email;
      isLoading = false;
    });
  }
}
