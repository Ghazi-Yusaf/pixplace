import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("test")
      ),

      body: Container(
        child: Text(
          "Challenges",
          textAlign: TextAlign.center,
          textScaleFactor: 3,
        ),
        color: Colors.grey,
        padding: EdgeInsets.symmetric(vertical: 40),
        width: _width,
      ),



    );
  }
}
