import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:heartrate/pages/result.dart';

class PersonalInfo extends StatefulWidget {

  const PersonalInfo({Key key}) : super(key: key);

  @override
  PersonalInfoState createState() => new PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          margin: const EdgeInsets.all(30),
        height: 500,
        child: ListView(
          children: [
                SizedBox(
                    height:30),
                Text("Please enter your personal information...",
                    style: TextStyle(fontSize: 24.0)),

            Row(
              children: [
                Text("Body weight: "),
                Expanded(child: TextField(
                  keyboardType: TextInputType.number,
                )),
                DropDown(
                  items: ["KG", "LBS"],
                  hint: Text("KG"),
                  // onChanged: (text) {
                  //     value = text;
                  //     },{},
                ),
              ],
            ),
            Row(
              children: [
                Text("Body height: "),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
                DropDown(
                  items: ["CM", "INCH"],
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
                  items: ["Male", "Female", "Other"],
                  hint: Text("Select gender"),
                  // onChanged: (text) {
                  //     value = text;
                  //     },{},
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Result(avgBPM: widget.avgBPM, heartCondition: widget.heartCondition)),
                      // );
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
        ),
    );
  }
}