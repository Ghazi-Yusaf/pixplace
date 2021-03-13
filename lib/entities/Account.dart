// class

class Account {
  final String userId;
  final int experience;
  final String profileImageURL;
  final String bioText;
  final List<String> postsIDs;
  final List<String> friendsIDs;
  final List<String> tagsIDs;
  final List<String> collectionsIDs; // maybe ???

  Account({
    this.userId,
    this.friendsIDs,
    this.experience,
    this.profileImageURL,
    this.bioText,
    this.postsIDs,
    this.tagsIDs,
    this.collectionsIDs,
  });

  Account.fromJson(Map<String, dynamic> element)
      : userId = element['userId'],
        friendsIDs = element['friendsIDs'],
        experience = element['experience'],
        profileImageURL = element['profileImageURL'],
        bioText = element['bioText'],
        postsIDs = List.from(element['postsIDs']),
        tagsIDs = List.from(element['tagsIDs']),
        collectionsIDs = List.from(element['collectionsIDs']);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'friendsIDs': friendsIDs,
        'experience': experience,
        'profileImageURL': profileImageURL,
        'bioText': bioText,
        'postsIDs': postsIDs,
        'tagsIDs': tagsIDs,
        'collectionsIDs': collectionsIDs
      };
}
