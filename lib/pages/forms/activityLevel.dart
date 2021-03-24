import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heartrate/models/UserData.dart';

import '../../BottomNavPage.dart';
import 'package:http/http.dart' as http;

class ActivityLevel extends StatefulWidget {
  UserData userData;

  ActivityLevel({Key key, this.userData}) : super(key: key);

  @override
  ActivityLevelState createState() => new ActivityLevelState();
}

class ActivityLevelState extends State<ActivityLevel> {
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;
  String activity_level="Sedentary";

  List<String> activityList = ["Sedentary", "Lightly active", "Active", "VeryActive"];

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      activity_level = activityList[value];

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
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
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
            SizedBox(height: 10),

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
            SizedBox(height: 10),

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
            SizedBox(height: 10),

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
            SizedBox(height: 10),

                // Actions
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
                  onPressed: () async {
                    widget.userData.userCategory = activity_level;

                    // send to backend
                    bool isDone = await updateProfileDb(widget.userData);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavPage(uid: widget.userData.uid)),
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

  Future<bool> updateProfileDb(UserData userData) async {
    bool isDone = false;

    Map<String, dynamic> surveyMapped = {
      'survey': {
        'healthConditions': userData.healthConditions.toString(),
        'userCategory': userData.userCategory,
      }
    };

    Map<String, dynamic> dataMapped = {
      'weight': userData.weight,
      'height': userData.height,
      'gender': userData.gender,
      'healthConditions': userData.healthConditions,
      'userCategory': userData.userCategory,
    };

    final http.Response response = await http.put(
      'https://cardiwatch-core-frontendapi.azurewebsites.net/api/profile/'+ userData.profilId + '/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uid': userData.uid,
        'email': userData.email,
        'weight': userData.weight,
        'height': userData.height,
        'gender': userData.gender,
        'healthConditions': userData.healthConditions,
        'userCategory': userData.userCategory,
      }),
    );

    print('activity level get from azure ' + jsonDecode(response.body).toString());

    if (response.statusCode == 200) {
      print('RESJSON success');
    } else if (response.statusCode == 400){
      print('RESJSON ' + response.toString());
    } else {
      print('RESJSON fail ' +response.statusCode.toString());
      throw Exception('Failed to load');
    }

    if(response!=null){
      isDone = true;
    }

    return isDone;

  }
}