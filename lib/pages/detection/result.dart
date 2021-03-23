import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'package:heartrate/pages/detection/resultProVersion.dart';

import '../../BottomNavPage.dart';
import '../dailyroutines.dart';

final Firestore _db = Firestore.instance;

class Result extends StatefulWidget {
  ScreeningData screeningData;

  Result({Key key, this.screeningData}) : super(key: key);

  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Result> {
  String avgBPM;
  String heartCondition;
  bool isLoadDone;

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadData(String uid) async {
    final DocumentReference document =
    Firestore.instance.collection('log').document(uid);
    await document.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          avgBPM = datasnapshot.data['avgBPM'].toString();
          heartCondition = datasnapshot.data['heartCondition'];

          isLoadDone = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    avgBPM = widget.screeningData.bpm.toString();
    heartCondition = widget.screeningData.finalEvaluation;

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Result",
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 50),
                  Text("Avg Heart Rate",
                      style: Theme.of(context).textTheme.headline2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, size:50, color: Colors.red,),
                      Text(avgBPM,
                          style: TextStyle(fontSize: 50.0)),
                      Text(" BPM",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  Text("Normal heart rate",
                      style: Theme.of(context).textTheme.bodyText1),

                  SizedBox(height: 50),
                  Text("Rhythm Analysis",
                      style: Theme.of(context).textTheme.headline2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/img/heartbeat.png"),
                      ),
                      Text(heartCondition,
                          style: TextStyle(fontSize: 25)),
                    ],
                  ),
                  SizedBox(height: 80),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResultProVersion(screeningData: widget.screeningData,))
                      );
                    },
                    child: Text(
                      "See Analysis Detail",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    minWidth: 250,
                    // color: Colors.red,
                    color: Theme.of(context).backgroundColor,
                    textColor: Colors.black,
                    // textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(10.0),
                    // splashColor: secondaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black),
                      // side: BorderSide(color: Colors.red)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavPage())
                    );
                    },
                    child: Text(
                      "Back to Home",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),// Button(title: "See Full Report", onPressed: doNothing(), isPrimary: false)
                ]
            )
        )
    );
  }

}
