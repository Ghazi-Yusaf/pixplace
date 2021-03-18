// class

class Account {
  final String userID;
  final String username;
  final String profileURL;
  final int experience;
  final String bioText;
  final List<String> postIDs;
  final List<String> friendIDs;
  final List<String> collectionIDs;

  Account({
    this.userID,
    this.username,
    this.profileURL,
    this.friendIDs,
    this.experience,
    this.bioText,
    this.postIDs,
    this.collectionIDs,
  });

  Account.fromJson(Map<String, dynamic> json)
      : userID = json['userID'],
        username = json['username'],
        profileURL = json['profileURL'],
        experience = json['experience'],
        bioText = json['bioText'],
        postIDs = List.from(json['postIDs']),
        friendIDs = List.from(json['friendIDs']),
        collectionIDs = List.from(json['collectionIDs']);

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'username': username,
        'profileURL': profileURL,
        'experience': experience,
        'bioText': bioText,
        'postIDs': postIDs,
        'friendIDs': friendIDs,
        'collectionIDs': collectionIDs
      };
}
