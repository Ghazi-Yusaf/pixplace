class Comment {
  final String commentID;
  final String userID;
  final int date;
  final String text;
  final List<String> stars;

  Comment({this.commentID, this.userID, this.date, this.text, this.stars});

  Comment.fromJson(Map<String, dynamic> json)
      : commentID = json['commentID'],
        userID = json['userID'],
        date = json['date'],
        text = json['text'],
        stars = List.from(json['stars']);

  Map<String, dynamic> toJson() => {
        'commentID': commentID,
        'userID': userID,
        'date': date,
        'text': text,
        'stars': stars
      };
}
