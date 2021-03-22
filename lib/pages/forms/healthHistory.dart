import 'package:flutter/material.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/pages/forms/cvdHistory.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/detection/result.dart';

class HealthHistory extends StatefulWidget {
  UserData userData;

  HealthHistory({Key key, this.userData}) : super(key: key);

  @override
  HealthHistoryState createState() => new HealthHistoryState();
}

List<String> conditionList = [
  'High blood pressure (hypertension)', 'High blood glucose (diabetes)', 'Overweight (obesity)', 'Abnormal blood lipids (dyslipidaemia)'];


class HealthHistoryState extends State<HealthHistory> {
  int selectedIndex = -1;
  List<String> health_conditions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          SizedBox(height:30),
          Text("Do you have any of these health conditions?",
              style: TextStyle(fontSize: 24.0)),
          Text("Leave unselected if you have no specific heath conditions.",
              style: TextStyle(fontStyle: FontStyle.italic)),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: conditionList.length,
              itemBuilder: (BuildContext context, int position) {
                return InkWell(
                  onTap: () => setState(() => selectedIndex=position),
                  child: Container(
                    width: 150,
                    child: Card(
                      shape: (selectedIndex==position)
                          ? RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red))
                          : null,
                      child:
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(conditionList[position]),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
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
                onPressed: () {
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
                  widget.userData.health_conditions = health_conditions;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CvdHistory(userData: widget.userData)),
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
      ),
    );
  }
}
