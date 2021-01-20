import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/widgets/PostCardWidget.dart';

class Feed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Column(
           children: <Widget>[
             PostCardWidget(),
             PostCardWidget(),
             PostCardWidget(),
             PostCardWidget(),
             PostCardWidget(),
             PostCardWidget(),
             PostCardWidget(),
             PostCardWidget(),
           ]
        )
      ),
    );
  }
}