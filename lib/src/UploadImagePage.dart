import 'package:flutter/material.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
 
class UploadImagePage extends StatefulWidget {
  UploadImagePage() : super();
 
  final String title = "Upload Image Demo";
 
  @override
  UploadImagePageState createState() => UploadImagePageState();
}
 
class UploadImagePageState extends State<UploadImagePage> {

  Future<void> chooseImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if(result != null) {
      File file = File(result.files.single.path);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlinedButton(
              onPressed: () async {
                await FilePicker.platform.pickFiles().then((value) {
                  if(value != null) {
                    File file = File(value.files.single.path);
                    print(file.path);
                  } else {
                    // User canceled the picker
                  }
                });
              },
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlinedButton(
              onPressed: null,
              child: Text('Upload Image'),
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