import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heartrate/components/button.dart';
import 'package:wakelock/wakelock.dart';
// import 'chart.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heartrate/style.dart';
import 'package:flutter/material.dart';

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
    List<Widget> widgets = [
      Container(
        child: Card(
          child: InkWell(
            splashColor: Colors.white.withAlpha(150),
            onTap: () {
              // TO-DO: Put onClickHandlerFuction HERE!
              //print('Card tapped.');
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 160,
              height: 205,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.33),
                      BlendMode.darken
                  ),
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                  ),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Healthy Food Programs",
                      style: TextStyle(
                        fontSize: cardTitleFontSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )
                  )
              ),
            ),
          ),
        ),
      ),
      // ======= END OF #2-1st COL=====
      // ======= #2-2nd COL BEGINS=====
      Container(
        child: Card(
          child: InkWell(
            splashColor: Colors.white.withAlpha(150),
            onTap: () {
              // TO-DO: Put onClickHandlerFuction HERE!
              //print('Card tapped.');
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 160,
              height: 205,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.33),
                      BlendMode.darken
                  ),
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                  ),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Healthy Food Programs",
                      style: TextStyle(
                        fontSize: cardTitleFontSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )
                  )
              ),
            ),
          ),
        ),
      ),
      // ======= END OF #2-2nd COL=====
      // ======= #2-2nd COL BEGINS=====
      Container(
        child: Card(
          child: InkWell(
            splashColor: Colors.white.withAlpha(150),
            onTap: () {
              // TO-DO: Put onClickHandlerFuction HERE!
              //print('Card tapped.');
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 160,
              height: 205,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.33), BlendMode.darken),
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                  ),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Healthy Food Programs",
                      style: TextStyle(
                        fontSize: cardTitleFontSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )
                  )
              ),
            ),
          ),
        ),
      ),
      // ======= END OF #2-2nd COL=====
    ];
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: new ListView(
                  scrollDirection: Axis.vertical, // =================================== ROOT COLUMN BEGINS=====<<<
                  children: <Widget>[
                    // ============ #1 CARD BEGINS
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 250,
                      width: double.maxFinite,
                      child: Card(
                        //color: Colors.redAccent[100],
                        child: InkWell(
                          splashColor: Colors.white.withAlpha(150),
                          onTap: () {
                              // TO-DO: Put onClickHandlerFuction HERE!
                            //print('Card tapped.');
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.22),
                                    BlendMode.darken
                                ),
                                image: NetworkImage(
                                  // CHANGE IMAGE SRC HERE
                                  "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                                ),
                              )
                            ),
                            child: Column(
                              verticalDirection: VerticalDirection.up,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: ListTile(
                                    tileColor: Colors.white,
                                    subtitle: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                      child: Text('Short description about the program will '
                                          'be explained here.')
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Title of The Program',
                                    style: TextStyle(
                                      fontSize: cardTitleFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                                ),
                              ],
                            ),
                          ),
                        ), //ink
                      ),
                    ), // <<<<<============ #1 CARD ENDS HERE
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
                      child: Row( //<<<<<============ #2 CARD ROW BEGINS HERE
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: new ListView(
                                scrollDirection: Axis.horizontal,
                                children: widgets,
                              )
                            )
                          )
                          // ======= #2-1st COL BEGINS=====

                        ],
                      ), //<<<<<============ #2 CARD ROW ENDS HERE
                    ),
                    // <<<===================#3 ARTICLES SECTION BEGINS HERE
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Articles",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: sectionTitleFontSize,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 250,
                      width: double.maxFinite,
                      child: Card(
                        //color: Colors.redAccent[100],
                        child: InkWell(
                          splashColor: Colors.white.withAlpha(150),
                          onTap: () {
                            // TO-DO: Put onClickHandlerFuction HERE!
                            //print('Card tapped.');
                          },
                          child: Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.22),
                                      BlendMode.darken
                                  ),
                                  image: NetworkImage(
                                    // CHANGE IMAGE SRC HERE
                                      "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                                  ),
                                )
                            ),
                            child: Column(
                              verticalDirection: VerticalDirection.up,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: ListTile(
                                    tileColor: Colors.white,
                                    subtitle: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                        child: Text(
                                            'Short description about the program will '
                                            'be explained here.')
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Title of The Program',
                                      style: TextStyle(
                                        fontSize: cardTitleFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ), //ink
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