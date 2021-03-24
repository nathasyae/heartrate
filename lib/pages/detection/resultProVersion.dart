import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'package:heartrate/pages/consultation.dart';
import 'package:heartrate/pages/programs.dart';
import 'package:intl/intl.dart';


class ResultProVersion extends StatefulWidget {
  ScreeningData screeningData;

  ResultProVersion({Key key, this.screeningData}) : super(key: key);

  @override
  ResultProVersionState createState() => new ResultProVersionState();
}

class ResultProVersionState extends State<ResultProVersion> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analysis Detail", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white,),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          // Checked in Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Checked on:", style: TextStyle(fontSize: 16)),

                  Text(DateFormat('yyyy-MM-dd – kk:mm').format(widget.screeningData.checkedDateTime).toString(), style: TextStyle(fontSize: 16)),
                ],
              ),
              Image(image: AssetImage('assets/images/reviewed_chip.png'), width: 120,),
            ],
          ),
          SizedBox(height: 10),

          // Summary
          Card(
            child:
            Container(
              padding: EdgeInsets.all(20),
              child:
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        children: [
                          Text("Avg. Heart Rate", style: TextStyle(fontSize: 18)),
                          RichText(
                            text: TextSpan(
                                text: widget.screeningData.bpm.toString(),
                                style: TextStyle(color: Colors.red, fontSize: 40.0, fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(text: ' BPM',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),
                                  )
                                ]
                            ),
                          ),
                          Text("HIGH", style: TextStyle(letterSpacing: 4.0),),
                        ]
                    ),
                    VerticalDivider(
                        thickness: 1,
                        width: 30,
                        color: Colors.grey),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Heart Rythm", style: TextStyle(fontSize: 18)),
                          SizedBox(height: 15,),
                          Text(widget.screeningData.finalEvaluation.toUpperCase(), style: TextStyle(letterSpacing: 1, fontSize: 18), textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Text("Pre-condition Analysis", style: TextStyle(fontSize: 24),),
          SizedBox(height: 5),
          Card(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Physical Condition and Status", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Weight  : " + widget.screeningData.weight.toString() + " kg"),
                  Text("Height  : " + widget.screeningData.height.toString() + " cm"),
                  Text("BMI       : " + widget.screeningData.weight.toString() + " ("+widget.screeningData.bmiStatus+")"),
                  SizedBox(height: 15),
                  Text("Analysis", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.screeningData.detailAnalysis),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          Text("Recommendation", style: TextStyle(fontSize: 24)),
          SizedBox(height: 5),
          Card(
            child:
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(widget.screeningData.consultText),
                  SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      child: Text("Consult with Doctor", style: TextStyle(fontSize: 16.0)),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Consultation())
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(10.0),
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(widget.screeningData.preventionText),
                  SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      child: Text("Start your healthy life today", style: TextStyle(fontSize: 16.0)),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Programs())
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(10.0),
                          primary: Colors.red,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          Text("Get Full Report", style: TextStyle(fontSize: 24)),
          SizedBox(height: 5),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text("Download full report", style: TextStyle(fontSize: 16.0)),
                  onPressed: (){},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      primary: Colors.red,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}