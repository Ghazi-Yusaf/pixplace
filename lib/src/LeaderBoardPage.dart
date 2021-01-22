import 'package:flutter/material.dart';

import 'package:pixplace/widgets/TabWidget.dart';

Widget leaderBoardListItem(int index) => ListTile(
  leading: Text(index.toString()),
  title: Text("Username"),
  subtitle: Text("Full name"),
  trailing: Text("XP POINTS"),
);


Widget leaderBoardList() => ListView(
  children: List.generate(20, (index) => leaderBoardListItem(index + 1)),
);

List<Widget> contents = [
  leaderBoardList(),
  leaderBoardList(),
  leaderBoardList(),
];

List<Tab> tabs = [
  Tab(icon: Icon(Icons.directions_car,color: Colors.grey,)),
  Tab(icon: Icon(Icons.directions_transit,color: Colors.grey)),
  Tab(icon: Icon(Icons.directions_bike,color: Colors.grey)),
];

class LeaderBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabWidget("Leadeboard", tabs, contents);
  }
}
