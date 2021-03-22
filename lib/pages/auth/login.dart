import 'package:flutter/material.dart';
import 'file:///C:/Users/tasya/Desktop/heartrate/lib/pages/auth/register.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../BottomNavPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;
  String useruid;
  String emailLoggedin;
  String errormsg='';

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
                "Login Page",
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
                    email = value; // get value from TextField
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width:300,
                child:TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value; //get value from textField
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                ),
              ),
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
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    print('useruid ' + newUser.user.uid.toString());
                    useruid = newUser.user.uid.toString();
                    emailLoggedin = newUser.user.email;

                    if (newUser != null) {
                      print('login successfull');
                      setState(() {
                        showProgress = false;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavPage()),
                      );
                    }
                  } catch (e) {
                      setState(() {
                        errormsg = 'Invalid email or password';
                        showProgress = false;
                    });
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Text(errormsg, style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have account yet? ",
                      style: TextStyle(
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}