// class

class Account {
  final String userId;
  final int experience;
  final String profileImageURL;
  final String bioText;
  final List<String> postsIDs;
  final List<String> friendIDs;
  final List<String> tagsIDs;
  final List<String> collectionsIDs;

  Account({
    this.userId,
    this.friendIDs,
    this.experience,
    this.profileImageURL,
    this.bioText,
    this.postsIDs,
    this.tagsIDs,
    this.collectionsIDs,
  });

  Account.fromJson(Map<String, dynamic> element)
      : userId = element['userId'],
        friendIDs = element['friendIDs'],
        experience = element['experience'],
        profileImageURL = element['profileImageURL'],
        bioText = element['bioText'],
        postsIDs = List.from(element['postsIDs']),
        tagsIDs = List.from(element['tagsIDs']),
        collectionsIDs = List.from(element['collectionsIDs']);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'friendIDs': friendIDs,
        'experience': experience,
        'profileImageURL': profileImageURL,
        'bioText': bioText,
        'postsIDs': postsIDs,
        'tagsIDs': tagsIDs,
        'collectionsIDs': collectionsIDs
      };
}
