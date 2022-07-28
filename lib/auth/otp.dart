import 'package:coin_base/widgets/buttons.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

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
              //TITLE

              Center(
                child: Column(
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
                    12.heightBox,
                    "Enter the 4 digit OTP  sent to your +91 8849273553"
                        .text
                        .textStyle(
                          GoogleFonts.lato(
                            color: ColorData.grey,
                            fontSize: 16,
                          ),
                        )
                        .make(),
                    32.heightBox,
                  ],
                ),
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
