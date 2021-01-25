import 'package:flutter/material.dart';
import 'package:pixplace/src/LoginModel.dart';
import 'package:provider/provider.dart';

class LoginTextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  LoginTextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 17.0,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 20,
          color: Colors.pink,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            if (suffixIconData == Icons.visibility ||
                suffixIconData == Icons.visibility_off)
              loginModel.isVisible = !loginModel.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Colors.black,
          ),
        ),
        filled: true,
        fillColor: Colors.black12,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: TextStyle(color: Colors.black),
        focusColor: Colors.pink,
      ),
    );
  }
}
