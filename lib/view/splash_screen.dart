import 'dart:async';
import 'package:coin_base/utils/routes/routes.dart';
import 'package:coin_base/utils/routes/routes_name.dart';
import 'package:coin_base/view/Home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, RoutesName.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 220,
            width: 220,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
      ],
    ));
  }
}
