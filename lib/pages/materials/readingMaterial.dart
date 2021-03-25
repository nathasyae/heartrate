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
                Align(alignment: Alignment.topLeft, child: Chip(label: Text("Facts", textAlign: TextAlign.left, style: TextStyle(fontSize: 14),), backgroundColor: Colors.red[100],),),
                Text("The Importance of Cardiac Health", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Image.asset('assets/images/finish_pic.jpg'),
                SizedBox(height: 5),
                Text("Healthcare illustration picture -- Microsoft Office 365 Stock Images", style: TextStyle(fontSize: 10)),
                SizedBox(height: 20),
                Text("By Adam Maulana", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("March 24, 2021"),
                SizedBox(height: 20),
                Text("Do you know that Cardiovascular Disease (CVDs) is the number 1 cause of death globally? Even though the efforts to prevent it are quite simple, most people still do not have any idea about what caused it and how to prevent it. In this article, we will discuss several important facts related to CVDs, from the cases to the simple daily routines that help us avoid getting CVDs. Several days ago I met dr. Zackie. He is an alumnus of the Faculty of Medicine at the University of Indonesia, who has been working on a research project related to CVDs. He said that in Indonesia alone, the number of people who are aware of cardiac health is very small, which about 30% of the total population in Indonesia, much less almost 100% of the 30% population were in the urban area. It shows that there is so much discrepancy between the urban area and the rural area, especially in the context of accessibility to healthcare and education about cardiac health. He said that the education of CVDs prevention plays an important role to help minimize the CVDs case in Indonesia. The digitalization of education might help the government to reach more its people with fewer costs.",
                style: TextStyle(
                    fontSize: 16)),
              ],
            ),
    );
  }
}
