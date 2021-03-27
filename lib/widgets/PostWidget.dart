import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/entities/Comment.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/entities/Tag.dart';
import 'package:pixplace/entities/Report.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/src/Channel.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum types {
  Posts,
}

Widget commentField(String commentID) {
  String userID = '';
  return FutureBuilder<DocumentSnapshot>(
      future: Firestore.getDocument("Comments", commentID),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        // if (snapshot.error) {
        //   return Text("error: " + snapshot.error);
        // }

        if (snapshot.hasData) {
          Comment comment = Comment.fromJson(snapshot.data.data());
          return ListTile(
            leading: FutureBuilder<DocumentSnapshot>(
                future: Firestore.getDocument('Accounts', comment.userID),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> account) {
                  return TextButton(
                      child: Text(account.data['username']), onPressed: () {});
                }),
            title: Row(
              children: [
                Text(
                  comment.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                // Text('${comment.stars.length}'),
                // Material(
                //   // child: IconButton(
                //   //     icon: Icon(comment.stars.contains(userID)
                //   //         ? Icons.star
                //   //         : Icons.star_border),
                //   //     onPressed: () async {
                //   //       userID = await UserManager.getCurrentUser()
                //   //           .then((user) => user.uid);
                //   //       if (comment.stars.contains(userID)) {
                //   //         comment.stars.remove(userID);
                //   //       } else {
                //   //         comment.stars.add(userID);
                //   //       }
                //   //       Firestore.setDocument('Comments', comment.commentID,
                //   //           {'stars': comment.stars});
                //   //     }),
                // ),
              ],
            ),
          );
        }

        return Text("Loading");
      });
}

Widget commentsSection(List<String> commentIDs) {
  if (commentIDs.length == 0) return SizedBox.shrink();

  return ExpansionTile(
      title: Text(
        "${commentIDs.length} comments",
        style: TextStyle(color: Colors.pink),
      ),
      children:
          commentIDs.map((commentID) => commentField(commentID)).toList());
}

class PostWidget extends StatefulWidget {
  final Post post;

  PostWidget({this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String userID;
  String newestComment = '';

  Widget commentInput() {
    var _ctr = TextEditingController();

    Future<void> sendComment() async {
      String id = Uuid().v1();
      await Firestore.setDocument(
          'Comments',
          id,
          Comment(
                  commentID: id,
                  stars: [],
                  userID: await UserManager.getCurrentUser()
                      .then((user) => user.uid),
                  date: DateTime.now().millisecondsSinceEpoch,
                  text: _ctr.text)
              .toJson());

      Post post = this.widget.post;

      post.commentIDs.add(id);

      await Firestore.setDocument("Posts", post.postID, post.toJson());
    }

    return TextField(
      controller: _ctr,
      decoration: InputDecoration(
        hintText: "Comment...",
        suffixIcon:
            IconButton(icon: Icon(Icons.send), onPressed: () => sendComment()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Future<Widget> reportPost() async {
      String id = Uuid().v1();
      await Firestore.setDocument(
          'Reports',
          id,
          Report(
            reportID: id,
            postID: this.widget.post.postID
          ).toJson());

      return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Post Reported"),
                  content: Text("Thank you for reporting this post. We have passed this request onto our admins who will further investigate."),
                  actions: [
                    TextButton(
                      onPressed: () {Navigator.of(context).pop();},
                      child: Text("Dismiss"))
                  ],
                 );
              } 
      );
    }


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
              TextButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfilePage(userID: widget.post.userID)))
                      },
                  child: Text(widget.post.username)),
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
                    icon: Icon(widget.post.stars.contains(userID)
                        ? Icons.star
                        : Icons.star_border),
                    onPressed: () async {
                      userID = await UserManager.getCurrentUser()
                          .then((user) => user.uid);
                      if (widget.post.stars.contains(userID)) {
                        widget.post.stars.remove(userID);
                      } else {
                        widget.post.stars.add(userID);
                      }
                      Firestore.setDocument('Posts', widget.post.postID,
                          {'stars': widget.post.stars});
                    }),
              ),
              // Material(
              //   child: IconButton(icon: Icon(Icons.share), onPressed: () => {}),
              // ),
              Spacer(),
              // Material(
              //   child: IconButton(
              //       icon: Icon(Icons.collections_bookmark_outlined),
              //       onPressed: () => {}),
              // ),
              Material(
                child: IconButton(
                    icon: Icon(Icons.flag_outlined), onPressed: () => reportPost()),
              ),
            ],
          ),
          Text(widget.post.caption),
          Text(DateFormat.yMMMEd()
              .format(DateTime.fromMillisecondsSinceEpoch(widget.post.date))),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Channel(widget.post.tag))),
              child: Text(widget.post.tag)),
          commentsSection(widget.post.commentIDs),
          commentInput()
        ],
      ),
    );
  }
}
