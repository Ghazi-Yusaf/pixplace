import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/src/Feed.dart';
import 'package:pixplace/src/ChallengePage.dart';
import 'package:pixplace/src/LeaderBoardPage.dart';
import 'package:pixplace/src/UploadImagePage.dart';
import 'package:pixplace/widgets/AppBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Feed(),
    ProfilePage(),
    getCamera(),
    UploadImagePage(),
    ChallengePage(),
    LeaderBoardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Pixplace"),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Profile",
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt_outlined),
                label: "Post",
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.upload_file),
                label: "Upload",
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_esports_outlined),
                label: "Challenges",
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard_outlined),
                label: "Ranking",
                backgroundColor: Colors.pink),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
