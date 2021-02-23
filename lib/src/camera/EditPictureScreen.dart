import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/Storage.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';
import 'package:pixplace/pages.dart';
import 'package:pixplace/firebase/services/location.dart';



class EditPictureScreen extends StatefulWidget {
  final String imagePath;

  const EditPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditPictureScreenState(this.imagePath);
}



class EditPictureScreenState extends State<EditPictureScreen> {
  EditPictureScreenState(this.imagePath);

  final String imagePath;

  final _formKey = GlobalKey<FormState>();

  TextEditingController description = TextEditingController();
  TextEditingController tag = TextEditingController();

  // _determinePosition();

  @override
  Widget build(BuildContext context) {
    double picHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: AppBar(title: Text("Picture"),),
      body: Container(
        child: Form(key: _formKey, child:
          Column(
            children: [
              Center(
                child: Image.file(
                  File(this.imagePath),
                  height: picHeight,
                ),
              ),
              TextFormField(
                controller: description,
                decoration: InputDecoration(
                    hintText: "Text",
                    labelText: "Description"
                ),
              ),
              TextFormField(
                controller: tag,
                decoration: InputDecoration(
                    hintText: "The package tag",
                    labelText: "Tag"
                ),
              ),
              ButtonWidget(
                title: "Submit",
                buttonColor: Colors.pink,
                textColor: Colors.white,
                onPressed: () async {
                  await Storage.uploadFile(this.imagePath);
                  await Firestore.setDocument('Posts', Post(
                    postId: Uuid().v1(),
                    imageURL: await Storage.firebaseStorage.ref('uploads/file-to-upload.png').getDownloadURL(),
                    caption: description.text,
                    likes: 0,
                    )
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ],
          ),
        )
      ),
    );
  }

}