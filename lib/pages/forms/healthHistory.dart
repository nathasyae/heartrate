import 'package:flutter/material.dart';
import 'package:heartrate/pages/result.dart';

class HealthHistory extends StatefulWidget {

  const HealthHistory({Key key}) : super(key: key);

  @override
  HealthHistoryState createState() => new HealthHistoryState();
}

List<String> conditionList = [
  'High blood pressure (hypertension)', 'High blood glucose (diabetes)', 'Abnormal blood lipids (dyslipidaemia)'];


class HealthHistoryState extends State<HealthHistory> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Do you have any of these health conditions?",
                style: TextStyle(fontSize: 24.0)),
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
                  onPressed: null,
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
        ),
      ),
    );
  }
}
