import 'package:flutter/material.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';

enum types {
  Posts,
}

class PostWidget extends StatefulWidget {

  final Post post;

  PostWidget({
    this.post
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  String userId;
  String newestComment = '';

  getComments() async {
    if (widget.post.commentIds.length != 0) {
      newestComment = await Firestore.getDocument('comments', widget.post.commentIds.last).then((document) => document.data()['text']);
    }
    else {
      newestComment = '';
    }
  }

  @override
  void initState() {
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Icon(Icons.person),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(widget.post.userId)
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Material(
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => {}
                  ),
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

          FadeInImage(placeholder: AssetImage('assets/images/ImageUnavailable.png'), image: NetworkImage(widget.post.imageURL)),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
            child: Row(
              children: [
                Material(
                  child: IconButton(
                    icon: Icon(widget.post.stars.contains(userId) ? Icons.star : Icons.star_border),
                    onPressed: () async {
                      userId = await UserManager.getCurrentUser().then((user) => user.uid);
                      if (widget.post.stars.contains(userId)) {
                        widget.post.stars.remove(userId);
                      }
                      else {
                        widget.post.stars.add(userId);
                      }
                      Firestore.setDocument('Posts', widget.post.postId, {'stars': widget.post.stars});
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Material(
                    child: IconButton(
                      icon: Icon(Icons.message_outlined),
                      onPressed: () {}
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Material(
                    child: IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () => {}
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('This photo has a score of ${widget.post.stars.length} stars!'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Material(
                    child: IconButton(
                      icon: Icon(Icons.collections_bookmark_outlined),
                      onPressed: () => {}
                    ),
                  ),
                ),
                Material(
                  child: IconButton(
                    icon: Icon(Icons.flag_outlined),
                    onPressed: () => {}
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 8.0, 300.0, 10.0),
            child: Text(widget.post.caption),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 8.0, 200.0, 10.0),
            child: Row(
              children: [
                Text(widget.post.date),
              ],
            ),
          ),

          TextButton(
            onPressed: () => {},
            child: Text('View all ${widget.post.commentIds.length} comments')
          ),

          Text(newestComment)
        ],
      ),
    );
  }
}