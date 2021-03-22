import 'package:flutter/material.dart';
import 'package:heartrate/homePage.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/pages/result.dart';

import '../../BottomNavPage.dart';

class ActivityLevel extends StatefulWidget {
  UserData userData;

  ActivityLevel({Key key, this.userData}) : super(key: key);

  @override
  ActivityLevelState createState() => new ActivityLevelState();
}

class ActivityLevelState extends State<ActivityLevel> {
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;
  String activity_level;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
                SizedBox(height:30),
                Text("Which one that fits to your activity level?",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
            Row(
                children: [
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        'Sedentary',
                        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        'Majority of people, no daily exercise',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ]
            ),

            Row(
              children: [
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        'Lightly active',
                        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        'Daily 30 minutes light exercise or 10 minutes havey exercise',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),

              ],
            ),

            Row(
              children: [
                new Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      'Active',
                      style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      'Jogging 50 minutes/day',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                new Radio(
                  value: 3,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      'Very Active',
                      style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      'Jogging 2 hours/day',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),


                // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                    color: Colors.red,
                    textColor: Colors.red,
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    onPressed:(){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Previous",
                      style: TextStyle(fontSize: 16.0),
                    ),
                ),
                FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: () {
                    widget.userData.activity_level = activity_level;

                    // send to backend

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavPage()),
                    );
                  },
                  child: Text(
                    "Finish Survey",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),

              ],
            )
        ),
    );
  }
}