import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishPage extends StatefulWidget {
  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
          child: ListView(
            children: [
              Image.asset('assets/images/finish_pic.jpg'),
              SizedBox(height: 20),
              Text("Exercise finished!", style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 20),
              Text("How are you feeling?", style: TextStyle(fontSize: 16.0)),
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              TextButton(
                child: Text("Back to Daily Routines", style: TextStyle(fontSize: 16.0)),
                onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/DailyRoutines')),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10.0),
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
