import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heartrate/pages/consultation.dart';
import 'package:heartrate/pages/programs.dart';

class ResultProVersion extends StatelessWidget {

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
                  Text("Fri, 06 Feb 2021 at 12:36", style: TextStyle(fontSize: 16)),
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
                                text: '112',
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Heart Rythm", style: TextStyle(fontSize: 18)),
                          Text("NORMAL SINUS RHYTM", style: TextStyle(letterSpacing: 4.0), textAlign: TextAlign.center,),
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
                  Text("Weight  : 90 kg"),
                  Text("Height  : 176 cm"),
                  Text("BMI       : 29.1" + " (overweight)"),
                  SizedBox(height: 15),
                  Text("Analysis", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Your heart rythm were identified as an arrythmia, but the heart rate was significantly high. You stated that you were in the passive activity mode during the checkup and had a several clinical backgrounds, such as high blood pressure and diabetes melitus. Those clinical backgrounds might have played a significant role in increasing the heart rate and arrythmia. Further treatment will be needed."),
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
                  Text("Due to the confirmed irregular heart rythm, we highly recommend you to consult with the doctor for the further treatments."),
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
                  Text("Additionally, we can give you some advice about what you can do by yourself, so you can minimize the risk factor."),
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