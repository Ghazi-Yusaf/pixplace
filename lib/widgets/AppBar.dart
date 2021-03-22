import 'package:flutter/material.dart';
import 'package:pixplace/firebase/UserManager.dart';

import '../pages.dart';

class Button {
  String name;
  void Function() onPressed;

  Button(this.name, this.onPressed);
}

Widget appBar(BuildContext context, String title) {
  List<Button> options = [
    Button(
        "Settings",
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Feed()))),
    Button(
        "Help",
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Feed()))),
    Button("Logout", () async {
      await UserManager.logoutUser();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
    }),
  ];
  return AppBar(
    bottom: PreferredSize(
        child: Container(
          color: Colors.pink,
          height: 1,
        ),
        preferredSize: Size.fromHeight(1)),
    centerTitle: true,
    leading: PopupMenuButton<String>(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context) {
        return options.map((Button button) {
          return PopupMenuItem<String>(
            value: button.name,
            child: TextButton(
              onPressed: button.onPressed,
              child: Text(button.name),
            ),
          );
        }).toList();
      },
    ),
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
