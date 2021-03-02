import 'package:flutter/material.dart';

import 'package:pixplace/pages.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:pixplace/src/HomeState.dart';


class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SplashScreen(
      navigateAfterSeconds: Home(),
      seconds: 1,

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