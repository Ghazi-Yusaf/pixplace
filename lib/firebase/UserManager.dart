import 'package:firebase_auth/firebase_auth.dart';

class UserManager {

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseAuthException firebaseAuthException;

  static Future createUser(String username, String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await changeUsername(username);
      sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      firebaseAuthException = e;
      return false;
    }
  }

  static Future loginUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      firebaseAuthException = e;
      return false;
    }
  }

  static Future<void> logoutUser() async {
    await firebaseAuth.signOut();
  }

  static Future<void> sendEmailVerification() async {
    await firebaseAuth.currentUser.sendEmailVerification();
  }

  static Future isEmailVerified() async {
    await firebaseAuth.currentUser.reload();
    return firebaseAuth.currentUser.emailVerified;
  }

  static Future resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      firebaseAuthException = e;
      return false;
    }
  }

  static Future<void> changeUsername(String username) async {
    await firebaseAuth.currentUser.updateProfile(
      displayName: username
    );
  }

}