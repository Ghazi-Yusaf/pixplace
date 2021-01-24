import 'package:flutter/material.dart';

Widget getImage(BuildContext context) => Image.network("https://picsum.photos/250/150",
    fit: BoxFit.fitWidth,
    width: MediaQuery.of(context).size.width
  // loadingBuilder: (context, child, progress) => {
  //     return progress == null ? child : LinearProgressIndicator()
  // },
);

Widget postDetails() => Row(
  children: [
    TextButton(onPressed: () => {}, child: Text('First Last')),
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

Widget commentsSection() => ExpansionTile(
    title: Text("3 People commented"),
    trailing: Text(""),
    children: comments.map((comment) => commentField(comment.username, comment.message)).toList()
);

// Text("Comments Section");

Widget cardContent(BuildContext context) => Container(
  child: Column(
    children: [
      postDetails(),
      getImage(context),
      actionsBar(),
      commentsSection(),
    ],
  ),
);

class PostCardWidget extends StatelessWidget {


  PostCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: cardContent(context),
    );
  }
}

