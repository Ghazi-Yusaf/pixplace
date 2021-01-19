import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.blue,
        fontSize: 17.0,
      ),
      cursorColor: Colors.pinkAccent,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 22,
          color: Colors.pinkAccent,
        ),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Colors.pinkAccent,
        ),
        filled: true,
        fillColor: Colors.teal[50],
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.pinkAccent),
        ),
        labelStyle: TextStyle(color: Colors.pinkAccent),
        focusColor: Colors.pinkAccent,
      ),
    );
  }
}
