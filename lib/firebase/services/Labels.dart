import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class Labels {

  static final FirebaseVision firebaseVision = FirebaseVision.instance;

  static Future<List<ImageLabel>> getLabelsFromFile(String imagePath) async {
    return firebaseVision.imageLabeler().processImage(FirebaseVisionImage.fromFilePath(imagePath));
  }

  static Future<List<DropdownMenuItem<String>>> getDropdownMenuItems(String imagePath) async {
    List<ImageLabel> labels = await getLabelsFromFile(imagePath);
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    labels.forEach((label) {
      dropdownMenuItems.add(DropdownMenuItem<String>(value: label.text, child: Text('${label.text} (${label.confidence})')));
    });
    return dropdownMenuItems;
  }
}