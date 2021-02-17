import 'dart:io';
import 'package:flutter/material.dart';




class EditPictureScreen extends StatefulWidget {
  final String imagePath;

  const EditPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditPictureScreenState(this.imagePath);
}



class EditPictureScreenState extends State<EditPictureScreen> {
  final String imagePath;

  EditPictureScreenState(this.imagePath);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Display the Picture"),),
      body: Image.file(File(this.imagePath)),
    );
  }

}