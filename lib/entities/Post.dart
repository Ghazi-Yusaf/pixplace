class Post {
  final String postID;
  final String userID;
  final String username;
  final String imageURL;
  final int date;
  final String location;
  final String caption;
  final String tag;
  final List<String> commentIDs;
  final List<String> stars;

  Post(
      {this.postID,
      this.userID,
      this.username,
      this.imageURL,
      this.date,
      this.location,
      this.caption,
      this.tag,
      this.commentIDs,
      this.stars});

  Post.fromJson(Map<String, dynamic> json)
      : postID = json['postID'],
        userID = json['userID'],
        username = json['username'],
        date = json['date'],
        imageURL = json['imageURL'],
        location = json['location'],
        caption = json['caption'],
        tag = json['tag'],
        commentIDs = List.from(json['commentIDs']),
        stars = List.from(json['stars']);

  Map<String, dynamic> toJson() => {
        'postID': postID,
        'userID': userID,
        'username': username,
        'imageURL': imageURL,
        'date': date,
        'location': location,
        'caption': caption,
        'tag': tag,
        'commentIDs': commentIDs,
        'stars': stars
      };
}
