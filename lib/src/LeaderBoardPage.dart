import 'package:flutter/material.dart';

import 'package:pixplace/widgets/TabWidget.dart';

Widget leaderBoardListItem(int index) => ListTile(
  leading: Text(index.toString()),
  title: Text("Username"),
  subtitle: Text("Full name"),
  trailing: Text("XP POINTS"),
  tileColor: Colors.white,
);


Widget leaderBoardList() => ListView(
  children: List.generate(20, (index) => leaderBoardListItem(index + 1)),
);

List<Widget> leaderContents = [
  leaderBoardList(),
  leaderBoardList(),
];

List<Tab> leaderTabs = [
  Tab(icon: Icon(Icons.language_outlined,color: Colors.black,)),
  Tab(icon: Icon(Icons.group_outlined,color: Colors.black)),
];

class LeaderBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return tabWidget("Leaderboard", leaderTabs, leaderContents);
  }
}
