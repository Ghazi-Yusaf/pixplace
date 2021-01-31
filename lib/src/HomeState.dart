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
  final sample = ['sample1','sample2','sample3'];
  final recentSearches = ['sample4','sample5','sample6'];
  final description = [" description 1"," description 2"," description 3"];
  final index = 0;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
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
    return(
      FutureBuilder(builder: (context, snapshot){
        var showData = json.decode(snapshot.data.toString());
        return(
            ListView.builder(
                itemBuilder: (BuildContext context, index){
                  return ListTile(
                    title: Text(showData[index]['id']),
                    subtitle: Text(showData[index]['firstName']),
                    onTap: ()=>Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            ChallengePage() // placeholder, use to navigate to query location
                        )
                    ),
                  );
                },
              itemCount: showData.length,
            )
        );
      }, future: DefaultAssetBundle.of(context).loadString("assets/json/users.json"),
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty?recentSearches:sample.where((element) => element.startsWith(query.toLowerCase())).toList();
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        onTap: ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ChallengePage() // placeholder, use to navigate to query location
            )
        ),

        leading: Icon(Icons.pageview_rounded),
        title: RichText(
            text: TextSpan(
                text: suggestions[index].substring(0,query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestions[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  )]
            )
        ),
        subtitle: Text(suggestions[index] + description[index]),

      ),

      itemCount: suggestions.length,
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
