import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:heartrate/chart.dart';
import 'package:quiver/async.dart';
import 'package:heartrate/pages/result.dart';
import 'package:heartrate/models/Log.dart';
import 'package:heartrate/models/User.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heartrate/pages/symptomps.dart';


class checkHeartRate extends StatefulWidget {
  final String useruid;

  const checkHeartRate({this.useruid});

  @override
  checkHeartRateView createState() {
    return checkHeartRateView();
  }

}

class checkHeartRateView extends State<checkHeartRate> {

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

  String avgBPM, heartCondition = '';

  @override
  initState() {
    super.initState();
    // getUserUid();
  }

  // void getUserUid() async {
  //   FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   print(user.uid);
  //   userUid = user.uid;
  // }

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
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
    _disposeController();
    Wakelock.disable();
    setState(() async {
      _toggled = false;
      _processing = false;
      counter+=1;
      _write(_report.toString(),counter);
      bool isLogCreated = await createLog(_report.toString(), counter.toString());
      createRecord(_report.toString());

      if (isLogCreated){
        print('DEBUG CHECK ' + avgBPM + heartCondition);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Symptomps(avgBPM: avgBPM, heartCondition: heartCondition))
        );
      }
    });
  }


  Future<bool> createLog(String data, String counter) async {
    final http.Response response = await http.post(
      'http://d96e009a7c02.ngrok.io/api/PPGProcessor',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': counter,
        'array': data,
      }),
    );
    if (response.statusCode == 200) {
      debugPrint('RESJSON success');
      debugPrint('RESJSON ' + response.toString());
      Log log1 = Log.fromJson(jsonDecode(response.body));
      debugPrint('RESJSON '+ log1.avgBPM.toString() + log1.heartCondition);

      bool isSaved = await saveResponseLogToDb(response);

      return isSaved;

    } else {
      debugPrint('RESJSON fail ' +response.statusCode.toString());
      throw Exception('Failed to load');
    }
  }


  Future<bool> saveResponseLogToDb(http.Response response) async {

    Log log1 = Log.fromJson(jsonDecode(response.body));

    DocumentReference ref = await databaseReference.collection("log")
        .add({
      'uiduser': widget.useruid,
      'avgBPM': log1.avgBPM.toInt(),
      'heartCondition': log1.heartCondition,
    });

    avgBPM = log1.avgBPM.toInt().toString();
    heartCondition = log1.heartCondition;

    print('success to db ' + ref.documentID);

    return true;

  }

  _write(String text, int counter) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/report'+counter.toString()+'.txt');
    await file.writeAsString(text);
    debugPrint('export success to ' + '${directory.path}');
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
    _controller.dispose();
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
            Text("Start Health Check",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              iconSize: 128,
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
            children: <Widget>[
              Text("Measuring...",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Text(_current.toString(),
                  style: TextStyle(fontSize: 24.0)),
              SizedBox(height: 20),
              Text("1. Put your phone on the table with the camera lens facing upward.",
                  style: mainTheme.textTheme.bodyText1),
              SizedBox(height: 20),
              Text("2. Place your finger on the camera lens, keep relax, and wait until the flash turned off.",
                  style: mainTheme.textTheme.bodyText2),

            ]
        )
      )
    )
      )
    );
  }

}