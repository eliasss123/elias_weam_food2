import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Currency extends StatefulWidget {
  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final List<String> languages = [
    '\$',
    '₪',
  ];

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'currency'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60,
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDark ? kDarkInputBgColor : kSeoulColor3,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: languages[index].tr,
                                size: 20,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                              Container(
                                height: 22.5,
                                width: 22.5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      languageController.currentIndex.value ==
                                              index
                                          ? kSecondaryColor
                                          : Colors.transparent,
                                  border: Border.all(
                                    width: 1.5,
                                    color:
                                        languageController.currentIndex.value ==
                                                index
                                            ? kSecondaryColor
                                            : kBorderColor4,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 15,
                                  color:
                                      languageController.currentIndex.value ==
                                              index
                                          ? kPrimaryColor
                                          : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 45,
                right: 45,
                top: 20,
                bottom: isIos ? 23 : 20,
              ),
              child: MyButton(
                buttonText: 'save'.tr,
                onTap: () {},
              ),
            ),
          ],
        ),
      );
    });
  }
}
