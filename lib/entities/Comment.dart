class Comment {
  final String commentId;
  final String userId;
  final int date;
  final String text;
  final int likes;

  Comment({this.commentId, this.userId, this.date, this.text});

  Comment.fromJson(Map<String, dynamic> json)
      : commentId = json['commentId'],
        userId = json['userId'],
        date = json['date'],
        text = json['text'];

  Map<String, dynamic> toJson() =>
      {'commentId': commentId, 'userId': userId, 'date': date, 'text': text};
}
