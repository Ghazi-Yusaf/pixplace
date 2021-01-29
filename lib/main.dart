import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixplace/src/IntroPage.dart';
import 'package:pixplace/src/LoginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialisation = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialisation,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MediaQuery(
            data: new MediaQueryData(),
            child: new MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Montserrat"
              ),
              home: LoginPage()
            )
          );
        }

        return IntroPage();
      }
    );
  }
}
