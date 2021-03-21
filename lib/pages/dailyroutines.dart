import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heartrate/BottomNavPage.dart';
import 'package:heartrate/components/button.dart';
import 'package:heartrate/pages/workout/planSummary.dart';
import 'package:wakelock/wakelock.dart';
// import 'chart.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'package:flutter/material.dart';

class DailyRoutines extends StatefulWidget {
  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<DailyRoutines> {

  Map<String, bool> values = {
    '7 Minutes warming up': false,
    '7 Minutes skip rope': false,
    '7 Minutes cooling down': false,
  };

  @override
  Widget build(BuildContext context) {
    double cardTitleFontSize = 24;
    double sectionTitleFontSize = 22;
    print('daily');

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: new ListView(
                scrollDirection: Axis.vertical, // =================================== ROOT COLUMN BEGINS=====<<<
                children: <Widget>[

                  SizedBox(height:30),

                  // Title 1: Morning
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Exercise Session",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: sectionTitleFontSize,
                      ),
                    ),
                  ),

                  // CARD 1: workout
                  Container(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlanSummary())
                      ),
                      child: Image(image: AssetImage('assets/images/7mincard.png')),
                    ),
                  ),

                  // Title 2: Audio Session
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Audio Session",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: sectionTitleFontSize,
                      ),
                    ),
                  ),

                  // CARD 2
                  Container(
                      // margin: EdgeInsets.all(15),
                      child: Image(image: AssetImage('assets/images/audio_card.png')),
                  ),

                  // CARD 3 : Subscribe
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 200,
                    width: double.maxFinite,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Subscribe to unlock full \n healthy cardiac plans', style: TextStyle(fontSize: 20.0)),
                          SizedBox(height:20),
                          FlatButton(
                            minWidth: 250,
                            color: Colors.red,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(10.0),
                            // splashColor: secondaryRed,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.red)
                            ),
                            onPressed: () {},
                            child: Text(
                              "Subscribe",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),//ink
                    ),
                  ),


                ],

              ),
              // =================================== ROOT COLUMN ENDS=====<<<
            ),
          ),
        ],
      ),
    );
  }

}