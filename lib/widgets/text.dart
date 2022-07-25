import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const.dart';

class ButtonText extends StatelessWidget {
  String text;
  double wordspace;
  TextStyle textStyle;
  bool isUnderline;
  bool textCenter;

  ButtonText(
    this.text, {
    Key? key,
    this.wordspace = 1,
    this.textCenter = false,
    required this.textStyle,
    this.isUnderline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: textCenter ? TextAlign.center : null,
      style: GoogleFonts.nunito(
        fontSize: height(context) * .022,
        fontWeight: FontWeight.bold,
        wordSpacing: wordspace,
        textStyle: textStyle,
      ),
    );
  }
}
