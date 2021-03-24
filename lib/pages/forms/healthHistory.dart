import 'package:flutter/material.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/pages/forms/cvdHistory.dart';

class HealthHistory extends StatefulWidget {
  UserData userData;

  HealthHistory({Key key, this.userData}) : super(key: key);

  @override
  HealthHistoryState createState() => new HealthHistoryState();
}

List<String> conditionList = [
  'High blood pressure (hypertension)',
  'High blood glucose (diabetes)',
  'Overweight (obesity)',
  'Abnormal blood lipids (dyslipidaemia)'];

List<String> selectedConditions = [];
List<bool> isSelectedList = [false,false,false,false];

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
              style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w400)),
          SizedBox(height:10),
          Text("Leave unselected if you have no specific heath conditions.",
              style: TextStyle(fontStyle: FontStyle.italic)),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: conditionList.length,
              itemBuilder: (BuildContext context, int position) {
                return new Card(
                  color: isSelectedList[position] ? Colors.red[100] : null,
                  child: new ListTile(
                      selected: isSelectedList[position],
                      trailing: const Icon(Icons.info, color: Colors.grey,),
                      title: new Text(conditionList[position],style: TextStyle(color: Colors.black),),
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
                  widget.userData.healthConditions = selectedConditions;

                  print('health cond');
                  print(widget.userData.email + " " + widget.userData.uid + " " + widget.userData.healthConditions.toString());

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

  void toggleSelection(position) {
    setState(() {
      if (isSelectedList[position]) {
        // mycolor=Colors.white;
        isSelectedList[position] = false;

        if(selectedConditions.contains(conditionList[position])) {
          setState(() {
            selectedConditions.removeWhere((val) => val == conditionList[position]);
          });
        }

      } else {
        // mycolor=Colors.red[300];
        isSelectedList[position] = true;

        if(! selectedConditions.contains(conditionList[position])){
          setState(() {
            selectedConditions.add(conditionList[position]);
          });
        }
      };

    });
  }

}
