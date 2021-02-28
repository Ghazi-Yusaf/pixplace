class Comment {

  final String userId;
  final String commentId;
  final String text;
  final int likes;

  Comment({
    this.userId,
    this.commentId,
    this.text,
    this.likes
  });

  factory Comment.fromJson(Map<String, dynamic> element) {
    return Comment(
      userId: element['userId'],
      commentId: element['commentId'],
      text: element['text'],
      likes: element['likes']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'commentId' : commentId,
      'text': text,
      'likes': likes
    };
  }

}