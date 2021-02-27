class Account {

  final String userId;
  final String text;
  final int likes;

  Account({
    this.userId,
    this.text,
    this.likes
  });

  factory Account.fromJson(Map<String, dynamic> element) {
    return Account(
      userId: element['userId'],
      text: element['text'],
      likes: element['likes']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'text': text,
      'likes': likes
    };
  }

}