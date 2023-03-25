import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/name.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      var defaultPinTheme = PinTheme(
        width: 47,
        height: 50,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: isDark ? kPrimaryColor : kBlackColor2,
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
        decoration: BoxDecoration(
          color: isDark ? kDarkInputBgColor : Colors.transparent,
          border: Border.all(
            color: isDark ? kDarkInputBgColor : kBorderColor2,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      );
      return Scaffold(
        appBar: simpleAppBar(isDark: isDark),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            authHeading('verify_your_phone_number'.tr),
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
                    text: 'enter_the_4_digit_code_sent_to_you_at'.tr,
                  ),
                  TextSpan(
                    style: TextStyle(
                      color: isDark ? kPrimaryColor : kBlackColor2,
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
              text: 'resend_code_via_sms'.tr,
              size: 14,
              weight: FontWeight.w700,
              color:
                  isDark ? kDarkModeGreyColor : kBlackColor2.withOpacity(0.50),
              align: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
