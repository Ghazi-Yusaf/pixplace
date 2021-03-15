import 'package:flutter/material.dart';

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
  }
}
