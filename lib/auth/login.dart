import 'package:coin_base/services/firebase_auth_methods.dart';
import 'package:coin_base/utils/routes/routes_name.dart';
import 'package:coin_base/utils/utils.dart';
import 'package:coin_base/widgets/buttons.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/const.dart';
import 'package:coin_base/widgets/textbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: height(context) * .18,
                ),
              ),
              40.heightBox,
              //EMAIL
              "Email"
                  .text
                  .textStyle(
                    GoogleFonts.lato(
                      color: ColorData.black,
                      fontSize: 16,
                    ),
                  )
                  .make(),
              12.heightBox,
              TextFields(
                controller: _emailController,
                obscureText: false,
                keybordType: TextInputType.emailAddress,
                suffixIcon: SvgPicture.asset(
                  "assets/svgs/mail.svg",
                  color: ColorData.primary,
                ),
                color: const Color(0xFFFAFAFA),
                hintText: "Email",
                weight: FontWeight.w500,
                borderColor: ColorData.primary,
              ),
              20.heightBox,

              //PASSWORD
              "Password"
                  .text
                  .textStyle(
                    GoogleFonts.lato(
                      color: ColorData.black,
                      fontSize: 16,
                    ),
                  )
                  .make(),
              12.heightBox,
              PasswordTextFields(
                controller: _passwordController,
                keybordType: TextInputType.text,
                obscureText: isHiddenPassword,
                suffixIcon: GestureDetector(
                  onTap: _showPassword,
                  child: isHiddenPassword == true
                      ? SvgPicture.asset(
                          "assets/svgs/eye.svg",
                          color: ColorData.primary,
                        )
                      : SvgPicture.asset(
                          "assets/svgs/hidden.svg",
                          color: ColorData.primary,
                        ),
                ),
                color: const Color(0xFFFAFAFA),
                hintText: "Password",
                weight: FontWeight.w500,
                borderColor: ColorData.primary,
              ),
              40.heightBox,

              //SIGN IN BUTTON
              AnimatedButton(
                textName: "Login".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: loginUser,
                buttonColor: ColorData.primary,
              ),
              32.heightBox,

              //MOBILE BUTTON
              AnimatedButton(
                textName: "Continue with mobile".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.mobileLogin);
                },
                buttonColor: ColorData.black,
              ),
              32.heightBox,

              //SIGNUP BUTTON
              SecondaryButton(
                textName: "Create Account".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.signUp);
                },
                buttonColor: ColorData.lightgrey.withOpacity(.6),
              ),
              32.heightBox,

              //SIGNUP BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallButton(
                    textName: "Facebook".toUpperCase(),
                    textColor: ColorData.white,
                    onPressed: () {
                      // Navigator.pushNamed(context, RoutesName.signUp);
                    },
                    buttonColor: Colors.blueAccent,
                  ),
                  SmallButton(
                    textName: "Google".toUpperCase(),
                    textColor: ColorData.white,
                    onPressed: () {
                      // Navigator.pushNamed(context, RoutesName.signUp);
                    },
                    buttonColor: Colors.red,
                  ),
                ],
              ),
              32.heightBox,
            ],
          ),
        ),
      ),
    );
  }

  void _showPassword() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
