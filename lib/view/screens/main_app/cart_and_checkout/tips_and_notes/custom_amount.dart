import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAmount extends StatefulWidget {
  @override
  State<CustomAmount> createState() => _CustomAmountState();
}

class _CustomAmountState extends State<CustomAmount> {
  int priceRangeIndex = 0;
  bool isActive = false;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor2,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios,
                color: isDark ? kPrimaryColor : kBlackColor2,
                size: 20,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'custom_amount'.tr,
                    size: 24,
                    weight: FontWeight.w700,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  MyText(
                    paddingTop: 8,
                    text: 'custom_your_favorite_amount_for_tips'.tr,
                    size: 16,
                    paddingBottom: 80,
                    color:
                        isDark ? kPrimaryColor.withOpacity(0.5) : kBlackColor2,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        value.isNotEmpty ? isActive = true : isActive = false;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    cursorColor: isDark ? kPrimaryColor : kBlackColor2,
                    style: TextStyle(
                      fontSize: 23.04,
                      fontWeight: FontWeight.w700,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      hintText: '\$',
                      hintStyle: TextStyle(
                        fontSize: 23.04,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffC3C1C4),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffC3C1C4),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDark ? Color(0xffC3C1C4) : kBlackColor2,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: MyButton(
                isActive: isActive,
                buttonText: 'ok'.tr,
                onTap: () {},
              ),
            ),
            // Expanded(
            //   child: NumericKeyboard(
            //     onKeyboardTap: (value) {},
            //     textColor: kBlackColor2,
            //     rightButtonFn: () {
            //       setState(() {
            //         // text = text.substring(0, text.length - 1);
            //       });
            //     },
            //     rightIcon: Icon(
            //       Icons.backspace,
            //       color: kBlackColor2,
            //     ),
            //     leftButtonFn: () {
            //       print('left button clicked');
            //     },
            //     // leftIcon: Icon(
            //     //   Icons.bul,
            //     //   color: kBlackColor2,
            //     // ),
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
