import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/static/Errors.dart';

import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/LoginTextFieldWidget.dart';
import 'package:pixplace/widgets/WaveWidget.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200.0,
            color: Colors.pink,
          ),

          IconButton(
            iconSize: 50.0,

            onPressed: () {
              Navigator.pop(context);
            },

            icon: Icon(
              Icons.arrow_back, 
              color: Colors.white,
            ),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,

            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Colors.white,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'Forgotten your password?\n               No problem.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: size.height / 2.4),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(
                  '          It happens to the best of us.\n   We\'ll send a reset link to your email\nFollow the link, create a new password\n                 and you\'re good to go!',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, size.height / 1.8, 25.0, 25.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                LoginTextFieldWidget(
                  textController: emailController,
                  textFieldType: TextFieldType.email,
                  hintText: "Email",
                  prefixIcon: Icons.mail_outline,
                ),

                SizedBox(
                  height: 140.0,
                ),

                ButtonWidget(
                  title: "Reset password",
                  buttonColor: Colors.pink,
                  textColor: Colors.white,

                  onPressed: () async {
                    if (!await UserManager.resetPassword(emailController.text)) {
                      Errors.displayErrorDialog(context, UserManager.firebaseAuthException.message);
                    }
                    else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Reset email sent"),
                            content: Text("Follow the link in the email to reset your password"),
                            actions: [
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                }
                              )
                            ],
                          );
                        }
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}