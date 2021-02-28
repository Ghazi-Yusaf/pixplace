import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/entities/Comment.dart';
class Firestore {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Stream<List<Post>> getDocument(String collection) {
    return firestore.collection(collection).snapshots().map((snapshot) => snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  static Future<void> setDocument(String collection, Comment comment) {
    var options = SetOptions(merge: true);

    return firestore.collection(collection).doc(comment.commentId).set(comment.toMap(), options);
  }

  static Future<void> removeDocument(String collection, String postId) {
    return firestore.collection(collection).doc(postId).delete();
  }
}