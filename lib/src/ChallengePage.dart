import 'package:flutter/material.dart';
import 'package:pixplace/widgets/TabWidget.dart';

class ChallengePage extends StatefulWidget{
  @override
  ChallengePageState createState() => ChallengePageState();
}

List<Tab> tabs = [
  Tab(
    text: "Daily",
  ),
  Tab(
    text: "Weekly",
  ),
  Tab(
    text: "Monthly",
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
    return TabWidget("Does this work ?", tabs, contents,3);
  }
}
