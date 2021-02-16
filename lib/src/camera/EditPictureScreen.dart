import 'dart:io';
import 'package:flutter/material.dart';


class EditPictureScreen extends StatelessWidget {
  final String imagePath;

  const EditPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Display the Picture"),),
      body: Image.file(File(imagePath)),
    );
  }
}