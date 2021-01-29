import 'package:flutter/material.dart';
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Oops.. there’s something wrong",
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("Looks like your finger moves too fast or vibrating. Please try again...",
                          style: mainTheme.textTheme.bodyText1),
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
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back to Home",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }

}