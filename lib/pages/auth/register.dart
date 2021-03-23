import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heartrate/homePage.dart';
import 'package:heartrate/models/UserData.dart';
import 'package:heartrate/pages/forms/personalInfo.dart';
import 'login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:http/http.dart' as http;


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;
  String errormsg ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/logo-text.png'),
                width: 200,
              ),
              SizedBox(height: 30),
              Text(
                "Registration Page",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value; //get the value entered by user.
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                  ),),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 300,
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value; //get the value entered by user.
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                ),
              ),
              SizedBox(height: 10),
              Text("Password has to be at least 6 characters", style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                minWidth: 300,
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
                onPressed: () async {
                  setState(() {
                    showProgress = true;
                  });
                  try {
                    final newuser =
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    postProfiletoDB(newuser.user.uid, email);

                    if (newuser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInfo()),
                      );
                      setState(() {
                        showProgress = false;
                      });
                    }
                  } catch (e) {
                    setState(() {
                      errormsg = 'Please provide correct email and/or password';
                      showProgress = false;
                    });
                    print('error register ' + e.toString());
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Text(errormsg),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Already registered? ',
                    style: TextStyle(
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Login Now',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> postProfiletoDB(String uid, String email) async {
    bool isDone = false;

    final http.Response response = await http.post(
      'https://cardiwatch-core-frontendapi.azurewebsites.net/api/profile/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'uid': uid,
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      debugPrint('RESJSON success');
    } else if (response.statusCode == 400){
      debugPrint('RESJSON ' + response.toString());
    } else {
      debugPrint('RESJSON fail ' +response.statusCode.toString());
      throw Exception('Failed to load');
    }

    if(response!=null){
      isDone = true;
    }

    return isDone;

  }

}