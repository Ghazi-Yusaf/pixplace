import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'EditPictureScreen.dart';


// https://pub.dev/packages/camera
// https://flutter.dev/docs/cookbook/plugins/picture-using-camera



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
        return Text(errorMessage);
      }
      if (cameraStatusSnapshot.hasData) {
        CameraDescription camera = cameraStatusSnapshot.data;
        return CameraApp(camera: camera);
      }
      return Text("No cameras available");
    },
  );
}

// CAMERA CODE

class CameraApp extends StatefulWidget {
  CameraDescription camera;

  CameraApp({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreen createState() => TakePictureScreen(this.camera);
}

class TakePictureScreen extends State<CameraApp> {
  CameraController controller;
  CameraDescription camera;

  Future<void> _initialiseControllerFuture;

  TakePictureScreen(this.camera);

  @override
  void initState() {
    super.initState();
    controller = CameraController(this.camera, ResolutionPreset.ultraHigh);
    _initialiseControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initialiseControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initialiseControllerFuture;

            final image = await controller.takePicture();

            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPictureScreen(
              image: Image.file(File(image?.path), height: MediaQuery.of(context).size.height / 3)
            )));
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

