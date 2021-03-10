import 'package:flutter/material.dart';
import 'package:heartrate/BottomNavPage.dart';
import 'package:heartrate/pages/result.dart';
import 'package:heartrate/style.dart';

class Invalid extends StatefulWidget {
  @override
  InvalidView createState() {
    return InvalidView();
  }
}

class InvalidView extends State<Invalid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(30),
            child: SafeArea(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Oops.. there’s something wrong",
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        SizedBox(height: 50),
                        Image(image: AssetImage('assets/images/invalid_img.png')),
                        SizedBox(height: 50),
                        Text("Looks like your finger moves too fast or vibrating. Please try again...",
                            style: mainTheme.textTheme.bodyText1,
                            textAlign: TextAlign.center),
                        SizedBox(height: 50),
                        FlatButton(
                          minWidth: 250,
                          color: Colors.red,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(10.0),
                          // splashColor: secondaryRed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.red)
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => BottomNavPage())
                            );
                          },
                          child: Text(
                            "Try Again",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ]
                  )
              )

            )
        )
    );
  }

}