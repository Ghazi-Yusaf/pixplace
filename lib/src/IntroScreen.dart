import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pixplace/src/ErrorPage.dart';
import 'package:pixplace/src/LoginPage.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;

    return new SplashScreen(
      navigateAfterSeconds: result != null ? ErrorPage("wow you made it") : LoginPage(),
      seconds: 3,

      title: new Text(
        'Welcome!\n',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),

      image: Image.asset(
        'assets/backgrounds/IntroScreenBackground.png',
        fit: BoxFit.scaleDown
      ),
      
      backgroundColor: Colors.pink,
      loadingText: Text("   Loading PixPlace..."),

      styleTextUnderTheLoader: TextStyle(
        fontSize: 25.0,
      ),
      photoSize: 220.0,
      loaderColor: Colors.white
    );
  }
}