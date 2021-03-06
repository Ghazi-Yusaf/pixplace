import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Firestore {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> getDocuments(String collection) {
    return firestore.collection(collection).snapshots();
  }

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
        return false;
    }
    else{
      return true;
    }
  }

  static bool hasLoaded(AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return true;
    }
    else {
      return false;
    }
  }
}