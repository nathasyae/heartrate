import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Profile extends StatefulWidget {
  String uid;

  Profile({this.uid});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
  DateTime retrievedDateTime;
  FirebaseAuth auth = FirebaseAuth.instance;
  String stringDateTime = '';
  String email = 'Loading..';
  String uid;
  String msg='';
  bool isAsyncCall = false;

  List records;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: (records==null) ? Center(child: CircularProgressIndicator()) :
      SingleChildScrollView(
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
                (records!=[]) ?
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: records.length,
                  itemBuilder: (context, index) {

                    return new Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(records[index].finalEvaluation ?? "Not complete"),
                                        Text(DateFormat('dd-MM-yyyy hh:mm').format(records[index].checkedDateTime)
                                            , style: TextStyle(fontSize: 14.0)),
                                      ]),
                                  SizedBox(width: 20),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.favorite, size:10, color: Colors.red),
                                        Text(records[index].bpm.toString(), style: TextStyle(fontSize: 24.0)),
                                        Text(" BPM",
                                            style: TextStyle(fontSize: 16.0))
                                      ]
                                  ),
                                ]
                            )
                        )
                    );
                  }
              ) :
                Text("Belum ada data.")
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
    print("welcome to get data " + widget.uid);

    var response = await http.get(
        Uri.encodeFull("https://cardiwatch-core-frontendapi.azurewebsites.net/api/screening/user-uid/"+widget.uid),
        headers: {
          "Accept": "application/json"
        }
    );

    List result = List<ScreeningData>.from(jsonDecode(response.body).map((x)=> ScreeningData.fromJson(x)));

    setState(() {
      records = result;
    });

    if (response.statusCode == 200) {
      print('RESJSON success');
    } else if (response.statusCode == 400){
      print('RESJSON ' + response.toString());
    } else {
      print('RESJSON fail ' +response.statusCode.toString());
      throw Exception('Failed to load');
    }

  }


}
