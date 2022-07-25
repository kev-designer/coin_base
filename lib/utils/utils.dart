import 'package:another_flushbar/flushbar.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  //TOST MESSGE
  static tostMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: height(context) * .018,
    );
  }

  //FLUSH BAR MESSAGE
  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        backgroundColor: ColorData.primary,
        message: message,
        titleSize: height(context) * .018,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(8),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

//SNACK BAR MESSAGE
  static snackBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.nunito(
            color: ColorData.white,
            fontSize: height(context) * .018,
          ),
        ),
        backgroundColor: ColorData.red,
      ),
    );
  }
}
