import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/src/IntroScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialisation = Firebase.initializeApp();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialisation,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Fail");
        }
      }
    )
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PixPlace',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: IntroScreen(),
    );
  }
}
