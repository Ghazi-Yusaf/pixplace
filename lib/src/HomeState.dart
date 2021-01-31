import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/src/Feed.dart';
import 'package:pixplace/src/ChallengePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    Feed(),
    ProfilePage(),
    Feed(),
    ChallengePage(),
    ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: Colors.black,),
          itemBuilder: (BuildContext context){
            return MenuOptions.options.map((String option){
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        ),
        title: Text("PixPlace",style:TextStyle(color: Colors.black),),
        backgroundColor: Colors.white, elevation: 0,),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports_outlined),
              label: "Achievements",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined),
              label: "Leaderboards",
            ),
          ],
          onTap: (index) {
            setState((){
              _currentIndex = index;
            });
          }
      ),
    );
  }
}


