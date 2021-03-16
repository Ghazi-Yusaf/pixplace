import 'package:flutter/material.dart';
import 'package:pixplace/entities/Challenge.dart';
import 'package:pixplace/widgets/ChallengeWidget.dart';
import 'package:pixplace/widgets/TabWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uuid/uuid.dart';


class ChallengePage extends StatefulWidget{
  @override
  ChallengePageState createState() => ChallengePageState();
}

List<Tab> challengeTabs = [
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

// Challenge c1 = new Challenge(
//     challengeID: Uuid().v1(),
//     name: "Wheres the dog!",
//     deadline: DateTime.now().millisecondsSinceEpoch,
//     points: 500,
//     description: "Take and Upload 5 Pictures of Dogs",
// );

List<ChallengeWidget> dailychallenges = [
  ChallengeWidget(
    challengeID: 'ECcDy6hTw969CsOHRjaR',
  ),

];

List<ChallengeWidget> weeklychallenges = [

];

List<ChallengeWidget> monthlychallenges = [

];


List<Widget> challengeContents = [
  // first tab bar view widget
  Container(
    color: Colors.white,
    child: CarouselSlider(
      items: dailychallenges,
      options: CarouselOptions(
          height: 400,
      ),
    ),
  ),


  // second tab bar view widget
  Container(
    color: Colors.white,
    child: CarouselSlider(
      items: weeklychallenges,
      options: CarouselOptions(
          height: 400,
      ),
    ),
  ),

  Container(
    color: Colors.white,
    child:CarouselSlider(
      items: monthlychallenges,
      options: CarouselOptions(
          height: 400,
      ),
    ),
  ),
];

class ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return tabWidget("Challenges", challengeTabs, challengeContents);
  }
}
