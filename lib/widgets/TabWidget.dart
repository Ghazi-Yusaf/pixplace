import 'package:flutter/material.dart';

Widget TabWidget (String title, List<Tab> tabs, List<Widget> contents) => DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("PixPlace"),),
      body: Column(children: [
        Container(
          child: Text(
              title,
              textScaleFactor: 3,
              textAlign: TextAlign.center,
            )
        ),
        SizedBox(
          height: 50,
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: contents,
          ),
        ),],
      ),
    )
);
