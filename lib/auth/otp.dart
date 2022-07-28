import 'package:coin_base/utils/routes/routes_name.dart';
import 'package:coin_base/widgets/buttons.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/const.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.mobileLogin);
          },
          icon: (const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorData.black,
          )),
        ),
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
              //LOGO
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: height(context) * .18,
                ),
              ),

              Column(
                children: [
                  "Enter otp"
                      .toUpperCase()
                      .text
                      .textStyle(
                        GoogleFonts.lato(
                          color: ColorData.black,
                          fontSize: 22,
                        ),
                      )
                      .make(),
                  20.heightBox,
                  "Enter the 4 digit OTP  sent to your +91 8849273553"
                      .text
                      .align(TextAlign.center)
                      .textStyle(
                        GoogleFonts.lato(
                          height: 1.5,
                          color: ColorData.grey,
                          fontSize: 16,
                        ),
                      )
                      .make(),
                  48.heightBox,
                ],
              ),

              //ENTER OTP
              "Enter OTP"
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
                controller: _otpController,
                obscureText: false,
                keybordType: TextInputType.number,
                suffixIcon: SvgPicture.asset(""),
                color: const Color(0xFFFAFAFA),
                hintText: "Enter OTP",
                weight: FontWeight.w500,
                borderColor: ColorData.primary,
              ),
              40.heightBox,

              //CONTINUE BUTTON
              AnimatedButton(
                textName: "Submit".toUpperCase(),
                // loading: authViewModel.loading,
                onPressed: () {},
                buttonColor: ColorData.primary,
              ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
