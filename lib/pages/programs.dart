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

class Programs extends StatefulWidget {
  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Programs> {

  @override
  Widget build(BuildContext context) {
    double cardTitleFontSize = 24;
    double sectionTitleFontSize = 22;
    List<Widget> widgets = [
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/workout_card.png')),
      ),
      SizedBox(width:10),
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/food_card.png')),
      ),
      SizedBox(width:10),
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/workout_card.png')),
      ),
      SizedBox(width:10),
      Container(
        // margin: EdgeInsets.all(15),
        child: Image(image: AssetImage('assets/images/food_card.png')),
      ),
    ];

    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: new ListView(
                  scrollDirection: Axis.vertical, // =================================== ROOT COLUMN BEGINS=====<<<
                  children: <Widget>[
                    SizedBox(height: 50),

                    // ============ #1 CARD BEGINS

                    Container(
                      margin: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DailyRoutines())
                        ),
                        child: Image(image: AssetImage('assets/images/routine_card.png')),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Browse All Programs",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Row( //<<<<<============ #2 CARD ROW BEGINS HERE
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: new ListView(
                                scrollDirection: Axis.horizontal,
                                children: widgets,
                              )
                            )
                          )
                          // ======= #2-1st COL BEGINS=====

                        ],
                      ), //<<<<<============ #2 CARD ROW ENDS HERE
                    ),
                    // <<<===================#3 ARTICLES SECTION BEGINS HERE
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Articles",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(15),
                      child: Image(image: AssetImage('assets/images/article_card.png')),
                    ),

                    // <<<===================#3 ENDS OF ARTICLES SECTION
                  ],
                ),
              // =================================== ROOT COLUMN ENDS=====<<<
              ),
            ),
          ],
        ),
      );
    }
  doNothing(){}

}