class Comment {

  final String commentId;
  final String userId;
  final String date;
  final String text;
  final List<String> stars;

  Comment({
    this.commentId,
    this.userId,
    this.date,
    this.text,
    this.stars
  });

  Comment.fromJson(Map<String, dynamic> json) :
    commentId = json['commentId'],
    userId = json['userId'],
    date = json['date'],
    text = json['text'],
    stars = List.from(json['stars']);

  Map<String, dynamic> toJson() =>
    {
      'commentId' : commentId,
      'userId': userId,
      'date': date,
      'text': text,
      'stars': stars
    };
}