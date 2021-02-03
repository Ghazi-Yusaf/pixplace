import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/src/Feed.dart';
import 'package:pixplace/src/LeaderBoardPage.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class DataSearch extends SearchDelegate<String>{
  String get searchFieldLabel => 'Search PixPlace';
  final users = ['Abhishek Saini','Peter Smith','Laura Clark', 'David Anderson', 'Katy Scott','Andrew Scott'];
  final recentSearches = ['Peter Smith','Katy Scott'];
  final userNames = ['a_saini','peterSmith2','laurClark99','danderson','katie_s4','andyScott'];
  final index = 0;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        showSearch(context: context, delegate: DataSearch());
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
        return ListView.builder(
                itemBuilder: (BuildContext context, index){
                  return ListTile(
                   // title: Text(data[index]['id']),
                    //subtitle: Text(data[query]['firstName']),
                    leading: Icon(Icons.person_rounded),
                    title: Text(query),
                    onTap: ()=>Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            ProfilePage() // placeholder, use to navigate to query location
                        )
                    ),
                  );
                },
              itemCount: 1,
              //itemCount: 1,
            );
       //future: DefaultAssetBundle.of(context).loadString("assets/json/users.json"),
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestedUsers = (query.isEmpty?recentSearches:users.where((element) => element.startsWith(query)).toList());

    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        onTap: ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ProfilePage() // placeholder, use to navigate to query location
            )
        ),
        leading: Icon(Icons.person_rounded),
        title: RichText(text: TextSpan(
          text: suggestedUsers[index].substring(0,query.length),
          style: TextStyle(color: Colors.black),
          children: [TextSpan(
            text: suggestedUsers[index].substring(query.length),
            style: TextStyle(color: Colors.grey)),
          ]
        )),

        //subtitle: Text(suggestedUsernames[index]),
      ),
      itemCount: suggestedUsers.length,

    );
  }

}
class _HomeState extends State<Home>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    Feed(),
    ProfilePage(),
    Feed(),
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
                title: Text('Home', key: Key('Home'), style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                // ignore: deprecated_member_use
                title: Text('Profile', key: Key('Profile'), style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt_outlined),
                // ignore: deprecated_member_use
                title: Text('Post', key: Key('Post'), style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_esports_outlined),
                // ignore: deprecated_member_use
                title: Text('Achievements', key: Key('Achievements'), style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.pink
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard_outlined),
                // ignore: deprecated_member_use
                title: Text('Leaderboards', key: Key('Leaderboards'), style: TextStyle(color: Colors.black),),
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
