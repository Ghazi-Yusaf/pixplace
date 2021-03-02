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

  Comment.fromJson(Map<String, dynamic> json) :
    userId = json['userId'],
    commentId = json['commentId'],
    text = json['text'],
    likes = json['likes'];

  Map<String, dynamic> toJson() =>
    {
      'userId': userId,
      'commentId' : commentId,
      'text': text,
      'likes': likes
    };
}