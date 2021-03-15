class Comment {
  final String commentId;
  final String userId;
  final int date;
  final String text;
  final int likes;

  Comment({this.commentId, this.userId, this.date, this.text, this.likes});

  Comment.fromJson(Map<String, dynamic> json)
      : commentId = json['commentId'],
        userId = json['userId'],
        date = json['date'],
        text = json['text'],
        likes = json['likes'];

  Map<String, dynamic> toJson() => {
        'commentId': commentId,
        'userId': userId,
        'date': date,
        'text': text,
        'likes': likes
      };
}
