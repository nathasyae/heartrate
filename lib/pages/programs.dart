import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heartrate/pages/dailyroutines.dart';
import 'package:heartrate/pages/materials/audioMaterial.dart';

import 'materials/readingMaterial.dart';

class Programs extends StatefulWidget {
  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Programs> {

  @override
  Widget build(BuildContext context) {
    double cardTitleFontSize = 24;
    double sectionTitleFontSize = 22;
    List<Widget> packagesWidgets = [
      Container(
        margin: EdgeInsets.fromLTRB(0,0,5,0),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: "/DailyRoutines"),
                  builder: (context) => DailyRoutines())
          ),
          child: Image(image: AssetImage('assets/images/packagesactive1.png')),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: "/DailyRoutines"),
                  builder: (context) => DailyRoutines())
          ),
          child: Image(image: AssetImage('assets/images/packagesactive2.png')),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/packagesnon1.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/packagesnon2.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/packagesnon3.png')),
      ),
    ];

    List<Widget> audioWidgets = [
      Container(
        margin: EdgeInsets.fromLTRB(0,0,5,0),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: "/DailyRoutines"),
                  builder: (context) => AudioMaterial())
          ),
          child: Image(image: AssetImage('assets/images/audioactive.png')),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
          child: Image(image: AssetImage('assets/images/audionon3.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/audionon1.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/audionon2.png')),
      ),
    ];

    List<Widget> exerciseWidgets = [
      Container(
        margin: EdgeInsets.fromLTRB(0,0,5,0),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: "/DailyRoutines"),
                  builder: (context) => DailyRoutines())
          ),
          child: Image(image: AssetImage('assets/images/exerciseactive.png')),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/exercisenon1.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/exercisenon2.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/exercisenon3.png')),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(5,0,5,0),
        child: Image(image: AssetImage('assets/images/exercisenon4.png')),
      ),
    ];

    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: new ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(height: 50),

                    // DAILY ROUTINES
                    Container(
                      margin: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: "/DailyRoutines"),
                                builder: (context) => DailyRoutines())
                        ),
                        child: Image(image: AssetImage('assets/images/routine_card.png')),
                      ),
                    ),

                    // BROWSE ALL PACKAGES
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Browse All Programs",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: new ListView(
                                scrollDirection: Axis.horizontal,
                                children: packagesWidgets,
                              )
                            )
                          )
                        ],
                      ),
                    ),

                    // BROWSE ALL EXERCISE MATERIALS
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Browse All Exercise",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                                  height: 200.0,
                                  child: new ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: exerciseWidgets,
                                  )
                              )
                          )
                        ],
                      ),
                    ),

                    // BROWSE ALL AUDIO MATERIALS
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Browse All Audio Materials",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                                  height: 200.0,
                                  child: new ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: audioWidgets,
                                  )
                              )
                          )
                        ],
                      ),
                    ),

                    // BROWSE ALL READING MATERIALS
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Browse All Reading Materials",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: "/DailyRoutines"),
                                builder: (context) => ReadingMaterial())
                        ),
                        child: Image(image: AssetImage('assets/images/article_card.png')),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: "/DailyRoutines"),
                                builder: (context) => ReadingMaterial())
                        ),
                        child: Image(image: AssetImage('assets/images/article_card.png')),
                      ),
                    ),

                    // <<<===================#3 ENDS OF ARTICLES SECTION
                  ],
                ),
              // =================================== ROOT COLUMN ENDS=====<<<
              ),
            ),
          ],
        ),
      );
    }
  doNothing(){}

}