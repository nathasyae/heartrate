import 'package:flutter/material.dart';
import 'package:heartrate/components/MultiSelectChip.dart';
import 'package:heartrate/pages/result.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class PrecheckState extends StatefulWidget {
  final String avgBPM, heartCondition;

  const PrecheckState({Key key, this.avgBPM, this.heartCondition}) : super(key: key);

  @override
  PrecheckStateState createState() => new PrecheckStateState();
}

class PrecheckStateState extends State<PrecheckState> {

  List<String> stateList = [
    'Resting', 'Walking', 'Watching phone',
    'Reading books','Listened to music',
    'Did some work', 'Playing casual games',
    'Tidy the room', 'Exercise',
    'Had drinks', 'Cleaning home',
    'Washing dish/clothes', 'Had snacks',
    'Playing competitive games', 'Bath',
  ];

  List<String> selectedReportList = List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
            SizedBox(height:30),
            Text("Pre-check State",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
            SizedBox(height:10),
            Text("Select one or more activities you have done recently",
                style: TextStyle(fontStyle: FontStyle.italic)),

            SizedBox(height:20),
            MultiSelectChip(
              stateList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),


            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text("Previous", style: TextStyle(fontSize: 16.0)),
                  onPressed: (){},
                  style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  primary: Colors.red,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(5.0))),
                ),
                TextButton(
                  child: Text("See Results", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  // onPressed: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Consultation())
                  // ),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ],
            ),

            SizedBox(height: 30,)
              ],
            )
        ),
    );
  }
}