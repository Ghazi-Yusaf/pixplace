import 'package:flutter/material.dart';
import 'package:pixplace/src/LoginModel.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/LoginTextFieldWidget.dart';
import 'package:pixplace/widgets/WaveWidget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);
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
            padding: const EdgeInsets.only(top: 120.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to\n    PixPlace!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                LoginTextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                ),
                SizedBox(
                  height: 10.0,
                ),
                LoginTextFieldWidget(
                  hintText: 'Username',
                  obscureText: false,
                  prefixIconData: Icons.person_outline_rounded,
                ),
                SizedBox(
                  height: 10.0,
                ),
                new LoginTextFieldWidget(
                  hintText: 'Enter Password',
                  obscureText: loginModel.isVisible ? false : true,
                  prefixIconData: Icons.lock_outline,
                  suffixIconData: loginModel.isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                SizedBox(
                  height: 10.0,
                ),
                new LoginTextFieldWidget(
                  hintText: 'Re-enter Password',
                  obscureText: loginModel.isVisible ? false : true,
                  prefixIconData: Icons.lock_outline,
                ),
                SizedBox(
                  height: 40.0,
                ),
                ButtonWidget(
                  title: 'Make Account',
                  hasBorder: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
