import 'package:coin_base/utils/routes/routes_name.dart';
import 'package:coin_base/widgets/buttons.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/const.dart';
import 'package:coin_base/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                textName: "Sign Up".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: () {},
                buttonColor: ColorData.primary,
              ),
              32.heightBox,

              //ALREADY USER BTN
              TxtButton(
                textName: "Already a user? Login ",
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
              ),
              30.heightBox,
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
