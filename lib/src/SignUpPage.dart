import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pixplace/src/VerificationPage.dart';
import 'package:pixplace/static/Errors.dart';

import 'package:transition/transition.dart';

import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/SignUpTextFieldWidget.dart';
import 'package:pixplace/widgets/WaveWidget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  bool termsAgreed = false;

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
                  '      New here?\nLet\'s get started!',
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

            child: Form(
              key: _formKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: <Widget>[
                  SignUpTextFieldWidget(
                    textController: usernameController,
                    textFieldType: TextFieldType.username,
                    hintText: "Username",
                    prefixIcon: Icons.person_outline,
                  ),

                  SizedBox(
                    height: 15.0,
                  ),

                  SignUpTextFieldWidget(
                    textController: emailController,
                    textFieldType: TextFieldType.email,
                    hintText: "Email",
                    prefixIcon: Icons.mail_outline,
                  ),

                  SizedBox(
                    height: 15.0,
                  ),

                  SignUpTextFieldWidget(
                    textController: passwordController,
                    textFieldType: TextFieldType.password,
                    hintText: "Password",
                    prefixIcon: Icons.lock_outline,
                  ),

                  SizedBox(
                    height: 15.0,
                  ),

                  SignUpTextFieldWidget(
                    textController: reEnterPasswordController,
                    textFieldType: TextFieldType.password,
                    hintText: "Re-enter Password",
                    prefixIcon: Icons.lock_outline,
                  ),

                  SizedBox(
                    height: 25.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),

                    child: CheckboxListTile(
                      title: Text(
                        "I have read and agree to the terms and conditions. (required)",
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.pink,
                      value: termsAgreed,

                      onChanged: (value) {
                        setState(() {
                          termsAgreed = value;
                        });
                      }
                    ),
                  ),

                  SizedBox(
                    height: 35.0,
                  ),

                  ButtonWidget(
                    title: "Sign Up",
                    buttonColor: Colors.pink,
                    textColor: Colors.white,

                    onPressed: termsAgreed ? () async {
                      if (_formKey.currentState.validate()) {
                        if (passwordController.text != reEnterPasswordController.text) {
                          Errors.displayErrorDialog(context, "The passwords do not match.");
                        }
                        else if (await UserManager.createUser(usernameController.text, emailController.text, passwordController.text)) {
                          Navigator.push(
                            context,
                            Transition(
                              child: VerificationPage(),
                              transitionEffect: TransitionEffect.rightToLeft,
                            ).builder()
                          );
                        }
                        else {
                          Errors.displayErrorDialog(context, UserManager.firebaseAuthException.message);
                        }
                      }
                    } : null
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}