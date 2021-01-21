import 'package:flutter/material.dart';
import 'package:pixplace/src/LoginModel.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final loginModel = Provider.of<LoginModel>(context);

    return Provider(
      create: (context) => LoginPage(),
      child: Scaffold(
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
                suffixIconData: loginModel.isValid ? Icons.check : null,
                onChanged: (value) {
                  loginModel.isValidEmail(value);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFieldWidget(
                    hintText: 'Password',
                    obscureText: loginModel.isVisible ? false : true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: loginModel.isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                title: 'Login',
                hasBorder: false,
              ),
              SizedBox(
                height: 10.0,
              ),
              ButtonWidget(
                title: 'Sign Up',
                hasBorder: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}