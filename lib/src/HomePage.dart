import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("PixPlace",style:TextStyle(color: Colors.black)), backgroundColor: Colors.white, elevation: 0,),
      body: Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}