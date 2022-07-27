import 'package:coin_base/auth/login.dart';
import 'package:coin_base/auth/mobile_login.dart';
import 'package:coin_base/auth/signup.dart';
import 'package:coin_base/view/Home/home_screen.dart';
import 'package:coin_base/view/splash_screen.dart';
import 'package:coin_base/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final argument = settings.arguments;
    switch (settings.name) {

      //SPLASH PAGE
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      //HOME PAGE
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      //NAVBAR PAGE
      case RoutesName.navBar:
        return MaterialPageRoute(builder: (context) => const NavBar());

      //LOGIN PAGE
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      //SIGNUP PAGE
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      //MOBILE LOGIN PAGE
      case RoutesName.mobileLogin:
        return MaterialPageRoute(
            builder: (context) => const MobileLoginScreen());

      //DEFAULT
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text(
                  "No Route Present",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
    }
  }
}
