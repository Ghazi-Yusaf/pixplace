// Some code from https://github.com/pszklarska/flutter_image_labelling used to help implement image labelling (see labels.dart)

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/firebase/services/location.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/PostImageForm.dart';
import 'package:uuid/uuid.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class EditPictureScreen extends StatefulWidget {
  final String imagePath;

  EditPictureScreen({this.imagePath});

  @override
  _EditPictureScreenState createState() => _EditPictureScreenState();
}



class _EditPictureScreenState extends State<EditPictureScreen> {
  TextEditingController captionController = TextEditingController();


  List<ImageLabel> _labels;
  ImageLabel selectedTag;

  String textLabel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _detectLabels());
  }

  // detects labels in the image and puts them in a list
  void _detectLabels() async {
      File image = File(widget.imagePath);

      final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
      final ImageLabeler labeler = FirebaseVision.instance.imageLabeler();
      final List<ImageLabel> labels = await labeler.processImage(visionImage);

      setState(() {
        _labels = labels;
      });
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
              Image.file(File(widget.imagePath)),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: captionController,
                validator: (value) {
                  if (value.isEmpty) return "Please enter some text";

                  return null;
                },
                decoration:
                    InputDecoration(labelText: "Caption"),
              ),


            if(_labels != null)
              DropdownButton<ImageLabel>(
                    hint:  Text("Select tag"),
                    value: selectedTag,
                    onChanged: (ImageLabel tag) {
                      setState(() {
                        selectedTag = tag;
                        textLabel = selectedTag.text;
                      });
                    },
                    items: _labels.map((ImageLabel _labels) {
                      return  DropdownMenuItem<ImageLabel>(
                        value: _labels,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10,),
                            Text(
                              _labels.text,
                              style:  TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                ),


              SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                title: 'Post image',
                textColor: Colors.white,
                buttonColor: Colors.pink,
                onPressed: () async {
                  User user = await UserManager.getCurrentUser();
                  String url =
                      await Storage.uploadFileFromString(widget.imagePath);
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
                          tag: textLabel,
                          commentIDs: [],
                          stars: []).toJson());
                  List<String> userPosts = Account.fromJson(
                          await Firestore.getDocument('Accounts', user.uid)
                              .then((document) => document.data()))
                      .postIDs;
                  userPosts.insert(0, url);
                  Firestore.setDocument(
                      'Accounts', user.uid, {'postIDs': userPosts});
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
