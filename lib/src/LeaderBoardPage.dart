import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/widgets/TabWidgetLeaderBoard.dart';


class LeaderBoardPage extends StatelessWidget {

  List<Tab> leaderTabs = [
    Tab(icon: Icon(Icons.language_outlined,color: Colors.black,)),
    //Tab(icon: Icon(Icons.group_outlined,color: Colors.black)),
  ];

  Widget populateContents () {
    return FutureBuilder(
        future: Firestore.getCollection('Accounts').orderBy('experience',descending: true).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> accounts){
          if (!accounts.hasData){
            return Text("Can't load Leaderboards. Please try again later.");
          }
          else{
            int index = 1;
            List<ListTile> tiles = [];
            accounts.data.docs.forEach((account) {
              Widget t = ListTile(
                leading: Text(index.toString()),
                title: Text(account['username']),
                subtitle: Text(""),
                trailing: Text(account['experience'].toString()),
                tileColor: Colors.white,
              );
              index++;
              tiles.add(t);
            });
            return ListView(children: tiles);
          }
        }

    );
  }

  @override
  Widget build(BuildContext context) {
    return tabWidgetLeaderBoard("Leaderboards",leaderTabs, [populateContents()]);
  }
}
