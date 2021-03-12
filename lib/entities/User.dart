class User {
  final String profileImageURL;
  final String bioText;
  final List<String> postsIDs;
  final List<String> tagsIDs;
  final List<String> collectionsIDs;

  User({
    this.profileImageURL,
    this.bioText,
    this.postsIDs,
    this.tagsIDs,
    this.collectionsIDs,
  });

  User.fromJson(Map<String, dynamic> json)
      : profileImageURL = json['profileImageURL'],
        bioText = json['bioText'],
        postsIDs = List.from(json['postsIDs']),
        tagsIDs = List.from(json['tagsIDs']),
        collectionsIDs = List.from(json['collectionsIDs']);

  Map<String, dynamic> toJson() => {
        'profileImageURL': profileImageURL,
        'bioText': bioText,
        'postsIDs': postsIDs,
        'tagsIDs': tagsIDs,
        'collectionsIDs': collectionsIDs,
      };
}
