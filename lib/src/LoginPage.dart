import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/src/ForgotPasswordPage.dart';
import 'package:pixplace/src/IntroPage.dart';
import 'package:pixplace/static/Errors.dart';
import 'package:transition/transition.dart';

import 'package:pixplace/src/SignUpPage.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/LoginTextFieldWidget.dart';
import 'package:pixplace/widgets/WaveWidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  'Welcome to PixPlace!',
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
            padding: const EdgeInsets.all(25.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                LoginTextFieldWidget(
                  textController: emailController,
                  textFieldType: TextFieldType.email,
                  hintText: "Email",
                  prefixIcon: Icons.mail_outline,
                ),

                SizedBox(
                  height: 15.0,
                ),

                LoginTextFieldWidget(
                  textController: passwordController,
                  textFieldType: TextFieldType.password,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                ),

                SizedBox(
                  height: 10.0,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () {
                      Navigator.push(
                        context,
                        Transition(
                          child: ForgotPasswordPage(),
                          transitionEffect: TransitionEffect.rightToLeft,
                        ).builder()
                      );
                    },

                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15.0
                      ),
                    ),
                  )
                ),

                SizedBox(
                  height: 50.0,
                ),

                ButtonWidget(
                  title: "Login",
                  buttonColor: Colors.pink,
                  textColor: Colors.white,

                  onPressed: () async {
                    if (!await UserManager.loginUser(emailController.text.trim(), passwordController.text)) {
                      Errors.displayErrorDialog(context, UserManager.firebaseAuthException.message);
                    }
                    else if (!await UserManager.isEmailVerified()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Email has not been verified, please check your emails."),
                            actions: [
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }
                              ),
                              FlatButton(
                                child: Text("Resend Email"),
                                onPressed: () async {
                                  await UserManager.loginUser(emailController.text.trim(), passwordController.text);
                                  await UserManager.sendEmailVerification();
                                  await UserManager.logoutUser();
                                  Navigator.of(context).pop();
                                }
                              )
                            ],
                          );
                        }
                      );
                    }
                    else {
                      Navigator.push(
                        context,
                        Transition(
                          child: IntroPage(),
                          transitionEffect: TransitionEffect.leftToRight,
                        ).builder()
                      );
                    }
                  },
                ),

                SizedBox(
                  height: 50.0,
                ),
                
                InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Navigator.push(
                      context,
                      Transition(
                        child: SignUpPage(),
                        transitionEffect: TransitionEffect.rightToLeft,
                      ).builder()
                    );
                  },

                  child: Text(
                    "Don't have an account? Sign up here",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 18.0
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}