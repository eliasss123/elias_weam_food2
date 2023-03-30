import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_bottom_nav/merchant_bottom_nav.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantLanguages extends StatefulWidget {
  @override
  State<MerchantLanguages> createState() => _MerchantLanguagesState();
}

class _MerchantLanguagesState extends State<MerchantLanguages> {
  final List<String> languagesList = [
    'English',
    'Hebrew',
    'Arabic',
  ];
  final List<String> languages = [
    'english',
    'hebrew',
    'arabic',
  ];

  @override
  void initState() {
    super.initState();
    getLanguageIndex();
  }

  void getLanguageIndex() async {
    languageController.currentIndex.value =
        await UserSimplePreferences.getLanguageIndex() ?? 0;
    languageController.currentIndex.value != 0
        ? languageController.isEnglish.value = false
        : languageController.isEnglish.value = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: simpleAppBar(
        title: 'language'.tr,
        titleWeight: FontWeight.w700,
        isDark: false,
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
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSeoulColor3,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        languageController.onLanguageChanged(
                          languagesList[index],
                          index,
                        );
                        Get.offAll(() => MerchantBottomNav());
                      },
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
                              size: 18,
                              color: kBlackColor2,
                            ),
                            Obx(() {
                              return Container(
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
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     left: 45,
          //     right: 45,
          //     top: 20,
          //     bottom: isIos ? 23 : 20,
          //   ),
          //   child: MyButton(
          //     buttonText: 'Next',
          //     onTap: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
