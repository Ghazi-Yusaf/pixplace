import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/services/location.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:uuid/uuid.dart';
import 'package:pixplace/entities/Comment.dart';

@override
Widget getImage(BuildContext context, String postId, CollectionReference post) {
  return FutureBuilder<DocumentSnapshot>(
    future: post.doc(postId).get(),
    builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

      if (snapshot.hasError) {
        return Text("Image Unavailable");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data.data();
        String imageURL = "${data['imageURL']}";
        return Image.network(
            imageURL,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width
        );
      }

      return Text("loading");
    },
  );
}


Widget postDetails(String postId) => Row(
  children: [
    TextButton(onPressed: () => {}, child: Text('postId')),
    Spacer(),
    IconButton(icon: Icon(Icons.expand_more_outlined), onPressed: () => {})
  ],
);

Widget actionsBar() => Row(
  children: [
    IconButton(icon: Icon(Icons.star_border), onPressed: () => {}),
    IconButton(icon: Icon(Icons.message_outlined), onPressed: () => {}),
    IconButton(icon: Icon(Icons.send_sharp), onPressed: () => {}),
    Spacer(),
    IconButton(icon: Icon(Icons.collections_bookmark_outlined), onPressed: () => {}),
  ],
);

class Message {
  final username;
  final message;
  const Message(this.username, this.message);
}

List<Message> comments = [
  new Message("Joe", "Really interesting"),
  new Message("Sarah", "I wish I was there"),
  new Message("Rebecca", "Thats a great picture")
];

Widget commentField(String username, String message) => ListTile(
  leading: Text(username),
  title: Text(message),
  trailing: Icon(Icons.favorite_outline),
);

Widget commentsSection(String postId) => ExpansionTile(
    title: Text("X People commented ", style: TextStyle(color: Colors.pink),),
    trailing: Text("View All"),
    children: [
      Text("Comment"),
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Write a Comment"
        ),
        onSubmitted: (String comment) async{
            await Firestore.setDocument('Comments', Comment(
                userId: await UserManager.getCurrentUser().then((user) => user.uid),
                postId: await Firestore.firestore.collection("Posts").doc().id,
                commentId: Uuid().v1(),
                text: comment,
                likes: 0
            ));
        },
      )
    ]
);

// Text("Comments Section");

Widget cardContent(BuildContext context, String postId, CollectionReference post) => Container(
  child: Column(
    children: [
      postDetails(postId),
      getImage(context, postId, post),
      actionsBar(),
      commentsSection(postId),
    ],
  ),
);

class PostCardWidget extends StatelessWidget {

  String postId;
  PostCardWidget({Key key, @required this.postId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CollectionReference post = FirebaseFirestore.instance.collection('Posts');
    return Card(
      child: cardContent(context, this.postId, post),
    );
  }
}

