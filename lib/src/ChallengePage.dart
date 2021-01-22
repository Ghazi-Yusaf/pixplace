import 'package:flutter/material.dart';
class ChallengePage extends StatefulWidget{
  @override
  ChallengePageState createState() => ChallengePageState();
}

class ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("PixPlace"),),
        body: Column(children: [
          Container(
            child: Text(
              "Challenges",
              textScaleFactor: 3,
              textAlign: TextAlign.center,
            )
          ),
        SizedBox(
          height: 50,
          child: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Daily",
                ),
                Tab(
                  text: "Weekly",
                ),
              ],
            ),
          ),
        ),
          Expanded(
            child: TabBarView(
              children: [
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
              ],
            ),
          ),],
        ),
      )
    );
  }
}
