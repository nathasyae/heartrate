import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:heartrate/models/Survey.dart';
import 'package:heartrate/models/UserData.dart';

import 'healthHistory.dart';

class PersonalInfo extends StatefulWidget {
  UserData userData;

  PersonalInfo({Key key, this.userData}) : super(key: key);

  @override
  PersonalInfoState createState() => new PersonalInfoState();

}

class PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();

  Survey survey;
  String gender;

  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();

  String kg, lbs = "0";
  String inch, cm = "0";

  @override
  Widget build(BuildContext context) {
    print("profile page" + widget.userData.uid);

    return new Scaffold(
      body: ListView(
          padding: EdgeInsets.all(30),
          children: [
                SizedBox(height:30),
                Text("Please enter your personal information",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Body weight : "),
                      Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your weight';
                              }
                              return null;
                            },
                            onChanged: (value){
                              setState(() {
                                kg = value;
                              });
                            },
                            autofocus: true,
                            keyboardType: TextInputType.number,
                          )),
                      DropDown(
                        items: ["KG"],
                        hint: Text("KG"),
                        onChanged: (meassure) {
                          setState(() {
                            if (meassure == "KG") {
                              // _convertLbsToKg();
                            } else {
                              // _convertLbsToKg();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Body height : "),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your height';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              cm = value;
                            });
                          },
                          autofocus: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      DropDown(
                        items: ["CM"],
                        hint: Text("CM"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Gender  :   "),
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
                ]
              ),
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
                      if (_formKey.currentState.validate()) {
                        widget.userData.gender = gender;
                        widget.userData.weight = kg;
                        widget.userData.height = cm;

                        print('pinfo');
                        print(widget.userData.email + " " + widget.userData.uid + " ");

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              HealthHistory(userData: widget.userData)),
                        );
                      }
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