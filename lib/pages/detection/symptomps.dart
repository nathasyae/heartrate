import 'package:flutter/material.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/detection/result.dart';
import 'package:heartrate/pages/detection/precheckstate.dart';

class Symptomps extends StatefulWidget {
  ScreeningData screeningData;

  Symptomps({Key key, this.screeningData}) : super(key: key);

  @override
  SymptompsState createState() => new SymptompsState();
}

class SymptompsState extends State<Symptomps> {
  Map<String, bool> values = {
    'Feeling cold on the arms/legs': false,
    'Feeling Fatigue': false,
    'Chest pain on the left side (Angina)': false,
    'Feeling dizzy/lightheadness': false,
    'Difficulties in breathing': false,
  };

  bool isSelected =false;
  var mycolor = Colors.white;
  
  List<String> symptompsList = [
    'Feeling cold on the arms/legs',
    'Feeling Fatigue',
    'Chest pain on the left side (Angina)',
    'Feeling dizzy/lightheadness',
    'Difficulties in breathing',
  ];

  List<String> selectedSymptomps = [];
  List<bool> isSelectedList = [false,false,false,false,false];
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
                SizedBox(
                    height:30),
                Text("Choose symptoms that you have:",
                    style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 10),
            Text("Leave unselected if you have no specific heath conditions.",
                style: TextStyle(fontStyle: FontStyle.italic)),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: symptompsList.length,
                itemBuilder: (BuildContext context, int position) {
                  return new Card(
                    color: isSelectedList[position] ? Colors.red[100] : null,
                    child: new ListTile(
                        selected: isSelectedList[position],
                        trailing: const Icon(Icons.info, color: Colors.grey,),
                        title: new Text(symptompsList[position],style: TextStyle(color: Colors.black),),
                        onTap: () {
                          toggleSelection(position);
                        }
                    ),
                  );
                },
              ),
            ),

                // Action
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("Next", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                      onPressed: () {
                        widget.screeningData.symptomps = selectedSymptomps;
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

              ],
            )
        ),
    );
}

    void toggleSelection(position) {
      setState(() {
        if (isSelectedList[position]) {
          // mycolor=Colors.white;
          isSelectedList[position] = false;

          if(selectedSymptomps.contains(symptompsList[position])) {
            setState(() {
              selectedSymptomps.removeWhere((val) => val == symptompsList[position]);
            });
          }

        } else {
          // mycolor=Colors.red[300];
          isSelectedList[position] = true;

          if(! selectedSymptomps.contains(symptompsList[position])){
            setState(() {
              selectedSymptomps.add(symptompsList[position]);
            });
          }
        };

        });
      }

    }