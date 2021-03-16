class Post {
  final String postID;
  final String userID;
  final String imageURL;
  final int date;
  final String location;
  final String caption;
  final String tagID;
  final List<String> commentIDs;
  final List<String> stars;

  Post(
      {this.postID,
      this.userID,
      this.imageURL,
      this.date,
      this.location,
      this.caption,
      this.tagID,
      this.commentIDs,
      this.stars});

  Post.fromJson(Map<String, dynamic> json)
      : postID = json['postID'],
        userID = json['userID'],
        date = json['date'],
        imageURL = json['imageURL'],
        location = json['location'],
        caption = json['caption'],
        tagID = json['tagID'],
        commentIDs = List.from(json['commentIDs']),
        stars = List.from(json['stars']);

  Map<String, dynamic> toJson() => {
        'postID': postID,
        'userID': userID,
        'imageURL': imageURL,
        'date': date,
        'location': location,
        'caption': caption,
        'tagID': tagID,
        'commentIDs': commentIDs,
        'stars': stars
      };
}
