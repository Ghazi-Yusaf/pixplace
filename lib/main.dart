import 'package:flutter/material.dart';




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'src/Camera.dart';

// https://pub.dev/packages/camera
// https://flutter.dev/docs/cookbook/plugins/picture-using-camera

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(CameraApp(cameras));
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixPlace',
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      home: null,
    );
  }
}