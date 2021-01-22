import 'package:flutter/material.dart';
import 'package:pixplace/widgets/TabWidget.dart';

class ChallengePage extends StatefulWidget{
  @override
  ChallengePageState createState() => ChallengePageState();
}

List<Tab> tabs = [
  Tab(
    child: Text("Daily", style: TextStyle(color: Colors.black),),
  ),
  Tab(
    child: Text("Weekly", style: TextStyle(color: Colors.black),),
  ),
  Tab(
    child: Text("Monthly", style: TextStyle(color: Colors.black),),
  ),
];

List<Widget> contents = [
  // first tab bar view widget
  Container(
    color: Colors.white,
    child: Center(
      child: Text(
        'Daily',
      ),
    ),
  ),

  // second tab bar view widget
  Container(
    color: Colors.white,
    child: Center(
      child: Text(
        'Weekly',
      ),
    ),
  ),

  Container(
    color: Colors.white,
    child: Center(
      child: Text(
        'Monthly',
      ),
    ),
  ),
];

class ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return TabWidget("Challenges", tabs, contents);
  }
}
