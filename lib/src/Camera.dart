import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// https://pub.dev/packages/camera
// https://flutter.dev/docs/cookbook/plugins/picture-using-camera

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
      return Container();
    }
    return AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new Directionality(textDirection: TextDirection.ltr, child: CameraPreview(controller)));
  }
}