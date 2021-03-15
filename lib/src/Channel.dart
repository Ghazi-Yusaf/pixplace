import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/entities/Tag.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/widgets/AppBar.dart';

import 'package:pixplace/widgets/PostWidget.dart';

class Channel extends StatefulWidget {
  Tag tag;

  Channel(this.tag);

  @override
  _ChannelState createState() => _ChannelState(this.tag);
}

class _ChannelState extends State<Channel> {
  Tag tag;

  _ChannelState(this.tag);

  @override
  Widget build(BuildContext context) {
    String tagName = "#" + this.tag.name;
    return Scaffold(
      appBar: appBar(tagName),
      body: StreamBuilder(
        stream: Firestore.getDocuments('Posts'),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            //snapshot.data.docs.sort((a, b) => a['date'] < b['date']);
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (content, index) {
                return PostWidget(
                  post:
                      Post.fromJson(snapshot.data.docs.toList()[index].data()),
                );
              },
            );
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
        },
      ),
    );
  }
}
