import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:transition/transition.dart';

import 'package:pixplace/firebase/Authentication.dart';
import 'package:pixplace/src/LoginPage.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/SignUpTextFieldWidget.dart';
import 'package:pixplace/widgets/WaveWidget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  Authentication authenticator = Authentication();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              Navigator.push(
                context,
                Transition(
                  child: LoginPage(),
                  transitionEffect: TransitionEffect.leftToRight,
                ).builder()
              );
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
            padding: const EdgeInsets.only(top: 120.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'Account Creation',
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
                        User user = await authenticator.createUser(usernameController.text, emailController.text, passwordController.text);
                        if (user == null) {
                          authenticator.displayError(context);
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