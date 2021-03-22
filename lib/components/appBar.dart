import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  final String title;

  const appBar(
      {Key key, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title,
          style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white);
  }

}
