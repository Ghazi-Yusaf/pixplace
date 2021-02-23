import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixplace/entities/Post.dart';

class Firestore {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Stream<List<Post>> getDocument(String collection) {
    return firestore.collection(collection).snapshots().map((snapshot) => snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  static Future<void> setDocument(String collection, Post post) {
    var options = SetOptions(merge: true);

    return firestore.collection(collection).doc(post.postId).set(post.toMap(), options);
  }

  static Future<Void> removeDocument(String collection, String postId) {
    return firestore.collection(collection).doc(postId).delete();
  }
}