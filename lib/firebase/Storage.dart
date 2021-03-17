import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:uuid/uuid.dart';

class Storage {

  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseException fireBaseStorageException;

  static Future<String> uploadFileFromString(String filePath) async {
    File file = File(filePath);
    String storagePath = '${await UserManager.getCurrentUser().then((user) => user.uid)}/${Uuid().v1()}';

    try {
      await firebaseStorage.ref(storagePath).putFile(file);
      return firebaseStorage.ref(storagePath).getDownloadURL();
    } on FirebaseException catch (e) {
      fireBaseStorageException = e;
      return null;
    }
  }

  static Future<String> uploadFileFromBytes(Uint8List bytes, String fileExtension) async {
    String storagePath = '${await UserManager.getCurrentUser().then((user) => user.uid)}/${Uuid().v1()}';

    try {
      await firebaseStorage
          .ref(storagePath)
          .putData(bytes, SettableMetadata(contentType: 'image/$fileExtension'));
      return firebaseStorage.ref(storagePath).getDownloadURL();
    } on FirebaseException catch (e) {
      fireBaseStorageException = e;
      return null;
    }
  }

  static Future<void> downloadFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${directory.path}/');
  }

}