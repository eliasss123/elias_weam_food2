import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/auth/merchant_login.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantGetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.imagesGetStartedBg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesVaiGetStarted,
                    height: 79.8,
                  ),
                ),
                MyText(
                  paddingTop: 60,
                  paddingLeft: 35,
                  paddingRight: 35,
                  paddingBottom: 50,
                  text:
                      'Enim augue aliquam maecenas cursus nisi, vitae. Congue et blandit amet.',
                  size: 16,
                  letterSpacing: 0.0,
                  color: kPrimaryColor,
                  height: 1.8,
                  align: TextAlign.center,
                ),
                Center(
                  child: SizedBox(
                    width: 207,
                    child: MyButton(
                      height: 52,
                      textSize: 16,
                      buttonText: 'Login',
                      onTap: () => Get.to(() => MerchantLogin()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 207,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        splashColor: kPrimaryColor.withOpacity(0.1),
                        highlightColor: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        child: Center(
                          child: MyText(
                            text: 'Sign Up',
                            size: 16,
                            weight: FontWeight.w500,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 40,
                    right: 40,
                  ),
                  height: 51,
                  width: 51,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: kSecondaryColor.withOpacity(0.05),
                      highlightColor: kSecondaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(100),
                      child: Center(
                        child: Image.asset(
                          Assets.imagesArrowRightNormal,
                          height: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
