import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseAuthException exception;

  Future createUser(String username, String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = credential.user;
      user.updateProfile(displayName: username);
      firebaseAuth.signOut();
      return user;
    } on FirebaseAuthException catch (e) {
      exception = e;
      return null;
    }
  }

  Future loginUser(String email, String password) {

  }

  Future logoutUser() {
    
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