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
        child: ListView(
          children: [
            Image.asset('assets/images/finish_pic.jpg'),
            Text("Exercise finished!"),
            Text("How are you feeling?"),
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
            TextButton(onPressed: (){}, child: Text("Back to Daily Routines")),
          ],
        ),
      ),
    );
  }
}
