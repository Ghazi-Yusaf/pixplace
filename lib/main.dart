import 'package:flutter/material.dart';
import 'plugins.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixPlace',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}