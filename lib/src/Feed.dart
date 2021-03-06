import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            Firestore.setDocument('Posts', id, Post(
              postId: id,
              userId: 'user',
              imageURL: 'https://miro.medium.com/max/780/1*SIYbAut8gL4cAqMgk19-6Q.png',
              caption: 'this is a test',
              commentIds: ['lol','awesome'],
              likes: 0
            ).toJson());
          },
        ),
        TextButton(
          child: Text('Delete'),
          onPressed: () => {
            Firestore.firestore.collection('Posts').get().then((value) => {
              Firestore.removeDocument('Posts', value.docs[0].id)
            })
          }
        )
      ],
      body: StreamBuilder(
        stream: Firestore.getDocuments('Posts'),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (content, index) {
                return PostWidget(
                  post: Post.fromJson(snapshot.data.docs[index].data()),
                );
              },
            );
          }
          else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}