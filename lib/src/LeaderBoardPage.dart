import 'package:flutter/material.dart';


Widget leaderBoardListItem(int index) => ListTile(
  leading: Text(index.toString()),
  title: Text("Username"),
  subtitle: Text("Full name"),
  trailing: Text("XP POINTS"),
);



Widget leaderBoardList() => ListView(
  children: List.generate(20, (index) => leaderBoardListItem(index + 1)),
);


class LeaderBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              height: 50.0,
              child: new TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car,color: Colors.grey,)),
                  Tab(icon: Icon(Icons.directions_transit,color: Colors.grey)),
                  Tab(icon: Icon(Icons.directions_bike,color: Colors.grey)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              leaderBoardList(),
              leaderBoardList(),
              leaderBoardList(),
            ],
          ),
        ),
      ),
    );
  }
}
