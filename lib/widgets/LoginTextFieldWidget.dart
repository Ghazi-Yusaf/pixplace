import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum TextFieldType {
  email,
  password,
}

class LoginTextFieldWidget extends StatefulWidget {

  final TextEditingController textController;
  final TextFieldType textFieldType;
  final String hintText;
  final IconData prefixIcon;

  LoginTextFieldWidget({
    this.textController,
    this.textFieldType,
    this.hintText,
    this.prefixIcon,
  });

  @override
  _LoginTextFieldWidgetState createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {

  bool obscureText;
  String tooltipText;
  IconData suffixIcon;

  @override
  void initState() {
    super.initState();

    widget.textController.addListener(() {
      setState(() {});
    });

    switch (widget.textFieldType) {

      case TextFieldType.email: {
        obscureText = false;
        suffixIcon = null;
      }
      break;

      case TextFieldType.password: {
        obscureText = true;
        tooltipText = "Show Password";
        suffixIcon = Icons.visibility;
      }
      break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.textController.dispose();
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
      controller: widget.textController,
      obscureText: obscureText,
      cursorColor: Colors.black,

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
          onPressed: _toggleVisibility,

          mouseCursor: widget.textFieldType == TextFieldType.password ? SystemMouseCursors.click : SystemMouseCursors.text,
          tooltip: tooltipText,
          icon: Icon(suffixIcon),
          iconSize: 22.0,
          color: Colors.black,
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