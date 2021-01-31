import 'package:flutter/material.dart';
import 'package:heartrate/pages/result.dart';

class Symptomps extends StatefulWidget {
  final String avgBPM, heartCondition;

  const Symptomps({Key key, this.avgBPM, this.heartCondition}) : super(key: key);

  @override
  SymptompsState createState() => new SymptompsState();
}

class SymptompsState extends State<Symptomps> {
  Map<String, bool> values = {
    'general fatigue': false,
    'rapid and irregular heartbeat': false,
    'faintness or confusion': false,
    'fluttering or thumping in the chest': false,
    'dizziness': false,
    'sweating': false,
    'chest pain': false,
    'shortness of breath and anxiety': false,
    'weakness': false,
    'fatigue when exercising': false,
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          margin: const EdgeInsets.all(30),
        child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
                height:30),
            Text("Choose symptoms that you have:",
                style: TextStyle(fontSize: 24.0)),
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
      )
      )
    );
  }
}