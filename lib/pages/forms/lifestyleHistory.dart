import 'package:flutter/material.dart';
import 'package:heartrate/pages/result.dart';

class LifestyleHistory extends StatefulWidget {

  const LifestyleHistory({Key key}) : super(key: key);

  @override
  LifestyleHistoryState createState() => new LifestyleHistoryState();
}

class LifestyleHistoryState extends State<LifestyleHistory> {
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          margin: const EdgeInsets.all(30),
        child: ListView(
          children: [
                SizedBox(height:30),
                Text("Alcohol and Cigarretes...",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),

                // 1st question: Drinking Status
                Text("How about your drinking status?",
                  style: TextStyle(fontSize: 20)),
                Column(
                    children: [
                      Row(
                          children: [
                            new Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'I never drank alcohol in my life.',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                          ]
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Expanded(
                            child: new Text(
                              'I have stopped drinking alcohol for more than 1 year',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Expanded(
                            child: new Text(
                              'I have stopped drinking alcohol for less than 1 year',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: 3,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            'I’m still drinking alcohol',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],

                ),

                // 2nd question: Smoking Status
                Text("How about your smoking status?...",
                    style: TextStyle(fontSize: 20)),
                Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Expanded(
                        child: new Text(
                          'I have never smoked or have smoked fewer than 100 cigarettes in my lifetime.',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ]
                ),
                Row(
                  children: [
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Expanded(
                      child: new Text(
                        'I have stopped smoking for more than 1 year',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    new Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Expanded(
                      child: new Text(
                        'I have stopped smoking for less than 1 year',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    new Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'I’m still smoking cigarretes.',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],

            ),

                // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                    color: Colors.red,
                    textColor: Colors.red,
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    onPressed: null,
                    child: Text(
                      "Previous",
                      style: TextStyle(fontSize: 16.0),
                    ),
                ),
                FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Result(avgBPM: widget.avgBPM, heartCondition: widget.heartCondition)),
                    // );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),

              ],
            )
        ),
    );
  }
}