import 'package:coin_base/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//BIG BUTTON
class FilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color buttonColor;

  const FilledButton(
      {Key? key,
      required this.textName,
      required this.onPressed,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: ButtonText(
          
          textName,
          textStyle: GoogleFonts.nunito(
            color: ColorData.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

//BIG OUT LINE BUTTON
class OutLinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color textColor;
  final Color buttonColor;

  const OutLinedButton(
      {Key? key,
      required this.textName,
      required this.onPressed,
      required this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        side: const BorderSide(
          color: ColorData.black,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: ButtonText(
          textName,
          textStyle: GoogleFonts.nunito(
            color: ColorData.black,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

//MEDIUM FILLED BUTTON
class MediumFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color textColor;
  final Color buttonColor;

  const MediumFilledButton(
      {Key? key,
      required this.textName,
      required this.onPressed,
      required this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 20, right: 20),
          primary: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: ButtonText(
          textName,
          textStyle: GoogleFonts.nunito(
            color: ColorData.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

//MEDIUM OUTLINED BUTTON
class MediumOutLinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color textColor;
  final Color buttonColor;

  const MediumOutLinedButton(
      {Key? key,
      required this.textName,
      required this.onPressed,
      required this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 20, right: 20),
          primary: buttonColor,
          side: const BorderSide(
            color: ColorData.primary,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: ButtonText(
          textName,
          textStyle: GoogleFonts.nunito(
            color: ColorData.primary,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

//SMALL FILLED BUTTON
class SmallFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color textColor;
  final Color buttonColor;

  const SmallFilledButton(
      {Key? key,
      required this.textName,
      required this.onPressed,
      required this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 12, right: 12),
          primary: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          textName,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            textStyle: GoogleFonts.lato(
              fontSize: 15,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
