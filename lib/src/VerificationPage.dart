import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/widgets/WaveWidget.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailIsVerified();
    });
  }

  Future<void> checkEmailIsVerified() async {
    if (await UserManager.isEmailVerified()) {
      timer.cancel();
      await UserManager.logoutUser();
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: <Widget>[
          Container(
            height: size.height / 2.0,
            color: Colors.pink[300],
          ),

          WaveWidget(
            size: size,
            yOffset: size.height / 3.0,
            color: Colors.pink,
          ),

          WaveWidget(
            size: size,
            yOffset: size.height / 1.5,
            color: Colors.pink[700],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 2.65),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  '     Thanks for joining us!\n  We\'ve sent you an email.\nFollow the link in the email\n      to verify your account\n  and continue to PixPlace!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 1.65),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  '(You will be redirected to the login page)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}