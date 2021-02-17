import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';

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
                  // GHAZIIIIIII:   TERNERARY MASTER
                },
              ),
            ],
          ),
        )
      ),
    );
  }

}