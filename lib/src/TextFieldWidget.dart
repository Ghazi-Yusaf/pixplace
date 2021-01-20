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
        color: Colors.pink,
        fontSize: 17.0,
      ),
      cursorColor: Colors.pink,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.pink,
        ),
        prefixIcon: Icon(
          prefixIconData,
          size: 22,
          color: Colors.pink,
        ),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Colors.pink,
        ),
        filled: true,
        fillColor: Colors.teal[50],
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.pink),
        ),
        labelStyle: TextStyle(color: Colors.pink),
        focusColor: Colors.pink,
      ),
    );
  }
}