import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/entities/Tag.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'package:uuid/uuid.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/firebase/services/location.dart';
import 'package:uuid/uuid.dart';

class EditPictureScreen extends StatefulWidget {
  final Image image;

  const EditPictureScreen({Key key, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditPictureScreenState(this.image);
}

class EditPictureScreenState extends State<EditPictureScreen> {
  EditPictureScreenState(this.image);

  final Image image;

  final _formKey = GlobalKey<FormState>();

  TextEditingController captionCtr = TextEditingController();
  TextEditingController tagCtr = TextEditingController();

  // _determinePosition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picture"),
      ),
      body: Container(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(child: image),
            TextFormField(
              controller: captionCtr,
              validator: (value) {
                if (value.isEmpty) return "Please enter some text";

                return null;
              },
              decoration:
                  InputDecoration(hintText: "Text", labelText: "Description"),
            ),
            TextFormField(
              controller: tagCtr,
              validator: (value) {
                if (value.isEmpty) return "Please enter a tag";

                return null;
              },
              decoration: InputDecoration(
                  hintText: "The package tag", labelText: "Tag"),
            ),
            ButtonWidget(
                title: "Submit",
                buttonColor: Colors.pink,
                textColor: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    String currentUserID = "9mzwylMcBZ8U5LZpXxnd";

                    String tagName = tagCtr.text;

                    String tagId;

                    QuerySnapshot tagsQuerySnapshot =
                        await Firestore.firestore.collection("Tags").get();

                    if (!tagsQuerySnapshot.docs
                        .map((e) => e['name'])
                        .contains(tagName)) {
                      tagId = Uuid().v1();
                      Tag tag = Tag(
                          tagID: tagId, name: tagName, ownerID: currentUserID);
                      await Firestore.setDocument("Tags", tagId, tag.toJson());
                    } else {
                      for (var doc in tagsQuerySnapshot.docs) {
                        if (doc['name'] == tagName) tagId = doc.id;
                      }
                    }

                    String postId = Uuid().v1();

                    Firestore.setDocument(
                        'Posts',
                        postId,
                        Post(
                            postId: postId,
                            userId: currentUserID,
                            imageURL:
                                'https://miro.medium.com/max/780/1*SIYbAut8gL4cAqMgk19-6Q.png',
                            date: DateTime.now().millisecondsSinceEpoch,
                            location: 'Scotland',
                            caption: captionCtr.text,
                            tagId: tagId,
                            commentIds: [],
                            userIDs: []).toJson());
                  }

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
          ],
        ),
      )),
    );
  }
}
