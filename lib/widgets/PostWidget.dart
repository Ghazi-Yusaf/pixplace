import 'package:flutter/material.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';

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
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextButton(
            onPressed: () => {},
            child: Text(widget.post.userId)
          ),

          FadeInImage(placeholder: AssetImage('assets/images/ImageUnavailable.png'), image: NetworkImage(widget.post.imageURL)),

          Row(
            children: [
              IconButton(
                icon: Icon(Icons.star_border),
                onPressed: () => {
                  Firestore.setDocument('Posts', widget.post.postId, {'likes': widget.post.likes + 1})
                }
              ),
              IconButton(
                icon: Icon(Icons.message_outlined),
                onPressed: () => {}
              ),
              IconButton(
                icon: Icon(Icons.send_sharp),
                onPressed: () => {}
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.collections_bookmark_outlined),
                onPressed: () => {}
              ),
            ],
          ),

          Text(widget.post.caption),

          //Text('${widget.post.commentIds.length.toString()} comments')
        ],
      ),
    );
  }
}