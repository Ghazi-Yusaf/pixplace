import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseAuthException exception;

  Future createUser(String username, String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await changeUsername(username);
      User user = credential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      exception = e;
      return null;
    }
  }

  Future loginUser(String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = credential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      exception = e;
      return null;
    }
  }

  Future logoutUser() async {
    
  }

  Future changeUsername(String username) async {
    await firebaseAuth.currentUser.updateProfile(
      displayName: username
    );
  }

  void displayError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(exception.message),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ],
        );
      }
    );
  }

}