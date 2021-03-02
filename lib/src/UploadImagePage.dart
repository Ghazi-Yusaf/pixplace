import 'dart:html';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
 
class UploadImagePage extends StatefulWidget { 
  @override
  UploadImagePageState createState() => UploadImagePageState();
}
 
class UploadImagePageState extends State<UploadImagePage> {

  PlatformFile file;
  bool fileFound = false;

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

  void uploadFile() async {
    await Storage.uploadFileFromBytes(file.bytes, file.name.split('.')[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            SizedBox(
              height: 20.0,
            ),
            ButtonWidget(
              title: 'Upload image',
              textColor: Colors.white,
              buttonColor: Colors.pink,
              onPressed: file != null ? uploadFile : null,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'status',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}