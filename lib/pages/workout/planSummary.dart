import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'actionDetail.dart';
import 'finishPage.dart';

class PlanSummary extends StatefulWidget {
  @override
  _PlanSummaryState createState() => _PlanSummaryState();
}

class _PlanSummaryState extends State<PlanSummary> {


  List<bool> isDone = [
    false, false, false, false
  ];

  Future navigateToDetailPage(context, SubPage) async {
    List<bool> result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage));
    setState(() {
      isDone = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cardTitleFontSize = 24;
    double sectionTitleFontSize = 22;

    List<String> cards = [
    'assets/images/card1.png',
    'assets/images/card2.png',
    'assets/images/card3.png',
    'assets/images/card4.png',
    ];

    List<String> thumbnail = [
      'assets/images/thumb1.png',
      'assets/images/thumb2.png',
      'assets/images/thumb3.png',
      'assets/images/thumb4.png'
    ];

    List<String> actionListName = [
      "Push up (2 rep)",
      "Jogging (2 mins)",
      "Lunges (3 rep)",
      "Jumping jacks (2 rep)"
    ];

    List<String> urls = [
      "https://storageaccountdefaua0cf.blob.core.windows.net/cardiwatch-content/workout-videos/running.mp4",
      "https://storageaccountdefaua0cf.blob.core.windows.net/cardiwatch-content/workout-videos/Jumpingjack.mp4",
      "https://storageaccountdefaua0cf.blob.core.windows.net/cardiwatch-content/workout-videos/running.mp4",
      "https://storageaccountdefaua0cf.blob.core.windows.net/cardiwatch-content/workout-videos/Jumpingjack.mp4",
    ];

    List<String> pressUpItems = [
      "Tighten your abs, glutes, and thighs.",
    "Lower yourself down so that your chest touches the floor.",
    "Push back up, then bring one knee towards the opposite hand.",
    "Lower back down into a push up, then repeat on the opposite side.",
    "Repeat 12 times."
    ];

    List<String> jumpingItems = [
      "Start stand up with arms position by your sides.",
      "Engage the core slightly and set the shoulders, then get ready for movement.",
      "Keep arms and legs straight without making it stiff out,  concurrently jump the legs out to the sides and raise the arms to shoulder height.",
      "Stabilize your body",
      "Return to starting position and repeat it with controlled pace."
    ];

    List<String> joggingItems = [
      "Walk with slightly fast pace",
      "Keep the pace",
      "Maintain your breathing and keep it up"
    ];

    List<String> lungesItems = [
      "standup straight with your arms at your sides and your feet about five-six inces apart",
      "step forward with your right leg, lowering your body until both knees are bent at a 90-degree angle",
      "Keep your back straight and your chin up",
      "Your abs should be pulled in",
      "Use your hamstrings and glutes to push yourself back up to the original position",
    ];

    List<List> items = [ pressUpItems, joggingItems, lungesItems, jumpingItems ];



    return Scaffold(
        appBar: AppBar(
          title: Text(
            "7 Minutes Light Cardio", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        bottomSheet: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3) // changes position of shadow
              ),]
          ),
          alignment: Alignment.center,
            child: TextButton(
              child: Text("Finish exercise", style: TextStyle(fontSize: 16.0)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinishPage())
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
        ),
        body: ListView(
            children: [

              SizedBox(height: 10),
              // Dynamic Exercise
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dynamic Light Exercise",
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
                                child: new ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: actionListName.length,
                                    itemBuilder: (BuildContext context, int index) =>
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0,0,5,0),
                                          child: GestureDetector(
                                            onTap: () {
                                              navigateToDetailPage(context,
                                                  ActionDetail(index: index, isDone: isDone, url: urls[index], items: items[index]));
                                            },
                                            child: Image(image: AssetImage(cards[index])),
                                          ),
                                        ),
                                )
                                )
                            )
                          ],
                        ),
                  ),

              // Action List
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Action List",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: sectionTitleFontSize,
                  ),
                ),
              ),


              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: actionListName.length,
                itemBuilder: (BuildContext context, int index) =>
                    ListTile(
                      leading: Image.asset(thumbnail[index]),
                      title: Text(actionListName[index]),
                      trailing: (isDone[index]) ? Icon(Icons.check) : null,
                    ),

              ),

            ]
        )
    );
  }
}