import 'package:coin_base/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//PRIMARY BUTTON
class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color buttonColor;

  const PrimaryButton(
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
          borderRadius: BorderRadius.circular(10.0),
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
            Radius.circular(6),
          ),
        ),
        child: Text(
          textName,
          style: GoogleFonts.nunito(
            color: ColorData.white,
            letterSpacing: 1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//PRIMARY BUTTON
class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;
  final Color buttonColor;

  const SecondaryButton(
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
          borderRadius: BorderRadius.circular(10.0),
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
            Radius.circular(6),
          ),
        ),
        child: Text(
          textName,
          style: GoogleFonts.nunito(
            color: ColorData.black,
            letterSpacing: 1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//ANIMATED BUTTON
class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String textName;
  final bool loading;
  final Color buttonColor;

  const AnimatedButton({
    Key? key,
    required this.onPressed,
    required this.textName,
    this.loading = false,
    required this.buttonColor,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: widget.loading
            ? SpinKitCircle(
                size: height(context) * .04,
                color: ColorData.white,
                controller: animationController,
              )
            : Text(
                widget.textName,
                style: GoogleFonts.nunito(
                  color: ColorData.white,
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

//TEXT BUTTON
class TxtButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;

  const TxtButton({
    Key? key,
    required this.textName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          alignment: Alignment.topRight,
          child: Text(
            textName,
            style: GoogleFonts.lato(
              fontSize: height(context) * .019,
              color: ColorData.primary,
            ),
          )),
    );
  }
}
