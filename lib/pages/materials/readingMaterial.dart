import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadingMaterial extends StatefulWidget {
  @override
  _ReadingMaterialState createState() => _ReadingMaterialState();
}

class _ReadingMaterialState extends State<ReadingMaterial> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
          child: ListView(
            children: [
              Text("Judul article", style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 20),
              Image.asset('assets/images/finish_pic.jpg'),
              SizedBox(height: 20),
              Text("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"),
            ],
          ),
      ),
    );
  }
}
