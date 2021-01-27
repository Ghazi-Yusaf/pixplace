import 'package:flutter/material.dart';

class LoginTextFieldWidget extends StatefulWidget {

  final String labelText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool obscureText;
  final Function validator;

  LoginTextFieldWidget({
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
  });

  @override
  _LoginTextFieldWidgetState createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0
      ),

      
    );
  }
}