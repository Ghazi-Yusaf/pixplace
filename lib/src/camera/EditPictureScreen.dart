import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/widgets/PostImageForm.dart';
import 'package:uuid/uuid.dart';

class EditPictureScreen extends StatefulWidget {
  final String imagePath;
  final Position position;

  EditPictureScreen({Key key, this.position, this.imagePath}) : super(key: key);

  @override
  _EditPictureScreenState createState() =>
      _EditPictureScreenState(this.imagePath, this.position);
}

class _EditPictureScreenState extends State<EditPictureScreen> {
  TextEditingController captionController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  _EditPictureScreenState(this.imagePath, this.position);

  final String imagePath;
  final Position position;

  Future<String> getLocationString(Position position) async {
    Coordinates coordinates =
        new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    return "${addresses.first.locality}, ${addresses.first.countryName}";
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
              PostImageForm(
                  captionController: captionController,
                  tagController: tagController),
              SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                title: 'Upload image',
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
                          location: await getLocationString(this.position),
                          caption: captionController.text,
                          tag: tagController.text,
                          commentIDs: [],
                          stars: []).toJson());
                  List<String> userPosts = Account.fromJson(
                          await Firestore.getDocument('Accounts', user.uid)
                              .then((document) => document.data()))
                      .postIDs;
                  userPosts.insert(0, id);
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
