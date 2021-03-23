import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/firebase/services/Location.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/widgets/PostImageForm.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:uuid/uuid.dart';
 
class UploadImagePage extends StatefulWidget { 
  @override
  UploadImagePageState createState() => UploadImagePageState();
}
 
class UploadImagePageState extends State<UploadImagePage> {
  String dropdownValue = 'one';

  PlatformFile file;

  TextEditingController captionController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  void chooseFile() async {
    FilePickerResult pickedFile = await FilePicker.platform.pickFiles(type: FileType.image);
    if (pickedFile != null) {
      setState(() {
        file = pickedFile.files.first;
      });
    }
    else {
      setState(() {
        file = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ButtonWidget(
                title: 'Choose image',
                textColor: Colors.pink,
                borderColor: Colors.pink,
                buttonColor: Colors.white,
                onPressed: chooseFile,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.memory(file != null ? file.bytes : Uint8List.fromList([0])),
              SizedBox(
                height: 20.0,
              ),
              PostImageForm(captionController: captionController, tagController: tagController),
              SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                title: 'Post image',
                textColor: Colors.white,
                buttonColor: Colors.pink,
                onPressed: file != null ? () async {
                  User user = await UserManager.getCurrentUser();
                  String url = await Storage.uploadFileFromBytes(file.bytes, file.name.split('.')[1]);
                  print(url);
                  String id = Uuid().v1();
                  Firestore.setDocument(
                    'Posts',
                    id,
                    Post(
                      postID: id,
                      userID: user.uid,
                      username: user.displayName,
                      imageURL: url,
                      date: DateTime.now().millisecondsSinceEpoch,
                      location: await Location.getAddress(),
                      caption: captionController.text,
                      tag: tagController.text,
                      commentIDs: [],
                      stars: []).toJson()
                  );
                  List<String> userPosts = Account.fromJson(await Firestore.getDocument('Accounts', user.uid).then((document) => document.data())).postIDs;
                  userPosts.insert(0, url);
                  Firestore.setDocument('Accounts', user.uid, {'postIDs': userPosts});
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                } : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}