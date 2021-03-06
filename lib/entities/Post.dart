class Post {

  final String postId;
  final String userId;
  final String imageURL;
  final String caption;
  final String tagId;
  final List<String> commentIds;
  final int likes;

  Post({
    this.postId,
    this.userId,
    this.imageURL,
    this.caption,
    this.tagId,
    this.commentIds,
    this.likes
  });

  Post.fromJson(Map<String, dynamic> json) :
    postId = json['postId'],
    userId = json['userId'],
    imageURL = json['imageURL'],
    caption = json['caption'],
    tagId = json['tagId'],
    commentIds = List.castFrom(['commentIds']),
    likes = json['likes'];

  Map<String, dynamic> toJson() =>
    {
      'postId': postId,
      'userId': userId,
      'imageURL': imageURL,
      'caption': caption,
      'tagId': tagId,
      'commentIds': commentIds,
      'likes': likes
    };
}