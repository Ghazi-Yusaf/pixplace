class Account {

  final String userId;
  final String biography;
  final List<String> friends;
  final int experience;

  Account({
    this.userId,
    this.biography,
    this.friends,
    this.experience
  });

  Account.fromJson(Map<String, dynamic> element) :
    userId = element['userId'],
    biography = element['biography'],
    friends = element['friends'],
    experience = element['experience'];

  Map<String, dynamic> toJson() =>
    {
      'userId': userId,
      'biography': biography,
      'friends': friends,
      'experience': experience
    };
}