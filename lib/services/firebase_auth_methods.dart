import 'package:coin_base/utils/routes/routes_name.dart';
import 'package:coin_base/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //SIGNING UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      } else {
        Navigator.pushNamed(context, RoutesName.login);
      }
    } on FirebaseAuthException catch (e) {
      Utils.snackBarMessage(e.message!, context);
    }
  }

  //EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      } else {
        Navigator.pushNamed(context, RoutesName.navBar);
      }
    } on FirebaseAuthException catch (e) {
      Utils.snackBarMessage(e.message!, context);
    }
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      Utils.flushBarMessage("Email verification sent...!", context);
    } on FirebaseAuthException catch (e) {
      Utils.snackBarMessage(e.message!, context);
    }
  }
}
