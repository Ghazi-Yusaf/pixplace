import 'package:flutter/material.dart';
import 'package:pixplace/widgets/TabWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

List<Container> dailychallenges = [
  Container(
      child: Column(
          children: [
            Text(
              "Challenge 1",
              style: TextStyle(fontSize: 30),
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            Text(
              "Challenge 1 Description",
              style: TextStyle(fontSize: 16),
            ),
            Padding(
                padding: EdgeInsets.only(top: 25,),),
            LinearPercentIndicator(
                  width: 100,
                  lineHeight: 20,
                  percent: 0.3,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.pink,
                  trailing: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("500XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
                  ),
                ),
          ]
      ),
  ),

  Container(
    child: Column(
        children: [
          Text(
            "Challenge 2",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            "Challenge 2 Description",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25,),),
          LinearPercentIndicator(
            width: 100,
            lineHeight: 20,
            percent: 0.6,
            backgroundColor: Colors.grey,
            progressColor: Colors.pink,
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("500XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
            ),
          ),
        ]
    ),
  ),

  Container(
    child: Column(
        children: [
          Text(
            "Challenge 3",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            "Challenge 3 Description",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25,),),
          LinearPercentIndicator(
            width: 100,
            lineHeight: 20,
            percent: 0.05,
            backgroundColor: Colors.grey,
            progressColor: Colors.pink,
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("500XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
            ),
          ),
        ]
    ),
  ),
];

List<Container> weeklychallenges = [
  Container(
    child: Column(
        children: [
          Text(
            "Challenge 1",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            "Challenge 1 Description",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25,),),
          LinearPercentIndicator(
            width: 100,
            lineHeight: 20,
            percent: 0.2,
            backgroundColor: Colors.grey,
            progressColor: Colors.pink,
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("2000XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
            ),
          ),
        ]
    ),
  ),
  Container(
    child: Column(
        children: [
          Text(
            "Challenge 2",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            "Challenge 2 Description",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25,),),
          LinearPercentIndicator(
            width: 100,
            lineHeight: 20,
            percent: 0.9,
            backgroundColor: Colors.grey,
            progressColor: Colors.pink,
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("2000XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
            ),
          ),
        ]
    ),
  ),
];

List<Container> monthlychallenges = [
  Container(
    child: Column(
        children: [
          Text(
            "Challenge 1",
            style: TextStyle(fontSize: 30),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            "Challenge 1 Description",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25,),),
          LinearPercentIndicator(
            width: 100,
            lineHeight: 20,
            percent: 0,
            backgroundColor: Colors.grey,
            progressColor: Colors.pink,
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("10000XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
            ),
          ),
        ]
    ),
  ),
];


List<Widget> contents = [
  // first tab bar view widget
  Container(
    color: Colors.white,
    child: CarouselSlider(
      items: dailychallenges,
      options: CarouselOptions(
          height: 400,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5)
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
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5)
      ),
    ),
  ),

  Container(
    color: Colors.white,
    child:CarouselSlider(
      items: monthlychallenges,
      options: CarouselOptions(
          height: 400,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5)
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
