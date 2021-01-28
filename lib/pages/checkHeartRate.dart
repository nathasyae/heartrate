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
import 'package:heartrate/pages/measuring.dart';

class checkHeartRate extends StatefulWidget {
  @override
  checkHeartRateView createState() {
    return checkHeartRateView();
  }
}

class checkHeartRateView extends State<checkHeartRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Text("Start Health Check",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              iconSize: 128,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Measuring()),
              );
              }
            ),

        ]
        )
      )
    )
    );
  }

}