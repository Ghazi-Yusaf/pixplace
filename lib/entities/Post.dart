class Post {

  final String userId;
  final String imageURL;
  final String caption;
  final String tagId;
  final List<String> commentIds;
  final int likes;

  Post({
    this.userId,
    this.imageURL,
    this.caption,
    this.tagId,
    this.commentIds,
    this.likes
  });

  Post.fromJson(Map<String, dynamic> json) :
      userId = json['userId'],
      imageURL = json['imageURL'],
      caption = json['caption'],
      tagId = json['tagId'],
      commentIds = json['commentIds'],
      likes = json['likes'];

  Map<String, dynamic> toJson() =>
    {
      'userId': userId,
      'imageURL': imageURL,
      'caption': caption,
      'tagIds': tagId,
      'commentIds': commentIds,
      'likes': likes
    };
}