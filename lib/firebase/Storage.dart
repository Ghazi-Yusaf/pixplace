import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class Storage {

  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseException fireBaseStorageException;

  static Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebaseStorage
          .ref('uploads/file-to-upload.png')
          .putFile(file);
    } on FirebaseException catch (e) {
      fireBaseStorageException = e;
      return false;
    }
  }

  static Future<void> downloadFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${directory.path}/');
  }

}