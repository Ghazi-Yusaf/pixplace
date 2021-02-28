import 'package:flutter/material.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/services/location.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:uuid/uuid.dart';
import 'package:pixplace/entities/Comment.dart';

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
                commentId: Uuid().v1(),
                text: comment,
                likes: 0
            ));
        },
      )
    ]
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

  var _controller = TextEditingController();
  PostCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: cardContent(context),
    );
  }
}

