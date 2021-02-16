import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// https://pub.dev/packages/camera
// https://flutter.dev/docs/cookbook/plugins/picture-using-camera

import 'ErrorPage.dart';

// INIT CAMERA CODE
Future<CameraDescription> ensureAndGetCameras() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final camera = cameras.first;

  return camera;
}

FutureBuilder getCamera() {
  return FutureBuilder<CameraDescription>(
    future: ensureAndGetCameras(),
    builder: (BuildContext context,
        AsyncSnapshot<CameraDescription> cameraStatusSnapshot) {
      if (cameraStatusSnapshot.hasError) {
        String errorMessage = "Error: " + cameraStatusSnapshot.error.toString();
        return errorPage(errorMessage);
      }
      if (cameraStatusSnapshot.hasData) {
        CameraDescription camera = cameraStatusSnapshot.data;
        return CameraApp(camera);
      }
      return errorPage("No cameras available");
    },
  );
}

// CAMERA CODE

class CameraApp extends StatefulWidget {
  CameraDescription camera;

  CameraApp(this.camera);

  @override
  _CameraAppState createState() => _CameraAppState(this.camera);
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  CameraDescription camera;

  _CameraAppState(this.camera);

  @override
  void initState() {
    super.initState();
    controller = CameraController(this.camera, ResolutionPreset.veryHigh);
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
      return errorPage("Controller not initialised");
    }
    // get screen size
    final size = MediaQuery.of(context).size;

    // calculate scale for aspect ratio widget
    var scale = controller.value.aspectRatio * size.aspectRatio;

    // check if adjustments are needed...
    if (controller.value.aspectRatio > size.aspectRatio) {
      scale = 1 / scale;
    }
    return Transform.scale(
      scale: scale,
      child: Center(child: CameraPreview(controller)),
    );
  }
}
