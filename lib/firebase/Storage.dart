import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class Storage {

  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;


  static Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebaseStorage
          .ref('uploads/file-to-upload.png')
          .putFile(file);
    } on FirebaseException catch (e) {
      print("object");
    }
  }
}