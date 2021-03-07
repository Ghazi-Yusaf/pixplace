class Post {

  final String postId;
  final String userId;
  final String imageURL;
  final String date;
  final String location;
  final String caption;
  final String tagId;
  final List<String> commentIds;
  final List<String> stars;

  Post({
    this.postId,
    this.userId,
    this.imageURL,
    this.date,
    this.location,
    this.caption,
    this.tagId,
    this.commentIds,
    this.stars
  });

  Post.fromJson(Map<String, dynamic> json) :
    postId = json['postId'],
    userId = json['userId'],
    date = json['date'],
    imageURL = json['imageURL'],
    location = json['location'],
    caption = json['caption'],
    tagId = json['tagId'],
    commentIds = List.from(json['commentIds']),
    stars = List.from(json['stars']);

  Map<String, dynamic> toJson() =>
    {
      'postId': postId,
      'userId': userId,
      'imageURL': imageURL,
      'date': date,
      'location': location,
      'caption': caption,
      'tagId': tagId,
      'commentIds': commentIds,
      'stars': stars
    };
}