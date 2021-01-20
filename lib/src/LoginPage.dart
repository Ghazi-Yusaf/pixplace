import 'package:flutter/material.dart';
import 'package:pixplace/widgets/TextFieldWidget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextFieldWidget(
              hintText: 'Email',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              suffixIconData: Icons.ac_unit,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFieldWidget(
              hintText: 'Password',
              obscureText: true,
              prefixIconData: Icons.lock_outline,
              suffixIconData: Icons.remove_red_eye,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}