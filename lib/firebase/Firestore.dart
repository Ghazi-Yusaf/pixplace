import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixplace/entities/Post.dart';

class Firestore {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference collectionReference = firestore.collection('Posts');

  static Stream<List<Post>> getEntries() {
    return firestore.collection('Posts').snapshots().map((snapshot) => snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  static Future<void> setEntry(Post post) {
    var options = SetOptions(merge: true);

    return firestore.collection('Posts').doc(post.postId).set(post.toMap(), options);
  }

  static Future<Void> removeEntry(String postId) {
    return firestore.collection('Posts').doc(postId).delete();
  }
}