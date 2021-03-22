import 'package:flutter/material.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/detection/result.dart';

class Symptomps extends StatefulWidget {
  final String avgBPM, heartCondition;

  const Symptomps({Key key, this.avgBPM, this.heartCondition}) : super(key: key);

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
            Text("Leave unselected if you have no specific heath conditions.",
                style: TextStyle(fontStyle: FontStyle.italic)),
            ListView(
                  shrinkWrap: true,
                  children: values.keys.map((String key) {
                    return new CheckboxListTile(
                      title: new Text(key),
                      value: values[key],
                      onChanged: (bool value) {
                        setState(() {
                          values[key] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
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
                  onPressed: () {
                    print('DEBUG SYMPTOMPTS ' + widget.avgBPM + widget.heartCondition);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(avgBPM: widget.avgBPM, heartCondition: widget.heartCondition)),
                    );
                  },
                  child: Text(
                    "See Result",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            )
        ),
    );
  }
}