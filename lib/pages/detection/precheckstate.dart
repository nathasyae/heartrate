import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heartrate/components/MultiSelectChip.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'package:heartrate/pages/detection/result.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../invalid.dart';
import 'package:http/http.dart' as http;


class PrecheckState extends StatefulWidget {
  ScreeningData screeningData;

  PrecheckState({Key key, this.screeningData}) : super(key: key);

  @override
  PrecheckStateState createState() => new PrecheckStateState();
}

class PrecheckStateState extends State<PrecheckState> {

  // bool isDone = false;
  bool isInAsyncCall = false;

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
      body: ModalProgressHUD(
        inAsyncCall: isInAsyncCall,
        child: Container(
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
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
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
                  onPressed: () async {
                    widget.screeningData.intensity = selectedReportList;

                    print("precheck");
                    print(widget.screeningData.intensity.toString());
                    print(widget.screeningData.userUid);

                    bool isDone = await processDetection(widget.screeningData);

                    print('sblm ke result ' + widget.screeningData.userUid);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(screeningData: widget.screeningData)));
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
    )
    );
  }

  Future<bool> processDetection(ScreeningData screeningData) async {
    bool isDone = false;

    setState(() {
      isInAsyncCall = true;
    });

    final http.Response response = await http.post(
      'https://cardiwatch-core-frontendapi.azurewebsites.net/api/screening/detect?uid='+ screeningData.userUid,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uid': screeningData.userUid,
        'intensity':  screeningData.intensity,
        'symptomps':  screeningData.symptomps,
        'array':  screeningData.sensorData,
      }),
    );

    print(response.statusCode);
    print(response.body.toString());

    if (response.statusCode == 200) {
      debugPrint('RESJSON success');
      ScreeningData result = new ScreeningData.fromJson(jsonDecode(response.body));
      print('si redult + ' + result.bpm);
      setState(() {
        widget.screeningData = result;
        isInAsyncCall = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Invalid()),
      );
      throw Exception('Failed to load');
    }

    if(response!=null){
      isDone = true;
    }
    
    return isDone;

  }


}