import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/widgets/PostImageForm.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:uuid/uuid.dart';
 
class UploadImagePage extends StatefulWidget { 
  @override
  UploadImagePageState createState() => UploadImagePageState();
}
 
class UploadImagePageState extends State<UploadImagePage> {

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

  Future<String> uploadFile() async {
    return Storage.uploadFileFromBytes(file.bytes, file.name.split('.')[1]);
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
                title: 'Upload image',
                textColor: Colors.white,
                buttonColor: Colors.pink,
                onPressed: file != null ? () async {
                  String id = Uuid().v1();
                  Firestore.setDocument(
                    'Posts',
                    id,
                    Post(
                      postId: id,
                      userId: await UserManager.getCurrentUser().then((user) => user.uid),
                      imageURL: await uploadFile(),
                      date: DateTime.now().millisecondsSinceEpoch,
                      location: 'Scotland',
                      caption: captionController.text,
                      tagId: tagController.text,
                      commentIds: [],
                      stars: []).toJson()
                  );
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