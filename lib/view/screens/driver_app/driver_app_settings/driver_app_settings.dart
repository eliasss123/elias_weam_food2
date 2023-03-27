import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_availability.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_change_theme.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_feedback.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_languages.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_profile.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/finances.dart';
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_splash_screen.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverAppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'settings'.tr,
                    size: 22,
                    weight: FontWeight.w700,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  Image.asset(
                    Assets.imagesBellBlack,
                    height: 23,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  MyText(
                    paddingTop: 25,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'preferences'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 10,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => DriverLanguages()),
                    splashColor: isDark
                        ? kPrimaryColor.withOpacity(0.05)
                        : kBlackColor.withOpacity(0.05),
                    highlightColor: isDark
                        ? kPrimaryColor.withOpacity(0.05)
                        : kBlackColor.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesGlobe,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: isEnglish ? 15 : 0,
                              paddingRight: isEnglish ? 0 : 15,
                              text: 'language'.tr,
                              size: 15,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.80)
                                  : kBlackColor.withOpacity(0.80),
                            ),
                          ),
                          MyText(
                            paddingRight: isEnglish ? 10 : 0,
                            paddingLeft: isEnglish ? 0 : 10,
                            text: 'english'.tr,
                            size: 15,
                            weight: FontWeight.w500,
                            color: kSecondaryColor,
                          ),
                          RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesNextLight,
                              height: 19,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.9)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => SetAvailability()),
                    splashColor: isDark
                        ? kPrimaryColor.withOpacity(0.05)
                        : kBlackColor.withOpacity(0.05),
                    highlightColor: isDark
                        ? kPrimaryColor.withOpacity(0.05)
                        : kBlackColor.withOpacity(0.05),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesOpenStatus,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: isEnglish ? 15 : 0,
                              paddingRight: isEnglish ? 0 : 15,
                              text: 'set_availability'.tr,
                              size: 15,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.80)
                                  : kBlackColor.withOpacity(0.80),
                            ),
                          ),
                          MyText(
                            paddingRight: isEnglish ? 10 : 0,
                            paddingLeft: isEnglish ? 0 : 10,
                            text: 'available'.tr,
                            size: 15,
                            weight: FontWeight.w500,
                            color: kSecondaryColor,
                          ),
                          RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesNextLight,
                              height: 19,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.9)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => DChangeTheme()),
                    splashColor: isDark
                        ? kPrimaryColor.withOpacity(0.05)
                        : kBlackColor.withOpacity(0.05),
                    highlightColor: isDark
                        ? kPrimaryColor.withOpacity(0.05)
                        : kBlackColor.withOpacity(0.05),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesThemeEmpty,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: isEnglish ? 15 : 0,
                              paddingRight: isEnglish ? 0 : 15,
                              text: 'change_theme'.tr.capitalizeFirst,
                              size: 15,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.80)
                                  : kBlackColor.withOpacity(0.80),
                            ),
                          ),
                          // MyText(
                          //   paddingRight: isEnglish ? 10 : 0,
                          //   paddingLeft: isEnglish ? 0 : 10,
                          //   text: 'Light Mode'.tr,
                          //   size: 15,
                          //   weight: FontWeight.w500,
                          //   color: kSecondaryColor,
                          // ),
                          RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesNextLight,
                              height: 19,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.9)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    height: 1,
                    color: kDividerColor,
                  ),
                  MyText(
                    paddingTop: 15,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'finances'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 10,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  DriverAppProfileTiles(
                    onTap: () => Get.to(() => Finances()),
                    icon: Assets.imagesCreditCard,
                    title: 'finances'.tr,
                  ),
                  DriverAppProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesCoins,
                    iconSize: 17.0,
                    title: 'stats'.tr,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    height: 1,
                    color: kDividerColor,
                  ),
                  MyText(
                    paddingTop: 15,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'account'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 10,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  DriverAppProfileTiles(
                    onTap: () => Get.to(() => DProfile()),
                    icon: Assets.imagesFile,
                    title: 'profile'.tr,
                  ),
                  DriverAppProfileTiles(
                    onTap: () => Get.to(
                      () => Support(
                        title: 'support'.tr,
                      ),
                    ),
                    icon: Assets.imagesSupport,
                    title: 'support'.tr,
                  ),
                  DriverAppProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesHistory,
                    title: 'benefits_and_insurance'.tr,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    height: 1,
                    color: kDividerColor,
                  ),
                  DriverAppProfileTiles(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        builder: (_) {
                          return SimpleBottomSheet(
                            height: 280,
                            content: VehicleBottomSheet(),
                          );
                        },
                      );
                    },
                    icon: Assets.imagesVehicle,
                    title: 'vehicle'.tr,
                    iconSize: 14.25,
                    titleColor: isDark
                        ? kPrimaryColor.withOpacity(0.80)
                        : kBlackColor.withOpacity(0.45),
                  ),
                  DriverAppProfileTiles(
                    onTap: () => Get.to(() => DFeedback()),
                    icon: Assets.imagesFeedback,
                    title: 'feedback'.tr,
                    titleColor: isDark
                        ? kPrimaryColor.withOpacity(0.80)
                        : kBlackColor.withOpacity(0.45),
                  ),
                  DriverAppProfileTiles(
                    onTap: () => Get.offAll(() => DriverSplashScreen()),
                    icon: Assets.imagesSignOut,
                    title: 'sign_out'.tr,
                    titleColor: isDark
                        ? kPrimaryColor.withOpacity(0.80)
                        : kBlackColor.withOpacity(0.45),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class VehicleBottomSheet extends StatefulWidget {
  VehicleBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleBottomSheet> createState() => _VehicleBottomSheetState();
}

class _VehicleBottomSheetState extends State<VehicleBottomSheet> {
  final List<String> vehicles = [
    'bike',
    'motorcycle',
    'car',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) {
              return Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDark ? kDarkPrimaryColor : Color(0xffF1F1F1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
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
                            text: vehicles[index].toString().tr,
                            size: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                          Container(
                            height: 22.5,
                            width: 22.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index
                                  ? kSecondaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                width: 1.5,
                                color: currentIndex == index
                                    ? kSecondaryColor
                                    : kBorderColor4,
                              ),
                            ),
                            child: Icon(
                              Icons.check,
                              size: 15,
                              color: currentIndex == index
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
      );
    });
  }
}

class DriverAppProfileTiles extends StatelessWidget {
  DriverAppProfileTiles({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.iconSize,
  });

  final String icon, title;
  final VoidCallback onTap;
  Color? titleColor;
  double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return InkWell(
        onTap: onTap,
        splashColor: isDark
            ? kPrimaryColor.withOpacity(0.05)
            : kBlackColor.withOpacity(0.05),
        highlightColor: isDark
            ? kPrimaryColor.withOpacity(0.05)
            : kBlackColor.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: iconSize ?? 18,
                color: isDark ? kPrimaryColor : null,
              ),
              Expanded(
                child: MyText(
                  paddingLeft: isEnglish ? 15 : 0,
                  paddingRight: isEnglish ? 0 : 15,
                  text: title,
                  size: 15,
                  color: titleColor == null
                      ? isDark
                          ? kPrimaryColor.withOpacity(0.80)
                          : kBlackColor.withOpacity(0.80)
                      : titleColor,
                ),
              ),
              RotatedBox(
                quarterTurns: isEnglish ? 0 : 2,
                child: Image.asset(
                  Assets.imagesNextLight,
                  height: 19,
                  color: isDark ? kPrimaryColor.withOpacity(0.9) : null,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
