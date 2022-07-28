import 'package:coin_base/auth/otp.dart';
import 'package:coin_base/utils/routes/routes_name.dart';
import 'package:coin_base/widgets/buttons.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/const.dart';
import 'package:coin_base/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    mobileController.dispose();
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

              //MOB NUMBER
              "Mobile Number"
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
                controller: mobileController,
                obscureText: false,
                keybordType: TextInputType.number,
                suffixIcon: SvgPicture.asset(""),
                color: const Color(0xFFFAFAFA),
                hintText: "Mobile Number",
                weight: FontWeight.w500,
                borderColor: ColorData.primary,
              ),
              40.heightBox,

              //OTP BUTTON
              AnimatedButton(
                textName: "Send otp".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OtpScreen(phone: mobileController.text)));
                },
                buttonColor: ColorData.primary,
              ),
              32.heightBox,

              //EMAIL BUTTON
              AnimatedButton(
                textName: "Countinue with Email".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.login);
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
            ],
          ),
        ),
      ),
    );
  }
}
