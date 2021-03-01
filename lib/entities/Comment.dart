class Comment {

  final String userId;
  final String postId;
  final String commentId;
  final String text;
  final int likes;

  Comment({
    this.userId,
    this.postId,
    this.commentId,
    this.text,
    this.likes
  });

  factory Comment.fromJson(Map<String, dynamic> element) {
    return Comment(
      userId: element['userId'],
      postId: element['postId'],
      commentId: element['commentId'],
      text: element['text'],
      likes: element['likes']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'postId': postId,
      'commentId' : commentId,
      'text': text,
      'likes': likes
    };
  }

}