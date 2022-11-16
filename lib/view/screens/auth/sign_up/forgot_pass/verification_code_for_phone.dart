import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/create_new_pass.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeForPhone extends StatefulWidget {
  @override
  State<VerifyCodeForPhone> createState() => _VerifyCodeForPhoneState();
}

class _VerifyCodeForPhoneState extends State<VerifyCodeForPhone> {
  final defaultPinTheme = PinTheme(
    width: 51,
    height: 51,
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: kBlackColor,
      fontFamily: GoogleFonts.dmSans().fontFamily,
    ),
    decoration: BoxDecoration(
      color: kSeoulColor2,
      border: Border.all(
        color: Colors.transparent,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
  bool isActive = false;

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
          authHeading('Verification Code'),
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
                  text:
                      'Please enter the code we just sent to your  phone number ',
                ),
                TextSpan(
                  style: TextStyle(
                    color: kBlackColor,
                  ),
                  text: '(+62) 822 8578 XXX',
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
              color: kSeoulColor2,
              border: Border.all(
                color: kSecondaryColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration?.copyWith(
                color: kSeoulColor2,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {},
            onCompleted: (pin) {
              setState(() {
                pin.length == 4 ? isActive = true : isActive = false;
              });
            },
            separator: SizedBox(
              width: 12,
            ),
          ),
          SizedBox(
            height: 27,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              MyText(
                text: 'If you didn’t receive a code?',
                size: 14,
                weight: FontWeight.w700,
                color: kTertiaryColor,
              ),
              MyText(
                text: ' Resend',
                size: 14,
                weight: FontWeight.w700,
                color: kSecondaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          MyButton(
            isActive: isActive,
            buttonText: 'Continue',
            onTap: () => Get.to(() => CreateNewPass()),
          ),
        ],
      ),
    );
  }
}
