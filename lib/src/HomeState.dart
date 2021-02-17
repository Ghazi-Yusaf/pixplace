import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    Feed(),
    ProfilePage(),
    getCamera(),
    ChallengePage(),
    LeaderBoardPage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: Colors.pink,
              height: 1,
            ),
            preferredSize: Size.fromHeight(1)
        ),
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
        backgroundColor: Colors.white, elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),color: Colors.black, onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],

      ),
      drawer: Drawer(),

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          key: Key('bottom'),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                // ignore: deprecated_member_use
                title: Text('Home', key: Key('Home'), style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                // ignore: deprecated_member_use
                title: Text('Profile', key: Key('Profile'), style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt_outlined),
                // ignore: deprecated_member_use
                title: Text('Post', key: Key('Post'), style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_esports_outlined),
                // ignore: deprecated_member_use
                title: Text('Achievements', key: Key('Achievements'), style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard_outlined),
                // ignore: deprecated_member_use
                title: Text('Leaderboards', key: Key('Leaderboards'), style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.pink
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
