import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/name.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatelessWidget {
  final defaultPinTheme = PinTheme(
    width: 47,
    height: 50,
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: kBlackColor2,
      fontFamily: GoogleFonts.dmSans().fontFamily,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: kBorderColor2,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [
          authHeading('Verify your phone number'),
          SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                fontFamily: GoogleFonts.dmSans().fontFamily,
                color: kTertiaryColor,
              ),
              children: [
                TextSpan(
                  text: 'Enter the 4-digit code sent to you at\n',
                ),
                TextSpan(
                  style: TextStyle(
                    color: kBlackColor2,
                  ),
                  text: '+96 97592530',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Pinput(
            length: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyDecorationWith(
              border: Border.all(
                color: kSecondaryColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration?.copyWith(
                border: Border.all(
                  color: kSecondaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {},
            onCompleted: (pin) {
              Get.to(() => Name());
            },
            separator: SizedBox(
              width: 12,
            ),
          ),
          MyText(
            paddingTop: 27,
            decoration: TextDecoration.underline,
            text: 'Resend code via SMS',
            size: 14,
            weight: FontWeight.w700,
            color: kBlackColor2.withOpacity(0.50),
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
