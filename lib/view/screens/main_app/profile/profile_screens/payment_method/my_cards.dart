import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/payment_method/add_new_card.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'payment_methods'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'your_payment_methods:'.tr,
                size: 14,
                color: kGreyColor7,
                weight: FontWeight.w500,
                paddingBottom: 15,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return CardsTiles(
                      img: index == 1
                          ? Assets.imagesPayApple
                          : Assets.imagesVisaPay,
                      holderName: 'Alex Smith',
                      cardType: 'credit_card'.tr,
                      isDefault: index == 0 ? true : false,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: MyButton(
                  buttonText: '+ ${'add_new_card'.tr}',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      elevation: 0,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) {
                        return AddNewCard();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ignore: must_be_immutable
class CardsTiles extends StatelessWidget {
  CardsTiles({
    Key? key,
    required this.img,
    required this.holderName,
    required this.cardType,
    required this.isDefault,
  }) : super(key: key);

  final String img, holderName, cardType;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Container(
        margin: EdgeInsets.only(
          bottom: 13,
        ),
        padding:
            EdgeInsets.fromLTRB(isEnglish ? 10 : 0, 0, isEnglish ? 0 : 10, 0),
        height: 79,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? kPrimaryColor : kBlackColor2,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  img,
                  height: 48,
                  width: 65.45,
                  color: isDark ? kPrimaryColor : kBlackColor2,
                ),
                isDefault
                    ? Positioned(
                        right: 0,
                        top: -2,
                        child: Image.asset(
                          Assets.imagesRoundedCheckBorder,
                          height: 22,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text: holderName,
                    size: 20,
                    weight: FontWeight.w500,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  MyText(
                    text: cardType,
                    size: 14,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.5)
                        : kBlackColor2.withOpacity(0.50),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  elevation: 0,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) {
                    return SimpleBottomSheet(
                      height: 210,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: isEnglish
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                height: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: isDark
                                      ? kDarkPrimaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    width: 1.0,
                                    color: isDark
                                        ? kDarkPrimaryColor
                                        : kBlackColor2,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: MyText(
                                    text: 'update_card_details'.tr,
                                    size: 16,
                                    weight: FontWeight.w500,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: isEnglish
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              height: 53,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: isDark
                                    ? kDarkPrimaryColor
                                    : Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color:
                                      isDark ? kDarkPrimaryColor : kBlackColor2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: MyText(
                                  text: 'remove_card'.tr,
                                  size: 16,
                                  weight: FontWeight.w500,
                                  color: isDark ? kPrimaryColor : kBlackColor2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                Assets.imagesIconsMoreVert,
                height: 30,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
            ),
          ],
        ),
      );
    });
  }
}
