import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
        navigateAfterSeconds: Text("test"),
        seconds: 5,
        title: new Text(
          'Welcome To PixPlace!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/backgrounds/IntroScreenBackground.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}