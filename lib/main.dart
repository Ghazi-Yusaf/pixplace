import 'package:flutter/material.dart';
import 'package:pixplace/src/SplashScreen.dart';
import 'package:pixplace/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixPlace',
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}