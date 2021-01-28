import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pixplace/static/Validator.dart';

enum TextFieldType {
  email,
  passwordEntry,
  passwordCreation,
  username
}

class LoginTextFieldWidget extends StatefulWidget {

  final TextFieldType textFieldType;
  final String hintText;
  final IconData prefixIcon;

  LoginTextFieldWidget({
    this.textFieldType,
    this.hintText,
    this.prefixIcon,
  });

  @override
  _LoginTextFieldWidgetState createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {

  TextEditingController textEditingController;

  bool obscureText;
  String tooltipText;
  IconData suffixIcon;
  Function validator;

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      setState(() {});
    });

    switch (widget.textFieldType) {
      case TextFieldType.username: {
        obscureText = false;
        tooltipText = "Valid Username";
        suffixIcon = null;
        validator = Validator.usernameValidator;
      }
      break;

      case TextFieldType.email: {
        obscureText = false;
        tooltipText = "Valid Email";
        suffixIcon = null;
        validator = Validator.emailValidator;
      }
      break;

      case TextFieldType.passwordEntry: {
        obscureText = true;
        tooltipText = "Show Password";
        suffixIcon = Icons.visibility;
        validator = Validator.passwordValidator;
      }
        break;

      case TextFieldType.passwordCreation: {
        obscureText = true;
        tooltipText = "Valid Password";
        suffixIcon = null;
        validator = Validator.passwordValidator;
      }
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      if (suffixIcon == Icons.visibility) {
        suffixIcon = Icons.visibility_off;
        obscureText = false;
        tooltipText = "Hide Password";
        return;
      }
      
      if (suffixIcon == Icons.visibility_off) {
        suffixIcon = Icons.visibility;
        obscureText = true;
        tooltipText = "Show Password";
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      cursorColor: Colors.black,

      onChanged: (text) {
        if (widget.textFieldType != TextFieldType.passwordEntry) {
          suffixIcon = validator(text) != null ? null : Icons.check;
        }
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

        hintStyle: TextStyle(
          color: Colors.black,
        ),
        
        focusColor: Colors.pink,

        prefixIcon: Icon(
          widget.prefixIcon,
          size: 22.0,
          color: Colors.pink,
        ),

        suffixIcon: IconButton(
          onPressed: _toggleVisibility,

          mouseCursor: widget.textFieldType == TextFieldType.passwordEntry ? SystemMouseCursors.click : SystemMouseCursors.basic,
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