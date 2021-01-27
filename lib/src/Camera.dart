import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// https://pub.dev/packages/camera
// https://flutter.dev/docs/cookbook/plugins/picture-using-camera

import 'ErrorPage.dart';


// INIT CAMERA CODE
Future<List<CameraDescription>> ensureAndGetCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await availableCameras();
}


FutureBuilder getCamera() {
  return FutureBuilder<List<CameraDescription>>(
    future: ensureAndGetCameras(),
    builder: (BuildContext context,  AsyncSnapshot<List<CameraDescription>> camerasListSnapshot) {
      if (camerasListSnapshot.hasError) {
        String errorMessage = "Error: " + camerasListSnapshot.error.toString();
        return ErrorPage(errorMessage);
      }
      if (camerasListSnapshot.hasData) {
        List<CameraDescription> cameras = camerasListSnapshot.data;
        return CameraApp(cameras);
      }
      return ErrorPage("No cameras available");
    },
  );
}








// CAMERA CODE

class CameraApp extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraApp(this.cameras);

  @override
  _CameraAppState createState() => _CameraAppState(this.cameras);
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  List<CameraDescription> cameras;

  _CameraAppState(this.cameras);


  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return ErrorPage("Controller not initialised")
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: new Directionality(textDirection: TextDirection.ltr, child: CameraPreview(controller)));
  }
}


