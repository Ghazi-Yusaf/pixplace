import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:uuid/uuid.dart';
import 'package:pixplace/entities/Comment.dart';

import 'package:pixplace/entities/Comment.dart';
import 'package:pixplace/entities/Post.dart';

class PostCardWidget extends StatefulWidget {
  PostCardWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PostCardState();
  }
}

class _PostCardState extends State<PostCardWidget> {
  Post post = Post(
      postId: "postID",
      userId: "userID",
      imageURL: "url",
      caption: "caption",
      tagId: "tagID",
      commentIds: [],
      likes: 5);

  List<Comment> comments = [
    new Comment(userId: "id", text: "Really interesting", likes: 3),
    new Comment(userId: "id", text: "I wish I was there", likes: 5),
    new Comment(userId: "id", text: "Thats a great picture", likes: 8)
  ];

  Widget getImage(BuildContext context) =>
      Image.network("https://picsum.photos/250/150",
          fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width
          // loadingBuilder: (context, child, progress) => {
          //     return progress == null ? child : LinearProgressIndicator()
          // },
          );
=======
Widget getImage(BuildContext context, String postId) {
  return FutureBuilder<DocumentSnapshot>(
    future: Firestore.getDocument('Posts', postId),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> document) {
      if (!Firestore.checkDocumentExists(document)) {
        return Text("Image Unavailable");
      }
      if (Firestore.hasLoaded(document)) {
        Map<String, dynamic> data = document.data.data();
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(data['imageURL']))),
        );
      }
      return Text("Loading Image...");
    },
  );
}

Widget postDetails(String postId) => Row(
      children: [
        FutureBuilder<DocumentSnapshot>(
          future: Firestore.getDocument('Posts', postId),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> document) {
            if (!Firestore.checkDocumentExists(document)) {
              return Text("Name Unavailable");
            }
            if (Firestore.hasLoaded(document)) {
              Map<String, dynamic> data = document.data.data();
              return TextButton(
                  onPressed: () => {}, child: Text(data['userId']));
            }
            return Text("Loading Name...");
          },
        ),
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
        IconButton(
            icon: Icon(Icons.collections_bookmark_outlined),
            onPressed: () => {}),
      ],
    );

Widget caption(String postId) => FutureBuilder<DocumentSnapshot>(
      future: Firestore.getDocument('Posts', postId),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> document) {
        if (!Firestore.checkDocumentExists(document)) {
          return Text("Caption Unavailable");
        }
        if (Firestore.hasLoaded(document)) {
          Map<String, dynamic> data = document.data.data();
          return Text(
            data['caption'],
          );
        }
        return Text("Loading Caption...");
      },
    );

Widget commentField(String username, String message) => ListTile(
      leading: Text(username),
      title: Text(message),
      trailing: Icon(Icons.favorite_outline),
    );

Widget commentsSection(String postId) => ExpansionTile(
        title: FutureBuilder<DocumentSnapshot>(
          future: Firestore.getDocument('Posts', postId),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> document) {
            if (!Firestore.checkDocumentExists(document)) {
              return Text("Number Unavailable");
            }
            if (Firestore.hasLoaded(document)) {
              Map<String, dynamic> data = document.data.data();
              List<String> comments = data['commentIds'].cast<String>();
              return Text(
                "${comments.length} People commented ",
                style: TextStyle(color: Colors.pink),
              );
            }
            return Text("Loading Like Value...");
          },
        ),
        trailing: Text("View All"),
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: Firestore.getDocument('Posts', postId),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> document) {
              if (!Firestore.checkDocumentExists(document)) {
                return Text("Name Unavailable");
              }
              if (Firestore.hasLoaded(document)) {
                Map<String, dynamic> data = document.data.data();
                List<String> comments = data['commentIds'].cast<String>();
                return SizedBox(
                  height: 70,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(child: Text('${comments[index]}'));
                      }),
                );
              }
              return Text("Loading Comment");
            },
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Write a Comment"),
            onSubmitted: (String comment) async {
              String id = Uuid().v1();
              await Firestore.setDocument(
                  'Comments',
                  id,
                  Comment(
                      userId: await UserManager.getCurrentUser()
                          .then((user) => user.uid),
                      commentId: id,
                      text: comment).toJson());
            },
          )
        ]);

  Widget postDetails() => Row(
        children: [
          TextButton(onPressed: () => {}, child: Text('First Last')),
          Spacer(),
          IconButton(
              icon: Icon(Icons.expand_more_outlined), onPressed: () => {})
        ],
      );
  Widget actionsBar() => Row(
        children: [
          IconButton(icon: Icon(Icons.star_border), onPressed: () => {}),
          IconButton(
              icon: Icon(Icons.message_outlined),
              onPressed: () => {this.isCommenting = true}),
          IconButton(icon: Icon(Icons.send_sharp), onPressed: () => {}),
          Spacer(),
          IconButton(
              icon: Icon(Icons.collections_bookmark_outlined),
              onPressed: () => {}),
        ],
      );

  Widget commentField(String username, String message) => ListTile(
        leading: Text(username),
        title: Text(message),
        trailing: Icon(Icons.favorite_outline),
      );

  Widget commentSection() => ExpansionTile(
      title: Text(
        "3 People commented ",
        style: TextStyle(color: Colors.pink),
      ),
      trailing: Text(""),
      children: this
          .comments
          .map((comment) => commentField("username", comment.text))
          .toList());

  Widget commentInput() => Text("Text input");

  Widget commentsSection = null;
Widget cardContent(BuildContext context, String postId) => Container(
      child: Column(
        children: [
          postDetails(postId),
          getImage(context, postId),
          actionsBar(),
          caption(postId),
          commentsSection(postId),
        ],
      ),
    );

class PostCardWidget extends StatelessWidget {
  String postId;
  PostCardWidget({Key key, @required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Column(
        children: [
          postDetails(),
          getImage(context),
          actionsBar(),
          commentsSection,
        ],
      ),
    ));
      child: cardContent(context, this.postId),
    );
  }
}
