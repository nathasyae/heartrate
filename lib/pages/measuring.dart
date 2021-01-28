import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/pages/result.dart';
import 'package:wakelock/wakelock.dart';
// import 'chart.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'package:flutter/material.dart';

class Measuring extends StatefulWidget {
  @override
  MeasuringView createState() {
    return MeasuringView();
  }
}

class MeasuringView extends State<Measuring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(30),
          child:
        SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Measuring...",
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("1. Put your phone on the table with the camera lens facing upward.",
                      style: mainTheme.textTheme.bodyText1),
                  SizedBox(height: 20),
                  Text("2. Place your finger on the camera lens, keep relax, and wait until the flash turned off.",
                      style: mainTheme.textTheme.bodyText2),
                  FlatButton(
                      minWidth: 250,
                      color: Colors.red,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      splashColor: secondaryRed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Result()),
                        );
                      },
                    child: Text(
                    "Next",
                    style: TextStyle(fontSize: 16.0),
                    ),
                    ),
                ]
            )
        )
        )
    );
  }

}