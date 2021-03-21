import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heartrate/components/button.dart';
import 'package:heartrate/pages/dailyroutines.dart';
import 'package:wakelock/wakelock.dart';
// import 'chart.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'package:flutter/material.dart';

import 'actionBottomSheet.dart';
import 'actionDetail.dart';
import 'finishPage.dart';

class PlanSummary extends StatefulWidget {
  @override
  _PlanSummaryState createState() => _PlanSummaryState();
}

class _PlanSummaryState extends State<PlanSummary> {
  @override
  Widget build(BuildContext context) {
    double cardTitleFontSize = 24;
    double sectionTitleFontSize = 22;
    List<String> actionListName = [
      "Jumping Jack",
      "Wall Sit",
      "Push Up",
      "Abdominal Crunch"
    ];
    List<Widget> widgets = [
      Container(
        // margin: EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActionDetail())
          ),
          child: Image(image: AssetImage('assets/images/workout_card.png')),
        ),
      ),
      SizedBox(width: 10),
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/food_card.png')),
      ),
      SizedBox(width: 10),
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/workout_card.png')),
      ),
      SizedBox(width: 10),
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/food_card.png')),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "7 Minutes Light Cardio", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        bottomSheet: Container(
          child: TextButton(
                child: Text("Stop exercise", style: TextStyle(fontSize: 16.0)),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinishPage())
                ),
          ),
        ),
        body: ListView(
            children: [

              // Dynamic Exercise
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dynamic Light Exercise",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: sectionTitleFontSize,
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                      children: <Widget>[
                        Expanded(
                            child: SizedBox(
                                height: 200.0,
                                child: new ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: widgets,
                                )
                            )
                        ),
                      ]
                  )
              ),

              // Action List
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Action List",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: sectionTitleFontSize,
                  ),
                ),
              ),

              ListTile(
                leading: ImageIcon(AssetImage('assets/images/thumbnailworkout.png')),
                title: Text('Barrackr Obama'),
                trailing: Icon(Icons.check),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Neil Armstrong'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Ivan Ivanovich Ivanov'),
              ),

            ]
        )
    );
  }
}