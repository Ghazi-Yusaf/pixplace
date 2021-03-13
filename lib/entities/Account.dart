class Account {
  final String userId;
  final String biography;
  final List<String> friends;
  final int experience;
  final String profileImageURL;
  final String bioText;
  final List<String> postsIDs;
  final List<String> tagsIDs;
  final List<String> collectionsIDs;

  Account({
    this.userId,
    this.biography,
    this.friends,
    this.experience,
    this.profileImageURL,
    this.bioText,
    this.postsIDs,
    this.tagsIDs,
    this.collectionsIDs,
  });

  Account.fromJson(Map<String, dynamic> element)
      : userId = element['userId'],
        biography = element['biography'],
        friends = element['friends'],
        experience = element['experience'],
        profileImageURL = element['profileImageURL'],
        bioText = element['bioText'],
        postsIDs = List.from(element['postsIDs']),
        tagsIDs = List.from(element['tagsIDs']),
        collectionsIDs = List.from(element['collectionsIDs']);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'biography': biography,
        'friends': friends,
        'experience': experience,
        'profileImageURL': profileImageURL,
        'bioText': bioText,
        'postsIDs': postsIDs,
        'tagsIDs': tagsIDs,
        'collectionsIDs': collectionsIDs
      };
}
