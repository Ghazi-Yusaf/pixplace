import 'package:flutter/material.dart';
import 'package:pixplace/entities/Challenge.dart';
import 'package:pixplace/widgets/ChallengeWidget.dart';
import 'package:pixplace/widgets/TabWidgetLeaderBoard.dart';
import 'package:pixplace/widgets/TabWidgetChallenge.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uuid/uuid.dart';

class ChallengePage extends StatefulWidget {
  @override
  ChallengePageState createState() => ChallengePageState();
}

List<Tab> challengeTabs = [
  Tab(
    child: Text(
      "Daily",
      style: TextStyle(color: Colors.black),
    ),
  ),
  Tab(
    child: Text(
      "Weekly",
      style: TextStyle(color: Colors.black),
    ),
  ),
  Tab(
    child: Text(
      "Monthly",
      style: TextStyle(color: Colors.black),
    ),
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
  ChallengeWidget(
    challengeID: '138k50uqAWCcTTZKJaJu',
  ),
];

List<ChallengeWidget> weeklychallenges = [
  ChallengeWidget(
    challengeID: '9q8XX3LtsNZGNDl8eT3N',
  ),
  ChallengeWidget(
    challengeID: 'IRRtLGwamQI0Ulyd2pQW',
  ),
];

List<ChallengeWidget> monthlychallenges = [
  ChallengeWidget(
    challengeID: 'pfh1M3Pzr1kWj4c3rRn5',
  ),
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
    child: CarouselSlider(
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
    return tabWidgetChallenge("Challenges", challengeTabs, challengeContents);
  }
}
