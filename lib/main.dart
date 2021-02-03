import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';

import 'src/ProfilePage.dart';

import 'src/EditProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixPlace',
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
