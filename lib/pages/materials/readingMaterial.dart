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
      appBar: AppBar(title: new Text("Reading Materials", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white),
      body: ListView(
                padding: EdgeInsets.all(30),
              children: [
                Align(alignment: Alignment.topLeft, child: Chip(label: Text("Category", textAlign: TextAlign.left), backgroundColor: Colors.red[100],),),
                Text("Judul article", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Image.asset('assets/images/finish_pic.jpg'),
                SizedBox(height: 5),
                Text("This is the caption of the picture above"),
                SizedBox(height: 20),
                Text("By Dr. Zack", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("March 22, 2021"),
                SizedBox(height: 20),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type "
                    "specimen ... Aldus PageMaker including versions of Lorem Ipsum. "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
                style: TextStyle(
                    fontSize: 16)),
              ],
            ),
    );
  }
}
