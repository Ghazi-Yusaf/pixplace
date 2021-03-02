class Comment {
  final String userId;
  final String text;
  final int likes;

  Comment({this.userId, this.text, this.likes});

  factory Comment.fromJson(Map<String, dynamic> element) {
    return Comment(
        userId: element['userId'],
        text: element['text'],
        likes: element['likes']);
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'text': text, 'likes': likes};
  }
}
