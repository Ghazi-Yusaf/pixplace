import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Firestore {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // static List<Post> getPosts(String collection) {
  //   List<Post> posts;
  //   firestore.collection(collection).where('userId', isEqualTo: 'xpZPgbxpKQMuUQGnaiOKVtUTUhB2').get().then((value) => value.docs.forEach((element) { posts.add(Post.fromJson(element.data()));}));
  //   print(posts);
  // }

  static Future<DocumentSnapshot> getDocument(String collection, String id) {
    return firestore.collection(collection).doc(id).get();
  }

  static Future<void> setDocument(String collection, String id, Map<String, dynamic> json) {
    var options = SetOptions(merge: true);

    return firestore.collection(collection).doc(id).set(json, options);
  }

  static Future<void> removeDocument(String collection, String id) {
    return firestore.collection(collection).doc(id).delete();
  }

  static bool checkDocumentExists(AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasError) {
        return true;
    }
    else{return false;}
  }

  static bool hasLoaded(AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return true;
    }
    else{return false;}
  }
}