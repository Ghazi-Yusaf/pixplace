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

  factory Post.fromJson(Map<String, dynamic> element) {
    return Post(
      postId: element['postId'],
      userId: element['userId'],
      imageURL: element['imageURL'],
      caption: element['caption'],
      tagId: element['tagId'],
      commentIds: element['commentIds'],
      likes: element['likes']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'imageURL': imageURL,
      'caption': caption,
      'tagIds': tagId,
      'commentIds': commentIds,
      'likes': likes
    };
  }

}