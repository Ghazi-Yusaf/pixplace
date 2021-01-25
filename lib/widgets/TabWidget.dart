import 'package:flutter/material.dart';

Widget TabWidget (String title, List<Tab> tabs, List<Widget> contents) => DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(title: Text("PixPlace"),),
      body: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              title,
              textScaleFactor: 2,
              textAlign: TextAlign.center,
            )
        ),
        SizedBox(
          height: 50,
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Colors.pink,
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
