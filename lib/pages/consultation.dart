import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:heartrate/models/Doctor.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/auth/register.dart';
import 'package:intl/intl.dart';

import '../auth.dart';
import 'auth/login.dart';

class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://cardiwatch-core-frontendapi.azurewebsites.net/api/doctor/all"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Consult with Doctor", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white),
      body: Container(
        margin: EdgeInsets.all(10),
        child:
        new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
                onTap: ()=>{},
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                child:
                Padding(
                  padding: EdgeInsets.all(20),
                  child:
                  Column(
                    children: [
                      Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(data[index]["url"] ?? "https://previews.123rf.com/images/leungchopan/leungchopan1404/leungchopan140401233/27745862-asia-doctor.jpg")),
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text('dr. ' + data[index]["name"],
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                                Text(data[index]["specialization"]),
                              ],
                            ),
                          ]
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(const IconData(0xea22, fontFamily: 'MaterialIcons'), size: 16, color: Colors.orange),
                                Text(data[index]["rating"].toString(),
                                    style: TextStyle(fontSize: 14)),
                                SizedBox(width: 10),
                                Icon(const IconData(0xe63e, fontFamily: 'MaterialIcons'), size: 16),
                                Text(data[index]["years"].toString() + ' years',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            Text('\$' + data[index]["price"].toInt().toString(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                          ]
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


