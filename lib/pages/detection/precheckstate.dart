import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heartrate/components/MultiSelectChip.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/detection/result.dart';

import 'package:http/http.dart' as http;


class PrecheckState extends StatefulWidget {
  ScreeningData screeningData;

  PrecheckState({Key key, this.screeningData}) : super(key: key);

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
  ScreeningData result;

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
                  onPressed: (){
                    widget.screeningData.intensity = selectedReportList;
                    processDetection(widget.screeningData);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(screeningData: result)));
                    },
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

  Future<bool> processDetection(ScreeningData screeningData) async {
    bool isDone = false;

    final http.Response response = await http.post(
      'https://cardiwatch-core-frontendapi.azurewebsites.net/api/screening/detect?uid='+ screeningData.userUid,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // 'id': counter,
        'uid': screeningData.userUid,
        'intensity':  screeningData.intensity.toString(),
        'symptomps':  screeningData.symptomps.toString(),
        'array':  screeningData.sensorData.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint('RESJSON success');
      ScreeningData result = ScreeningData.fromJson(jsonDecode(response.body));
      setState(() {
        result = result;
      });
    } else if (response.statusCode == 400){
      debugPrint('RESJSON ' + response.toString());
    } else {
      debugPrint('RESJSON fail ' +response.statusCode.toString());
      throw Exception('Failed to load');
    }

    if(response!=null){
      isDone = true;
    }
    
    return isDone;

  }


}