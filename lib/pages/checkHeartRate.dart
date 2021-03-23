import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/models/ScreeningData.dart';
import 'package:heartrate/pages/invalid.dart';
import 'package:wakelock/wakelock.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:heartrate/chart.dart';
import 'package:quiver/async.dart';
import 'package:heartrate/models/Log.dart';

import 'detection/symptomps.dart';


class checkHeartRate extends StatefulWidget {
  @override
  checkHeartRateView createState() {
    return checkHeartRateView();
  }

}

class checkHeartRateView extends State<checkHeartRate> {

  ScreeningData screeningData;

  bool isWaitingAsync = false;
  bool _toggled = false;
  bool _processing = false;
  List<SensorValue> _data = [];
  CameraController _controller;
  double _alpha = 0.3;
  int _bpm = 0;
  List<dynamic> _report = [];
  int counter=0;

  int _start = 60;
  int _current = 60;

  bool showResult = false;
  String uidLog = '';
  String userUid = '';
  String uid = '';

  String avgBPM, heartCondition = '';

  @override
  initState() {
    super.initState();
    getUserUid();
  }

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (this.mounted) {
        setState(() {
          _current = _start - duration.elapsed.inSeconds;
        });
      }
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
      _untoggle();
    });
  }

  _toggle() {
    _initController().then((onValue) {
      Wakelock.enable();
      startTimer();
      setState(() {
        _toggled = true;
        _processing = false;
      });
      _updateBPM();
    });
  }

  _untoggle() async {
    bool isLogCreated = false;
    _disposeController();
    Wakelock.disable();
    setState(() async {
      isWaitingAsync = true;
      _processing = false;
      counter+=1;
      createRecord(_report.toString());

      if (isLogCreated){
        _toggled = false;
        print('DEBUG CHECK ' + avgBPM + heartCondition);
        screeningData = ScreeningData(userUid: uid, sensorData: _report);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Symptomps(screeningData: screeningData))
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Invalid()),
        );
      }
    });
  }


  void getUserUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();
    setState(() {
      uid = user.uid;
      print('uid checkheart rate: '+ uid);
    });
  }

  Future<bool> saveResponseLogToDb(http.Response response) async {
    Log log1 = Log.fromJson(jsonDecode(response.body));

    DocumentReference ref = await databaseReference.collection("log")
        .add({
      'uiduser': uid,
      'avgBPM': log1.avgBPM.toInt(),
      'heartCondition': log1.heartCondition,
      'dateTime' : DateTime.now(),
    });

    avgBPM = log1.avgBPM.toInt().toString();
    heartCondition = log1.heartCondition;

    print('success to db ' + ref.documentID);

    return true;

  }


  final databaseReference = Firestore.instance;
  void createRecord(data) async {
    DocumentReference ref = await databaseReference.collection("history")
        .add({
      'array': data,
    });
    print(ref.documentID);
  }

  Future<void> _initController() async {
    try {
      List _cameras = await availableCameras();
      _controller = CameraController(_cameras.first, ResolutionPreset.low);
      await _controller.initialize();
      Future.delayed(Duration(milliseconds: 500)).then((onValue) {
        _controller.setFlashMode(FlashMode.torch);
      });
      _controller.startImageStream((CameraImage image) {
        if (!_processing) {
          setState(() {
            _processing = true;
          });
          _scanImage(image);
        }
      });
    } catch (Exception) {
      print(Exception);
    }
  }

  _updateBPM() async {
    List<SensorValue> _values;
    double _avg;
    int _n;
    double _m;
    double _threshold;
    double _bpm;
    int _counter;
    int _previous;
    while (_toggled) {
      _values = List.from(_data);
      _avg = 0;
      _n = _values.length;
      _m = 0;
      _values.forEach((SensorValue value) {
        _avg += value.value / _n;
        if (value.value > _m) _m = value.value;
      });
      _threshold = (_m + _avg) / 2;
      _bpm = 0;
      _counter = 0;
      _previous = 0;
      for (int i = 1; i < _n; i++) {
        if (_values[i - 1].value < _threshold &&
            _values[i].value > _threshold) {
          if (_previous != 0) {
            _counter++;
            _bpm +=
                60000 / (_values[i].time.millisecondsSinceEpoch - _previous);
          }
          _previous = _values[i].time.millisecondsSinceEpoch;
        }
      }
      if (_counter > 0) {
        _bpm = _bpm / _counter;
        setState(() {
          this._bpm = ((1 - _alpha) * _bpm + _alpha * _bpm).toInt();
        });
      }
      await Future.delayed(Duration(milliseconds: (1000 * 50 / 30).round()));
    }
  }

  _scanImage(CameraImage image) {
    double _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= 50) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(DateTime.now(), _avg));
      _report.add([DateTime.now().toString(), _avg.toString()]);
    });
    Future.delayed(Duration(milliseconds: 1000 ~/ 30)).then((onValue) {
      setState(() {
        _processing = false;
      });
    });
  }

  _disposeController() {
    _controller?.dispose();
    _controller = null;
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child: SafeArea(
          child: Center(
            child: (!_toggled) ?
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
            Text("Start Health Check",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
              IconButton(
                  icon: Image(image: AssetImage('assets/images/heartbutton.png')),
                  color: Colors.red,
                  iconSize: 200,
                  onPressed: () {
                    setState(() {
                      _toggle();
                    });
                  }
              ),
        ]
        ) :
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ isWaitingAsync ?
            new CircularProgressIndicator() :
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text("Measuring...",
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  Text(_current.toString(),
                      style: TextStyle(fontSize: 24.0)),
                ]
              ),
              ImageIcon(
                AssetImage('assets/images/instruction1.png'),
                size: 150,
              ),
              Row(
                children: [
                  ImageIcon(
                  AssetImage('assets/images/1.png'),
                    size: 60,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text("Put your phone on the table with the camera lens facing upward.",
                      style: mainTheme.textTheme.bodyText1),),
                ],
              ),
              SizedBox(height: 30),
              ImageIcon(
                AssetImage('assets/images/instruction2.png'),
                size: 100,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  ImageIcon(
                  AssetImage('assets/images/2.png'),
                    size: 60,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child:
                    Text("Place your finger on the camera lens, keep relax, and wait until the flash turned off.",
                        style: mainTheme.textTheme.bodyText1),
                  ),
                ],
              ),

            ]
        )
      )
    )
      )
    );
  }

}