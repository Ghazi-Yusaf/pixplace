// Code taken from https://github.com/pszklarska/flutter_image_labelling to use as template for task
// 
// NOTE:
// labels.dart is now used as a standalone file to run image labelling with uploading an image from a device's gallery (see video on PixPlace website)
// Uses code from above repo as base and uses a dropdown menu instead of a list

import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pixplace/widgets/ButtonWidget.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Labels',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  // instantiates plugin
  final picker = ImagePicker();


  File _image;
  List<ImageLabel> _labels;
  ImageLabel selectedTag;


  // method used to get image from device's gallery and detect the labels within the image
  // method called later when button is pressed
  Future<void> _detectLabels() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // creates the FirebaseVisionImage object from picked image
    if (pickedFile != null) {
      File image = File(pickedFile.path);

      final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);

      // imageLabler (the detector) and processImage (which processes the image and its labels using the detector) are called
      final ImageLabeler labeler = FirebaseVision.instance.imageLabeler();
      final List<ImageLabel> labels = await labeler.processImage(visionImage);

      // used to notify the Flutter framework that state of the objects has changed
      setState(() {
        _image = image;
        _labels = labels;
      });
    }
  }


  // basic screen structure from above repo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_image == null || _labels == null)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // button widget that was created for this app (see ButtonWidget.dart)
                      // when button is pressed, _detectLabels method is run
                      ButtonWidget(
                        title: 'Choose image',
                        textColor: Colors.pink,
                        borderColor: Colors.pink,
                        buttonColor: Colors.white,
                        onPressed: _detectLabels,
                      )
                    ],
                  )
                : Column(
                    children: [
                      // displays picked image on the screen
                      Image.file(
                        _image,
                        height: 240.0,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Detected tags: ',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),

                      // dropdown menu only displayed if the content of _labels is not empty
                      // otherwise an error screen would appear as code would try to run with nothing to use in _labels
                       if(_labels != null)
                          DropdownButton<ImageLabel>(
                                hint:  Text("Select tag"),
                                value: selectedTag,
                                // contents of dropdown menu change every time a new image is selected
                                onChanged: (ImageLabel tag) {
                                  setState(() {
                                    selectedTag = tag;
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

                // lets user select a new image after first upload
                // resets contents of dropdown menu to prevent duplication of items error
                ButtonWidget(
                        title: 'New image',
                        textColor: Colors.pink,
                        borderColor: Colors.pink,
                        buttonColor: Colors.white,
                        onPressed: () {
                          selectedTag = null;
                          _labels = null;
                          _detectLabels();
                        }
                        ),
                      SizedBox(height: 16.0),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}