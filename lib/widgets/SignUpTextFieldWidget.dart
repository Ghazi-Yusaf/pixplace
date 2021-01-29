import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pixplace/static/Validator.dart';

enum TextFieldType {
  email,
  password,
  username
}

class SignUpTextFieldWidget extends StatefulWidget {

  final TextEditingController textController;
  final TextFieldType textFieldType;
  final String hintText;
  final IconData prefixIcon;

  SignUpTextFieldWidget({
    this.textController,
    this.textFieldType,
    this.hintText,
    this.prefixIcon,
  });

  @override
  _SignUpTextFieldWidgetState createState() => _SignUpTextFieldWidgetState();
}

class _SignUpTextFieldWidgetState extends State<SignUpTextFieldWidget> {

  bool obscureText;
  String tooltipText;
  IconData suffixIcon;
  TextInputType keyboard;
  Function validator;

  @override
  void initState() {
    super.initState();

    widget.textController.addListener(() {
      setState(() {});
    });

    switch (widget.textFieldType) {
      case TextFieldType.username: {
        obscureText = false;
        tooltipText = "Valid Username";
        suffixIcon = null;
        validator = Validator.usernameValidator;
        keyboard = TextInputType.name;
      }
      break;

      case TextFieldType.email: {
        obscureText = false;
        tooltipText = "Valid Email";
        suffixIcon = null;
        validator = Validator.emailValidator;
        keyboard = TextInputType.emailAddress;
      }
      break;

      case TextFieldType.password: {
        obscureText = true;
        tooltipText = "Valid Password";
        suffixIcon = null;
        validator = Validator.passwordValidator;
        keyboard = TextInputType.text;
      }
      break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      obscureText: obscureText,
      keyboardType: keyboard,
      cursorColor: Colors.black,

      onChanged: (text) {
        suffixIcon = validator(text) != null ? null : Icons.check;
      },

      validator: validator,

      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0
      ),

      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.black12,
        focusColor: Colors.pink,

        hintStyle: TextStyle(
          color: Colors.black,
        ),

        prefixIcon: Icon(
          widget.prefixIcon,
          size: 22.0,
          color: Colors.pink,
        ),

        suffixIcon: IconButton(
          onPressed: null,

          mouseCursor: SystemMouseCursors.basic,
          tooltip: suffixIcon != null ? tooltipText : null,
          icon: Icon(suffixIcon),
          iconSize: 22.0,
          color: Colors.black,
        ),

        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.pink),
        ),

        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.pink),
        ),
      ),
    );
  }
}