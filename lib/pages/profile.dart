import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:heartrate/pages/register.dart';

class Profile extends StatefulWidget {
  final String uid;
  final String email;

  const Profile(
      {this.uid, this.email});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoad = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    // loadFormData();

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
                Icon(Icons.person, size: 100),
                Text(widget.email),
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
                SizedBox(height:20),
                Text("92%", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
                SizedBox(height:5),
                Text("Daily goals achieved this week"),
                SizedBox(height:30),
                Text("Health Check Record", style: TextStyle(fontSize: 24.0)),
                SizedBox(height:10),
                StreamBuilder(
                  stream: Firestore.instance.collection("log").where('useruid', isEqualTo: widget.uid).snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Text('No Data...');
                    } else{
                      List<DocumentSnapshot> items = snapshot.data.documents;
                      return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.documents[index];
                          return new Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                  children: [
                                    Column(
                                      children: [
                                      Text(ds["heartCondition"]),
                                        Text('tanggal'),
                                    ]),
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


  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  getData() async{
    String userId = (await FirebaseAuth.instance.currentUser()).uid;
    return Firestore.instance.collection('users').document(userId);
  }

  // Future loadFormData() async {
  //   final DocumentReference document =
  //   Firestore.instance.collection('log').document(widget.uid);
  //   await document.get().then((datasnapshot) {
  //     if (datasnapshot.exists) {
  //       setState(() {
  //         dataUser = db.userDataFromSnapshot(datasnapshot);
  //         email = datasnapshot.data['email'];
  //         // isLoadDone = true;
  //       });
  //     }
  //   });
  // }
}
