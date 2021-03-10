import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlutterVisionApp());
}

class FlutterVisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterVisionHome(),
    );
  }
}

class FlutterVisionHome extends StatefulWidget {
  @override
  _FlutterVisionHomeState createState() {
    return _FlutterVisionHomeState();
  }
}


class _FlutterVisionHomeState extends State<FlutterVisionHome> {
    String imagePath;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter Vision'),
        ),
        body: Column(
          children: <Widget> [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: _imageList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _imageList()
    {
      return GestureDetector(
        child: Center(
          child: Image.asset("assets/images/table.png"),
        ),
        onTap: () async {
          print("Trying to detect the image file");
          String file = await getImageFileFromAssets("table.png");
          print(file);
          setState(() {

            imagePath = file;
          });

          detectLabels();
        },
      );
    }

    void showInSnackBar(String message) {
      // ignore: deprecated_member_use
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
    }

    Future<String> getImageFileFromAssets(String path) async {
      final byteData = await rootBundle.load('assets/$path');
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/Pictures/flutter_vision';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.png';
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      return filePath;
    }

    Future<void> detectLabels() async {
      final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFilePath(imagePath);
      final ImageLabeler labelDetector = FirebaseVision.instance.imageLabeler(
        ImageLabelerOptions(confidenceThreshold: 0.75));
      final List<ImageLabel> labels = await labelDetector.processImage(visionImage);

      for (ImageLabel label in labels) {
        final String text = label.text;
        // ignore: deprecated_member_use
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
      }
    }
}
