class Post {

  final String postId;
  final String userId;
  final String imageURL;
  final String caption;
  final List<String> tagIds;
  final List<String> commentIds;
  final int likes;

  Post({
    this.postId,
    this.userId,
    this.imageURL,
    this.caption,
    this.tagIds,
    this.commentIds,
    this.likes
  });

  factory Post.fromJson(Map<String, dynamic> element) {
    return Post(
      postId: element['postId'],
      userId: element['userId'],
      imageURL: element['imageURL'],
      caption: element['caption'],
      tagIds: element['tagIds'],
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
      'tagIds': tagIds,
      'commentIds': commentIds,
      'likes': likes
    };
  }

}