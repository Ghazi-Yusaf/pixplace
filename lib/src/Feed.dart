import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';

import 'package:pixplace/widgets/PostWidget.dart';
import 'package:uuid/uuid.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        TextButton(
          child: Text('Add'),
          onPressed: () {
            String id = Uuid().v1();
            Firestore.setDocument(
                'Posts',
                id,
                Post(
                    postId: id,
                    userId: 'Mr Test User is cool',
                    imageURL:
                        'https://miro.medium.com/max/780/1*SIYbAut8gL4cAqMgk19-6Q.png',
                    date: DateTime.now().millisecondsSinceEpoch,
                    location: 'Scotland',
                    caption:
                        'This is a beautiful picture of the sunset from the clouds that everyone can enjoy muchly.',
                    commentIds: [],
                    userIDs: []).toJson());
          },
        ),
        TextButton(
            child: Text('Delete'),
            onPressed: () => {
                  Firestore.firestore.collection('Posts').get().then((value) =>
                      {Firestore.removeDocument('Posts', value.docs[0].id)})
                })
      ],
      body: StreamBuilder(
        stream: Firestore.getDocuments('Posts').snapshots(),
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
