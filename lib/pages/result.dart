import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final Firestore _db = Firestore.instance;

class Result extends StatefulWidget {
  final String avgBPM, heartCondition;

  const Result({Key key, this.avgBPM, this.heartCondition}) : super(key: key);

  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Result> {
  String avgBPM, heartCondition;
  bool isLoadDone;

  @override
  void initState() {
    super.initState();
    // loadData(uidLog);
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
                      Text(widget.avgBPM,
                          style: TextStyle(fontSize: 50.0)),
                      Text(" BPM",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  Text("Normal heart rate",
                      style: Theme.of(context).textTheme.bodyText1),

                  SizedBox(height: 50),
                  Text("Rythm Analysis",
                      style: Theme.of(context).textTheme.headline2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/img/heartbeat.png"),
                      ),
                      Text(widget.heartCondition,
                          style: TextStyle(fontSize: 25)),
                    ],
                  ),
                  SizedBox(height: 80),
                  // Button(title: "See Advice", onPressed: doNothing(), isPrimary: true),
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
                    onPressed: () {},
                    child: Text(
                      "See Daily Health Plan",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                                    // Button(title: "See Full Report", onPressed: doNothing(), isPrimary: false)
                ]
            )
        )
    );
  }

  doNothing(){}

}
