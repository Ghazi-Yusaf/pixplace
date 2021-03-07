import 'package:flutter/material.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';

enum types {
  Posts,
}

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
    title: Text(
      "3 People commented ",
      style: TextStyle(color: Colors.pink),
    ),
    trailing: Text(""),
    children: comments
        .map((comment) => commentField(comment.username, comment.message))
        .toList());

class PostWidget extends StatefulWidget {
  final Post post;

  PostWidget({this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String userId;
  String newestComment = '';

  getComments() async {
    if (widget.post.commentIds.length != 0) {
      newestComment =
          await Firestore.getDocument('comments', widget.post.commentIds.last)
              .then((document) => document.data()['text']);
    } else {
      newestComment = '';
    }
    setState(() {
      this.newestComment = newestComment;
    });
  }

  @override
  Widget build(BuildContext context) {
    getComments();
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Icon(Icons.person),
              ),
              TextButton(onPressed: () => {}, child: Text(widget.post.userId)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Material(
                  child:
                      IconButton(icon: Icon(Icons.menu), onPressed: () => {}),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(55.0, 0.0, 0.0, 15.0),
            child: Row(
              children: [
                Text(widget.post.location),
              ],
            ),
          ),
          FadeInImage(
              placeholder: AssetImage('assets/images/ImageUnavailable.png'),
              image: NetworkImage(widget.post.imageURL)),
          Row(
            children: [
              Text('${widget.post.stars.length}'),
              Material(
                child: IconButton(
                    icon: Icon(widget.post.stars.contains(userId)
                        ? Icons.star
                        : Icons.star_border),
                    onPressed: () async {
                      userId = await UserManager.getCurrentUser()
                          .then((user) => user.uid);
                      if (widget.post.stars.contains(userId)) {
                        widget.post.stars.remove(userId);
                      } else {
                        widget.post.stars.add(userId);
                      }
                      Firestore.setDocument('Posts', widget.post.postId,
                          {'stars': widget.post.stars});
                    }),
              ),
              Material(
                child: IconButton(
                    icon: Icon(Icons.message_outlined), onPressed: () {}),
              ),
              Material(
                child: IconButton(icon: Icon(Icons.share), onPressed: () => {}),
              ),
              Spacer(),
              Material(
                child: IconButton(
                    icon: Icon(Icons.collections_bookmark_outlined),
                    onPressed: () => {}),
              ),
              Material(
                child: IconButton(
                    icon: Icon(Icons.flag_outlined), onPressed: () => {}),
              ),
            ],
          ),
          Text(widget.post.caption),
          Row(
            children: [
              Text(widget.post.date),
            ],
          ),
          // TextButton(
          //     onPressed: () => {},
          //     child:
          //         Text('View all ${widget.post.commentIds.length} comments')),
          commentsSection(),
          Text(newestComment)
        ],
      ),
    );
  }
}
