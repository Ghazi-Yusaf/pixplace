import 'package:flutter/material.dart';

import '../pages.dart';

class MenuOptions {
  static const String settings = "Settings";
  static const String help = "Help";
  static const List<String> options = <String>[settings, help];
}

Widget appBar(String title) => AppBar(
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
          return MenuOptions.options.map((String option) {
            return PopupMenuItem<String>(
              value: option,
              child: TextButton(
                onPressed: () {},
                child: Text("asdad"),
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
