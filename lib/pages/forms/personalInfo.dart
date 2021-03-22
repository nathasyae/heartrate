import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:heartrate/models/Survey.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/pages/result.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

import 'healthHistory.dart';

class PersonalInfo extends StatefulWidget {
  UserData userData;
  String uid = '4LuhSXvV9MMJJA3i3ocWbZNTCVn2';

  PersonalInfo({Key key, this.uid}) : super(key: key);

  @override
  PersonalInfoState createState() => new PersonalInfoState();

}

class PersonalInfoState extends State<PersonalInfo> {

  Survey survey;
  String gender;

  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();

  double kg, lbs = 0;
  double inch, cm = 0;

  void _convertLbsToKg(){
    double input_val = double.parse(_weightController.text); // just add checking for digital input there
    setState(() {
      lbs = input_val;
      kg = input_val * 0.45359237;
      _weightController.text = kg.toString();
      print('kg ' + kg.toString());
    });
  }

  void _convertKgToLbs(){
    double input_val = double.parse(_weightController.text); // just add checking for digital input there
    setState(() {
      kg = input_val;
      lbs = input_val / 0.45359237;
      _weightController.text = lbs.toString();
      print('lbs ' + lbs.toString());
    });
  }




  @override
  Widget build(BuildContext context) {
    // _weightController.text = widget.userData.weight?.toString() ?? "0";

    return new Scaffold(
      body: ListView(
          padding: EdgeInsets.all(30),
          children: [
                SizedBox(
                    height:30),
                Text("Please enter your personal information...",
                    style: TextStyle(fontSize: 24.0)),

            Row(
              children: [
                Text("Body weight: "),
                Expanded(child: TextField(
                  controller: _weightController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                )),
                DropDown(
                  items: ["KG"],
                  hint: Text("KG"),
                  onChanged: (meassure) {
                    setState(() {
                      if (meassure == "KG") {
                        // int.parse(_weightController.text).toKilograms(MassUnit.pound);
                        _convertLbsToKg();
                      } else {
                        _convertLbsToKg();
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text("Body height: "),
                Expanded(
                  child: TextField(
                    // controller: _heightController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
                DropDown(
                  items: ["CM"],
                  hint: Text("CM"),
                  // onChanged: (text) {
                  //     value = text;
                  //     },{},
                ),
              ],
            ),
            Row(
              children: [
                Text("Gender:"),
                DropDown(
                  items: ["Male", "Female"],
                  // initialValue: survey.genderList[_genderController.text.toInt()] ?? "Select gender",
                  hint: Text("Select gender"),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  }
                ),
              ],
            ),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      UserData userData = new UserData(uid: widget.uid, gender: gender, weight: kg, height: cm);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HealthHistory(userData: userData)),
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              ],
            )
    );
  }
}