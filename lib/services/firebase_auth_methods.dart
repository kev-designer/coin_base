import 'package:coin_base/auth/otp.dart';
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
    } catch (e) {
      rethrow;
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
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RoutesName.navBar);
      }
    } catch (e) {
      Utils.snackBarMessage("Something went wrong, please try again", context);
    }
  }

  //MOBILE LOGIN
  // Future<void> mobileSignIn(
  //   BuildContext context,
  //   String mobileNumber,
  // ) async {
  //   await _auth.verifyPhoneNumber(
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       //  TextEditingController _otpController = TextEditingController();

  //       await _auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (e) {
  //       Utils.snackBarMessage(e.message!, context);
  //     },
  //     codeSent: ((String verificationId, int? resendToke) async {
  //       OtpScreen(context: context);
  //     }),
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  //GOOGLE LOGIN

  //FACEBOOK LOGIN

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
