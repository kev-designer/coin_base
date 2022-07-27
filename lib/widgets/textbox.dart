import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//ALL TEXT FIELDS
class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final String hintText;
  final TextInputType keybordType;
  final bool obscureText;
  final SvgPicture suffixIcon;
  final FontWeight weight;
  final Color borderColor;

  const TextFields({
    Key? key,
    required this.controller,
    required this.keybordType,
    required this.obscureText,
    required this.suffixIcon,
    required this.color,
    required this.hintText,
    required this.weight,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: keybordType,
      decoration: InputDecoration(
        focusColor: ColorData.black,
        fillColor: const Color(0xffFAFAFA),
        filled: true,
        counterText: '',
        border: const OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: suffixIcon,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1.8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.primary, width: 1.8),
        ),
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: GoogleFonts.lato(
          color: ColorData.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: GoogleFonts.lato(
        color: ColorData.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

//SEARCH BAR
class SearchBar extends StatelessWidget {
  final double width;
  final String hintText;
  final SvgPicture prefixIcon;
  final FontWeight weight;
  final Color borderColor;

  const SearchBar({
    Key? key,
    required this.prefixIcon,
    required this.width,
    required this.hintText,
    required this.weight,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          counterText: '',
          border: const OutlineInputBorder(),
          suffixIcon: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: SvgPicture.asset("assets/svgs/search.svg"),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1.8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorData.primary, width: 1.5),
          ),
          hintText: "Search...",
          labelStyle: GoogleFonts.lato(
            color: ColorData.black,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          hintStyle: GoogleFonts.lato(
            color: ColorData.black,
            fontSize: 16,
          ),
        ),
        style: GoogleFonts.lato(
          color: ColorData.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

//PASSWORD TEXT FIELDS
class PasswordTextFields extends StatelessWidget {
  final TextEditingController controller;

  final Color color;
  final String hintText;
  final TextInputType keybordType;
  final bool obscureText;
  final GestureDetector suffixIcon;
  final FontWeight weight;
  final Color borderColor;

  const PasswordTextFields({
    Key? key,
    required this.controller,
    required this.keybordType,
    required this.obscureText,
    required this.suffixIcon,
    required this.color,
    required this.hintText,
    required this.weight,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: keybordType,
      decoration: InputDecoration(
        focusColor: ColorData.black,
        fillColor: const Color(0xffFAFAFA),
        filled: true,
        counterText: '',
        border: const OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: suffixIcon,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1.8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.primary, width: 1.8),
        ),
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: GoogleFonts.lato(
          color: ColorData.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: GoogleFonts.lato(
        color: ColorData.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
