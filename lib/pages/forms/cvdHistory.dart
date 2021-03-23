import 'package:flutter/material.dart';
import 'package:heartrate/models/UserData.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/detection/result.dart';

import 'activityLevel.dart';

class CvdHistory extends StatefulWidget {
  UserData userData;

  CvdHistory({Key key, this.userData}) : super(key: key);

  @override
  CvdHistoryState createState() => new CvdHistoryState();
}

List<String> diseaseList = [
  'Arrythmias', 'Chest Pain (Angina)', 'Unstable angina', 'Valve illness', 'Others'];

List<String> selectedDisease = [];
List<bool> isSelectedList = [false,false,false,false,false];

class CvdHistoryState extends State<CvdHistory> {
  int selectedIndex = -1;
  List<String> cvd_history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          SizedBox(
              height:30),
          Text("Do you have any of specific cardiovascular illnesses?",
              style: TextStyle(fontSize: 24.0)),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: diseaseList.length,
              itemBuilder: (BuildContext context, int position) {
                return new Card(
                  color: isSelectedList[position] ? Colors.red[100] : null,
                  child: new ListTile(
                      selected: isSelectedList[position],
                      trailing: const Icon(Icons.info, color: Colors.grey,),
                      title: new Text(diseaseList[position],style: TextStyle(color: Colors.black),),
                      onTap: () {
                        toggleSelection(position);
                      }
                  ),
                );
              },
            ),
          ),

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
                onPressed: () {
                  widget.userData.healthConditions = selectedDisease;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityLevel(userData: widget.userData)),
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

  void toggleSelection(position) {
    setState(() {
      if (isSelectedList[position]) {
        // mycolor=Colors.white;
        isSelectedList[position] = false;

        if(selectedDisease.contains(diseaseList[position])) {
          setState(() {
            selectedDisease.removeWhere((val) => val == diseaseList[position]);
          });
        }

      } else {
        // mycolor=Colors.red[300];
        isSelectedList[position] = true;

        if(! selectedDisease.contains(diseaseList[position])){
          setState(() {
            selectedDisease.add(diseaseList[position]);
          });
        }
      };

    });
  }

}
