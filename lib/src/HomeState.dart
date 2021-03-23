import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/firebase/UserManager.dart';
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
    FutureBuilder<User>(
        future: UserManager.getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            return ProfilePage(userID: snapshot.data.uid);
          } else if (snapshot.hasError) {
            return Text('An error has occured, please try again later.');
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink))),
            );
          }
        }),
    getCamera(),
    UploadImagePage(),
    ChallengePage(),
    LeaderBoardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Pixplace"),
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
