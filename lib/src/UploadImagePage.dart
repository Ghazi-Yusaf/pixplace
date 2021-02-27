import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pixplace/firebase/Storage.dart';
 
class UploadImagePage extends StatefulWidget {
  UploadImagePage() : super();
 
  final String title = "Upload Image Demo";
 
  @override
  UploadImagePageState createState() => UploadImagePageState();
}
 
class UploadImagePageState extends State<UploadImagePage> {
  //
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  File file;
  String status = '';
  String base64Image;
  io.File tmpFile;
  String errMessage = 'Error Uploading Image';
 
  chooseImage() {
    setState(() {
      InputElement uploadInput = FileUploadInputElement();
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        file = uploadInput.files.first;
        final reader = FileReader();

        reader.readAsDataUrl(file);

        reader.onLoadEnd.listen((event) async {
          print('done');
        });
      });
    });
  }
 
  Widget showImage() {
    return Flexible(
      child: Image.file(
        io.File.fromRawPath(base64Decode(base64Image)),
        fit: BoxFit.fill,
      ));
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
              onPressed: chooseImage,
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlinedButton(
              onPressed: showImage,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
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