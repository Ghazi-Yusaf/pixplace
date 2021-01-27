import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final Function onPressed;

  ButtonWidget({this.title, this.textColor, this.buttonColor, this.borderColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      
      child: Ink(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
                  color: borderColor != null ? borderColor : Colors.white,
                  width: 1.0,
                  )
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
