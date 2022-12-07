import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_availability.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_feedback.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_languages.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/d_profile.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/d_settings_screens/finances.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/edit_merchant_app.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/m_settings_screens/m_languages.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/m_settings_screens/resutaurants_status.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverAppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  text: 'Settings',
                  size: 22,
                  weight: FontWeight.w700,
                ),
                Image.asset(
                  Assets.imagesBellBlack,
                  height: 23,
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
                  paddingLeft: 30,
                  text: 'Preferences',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 10,
                ),
                InkWell(
                  onTap: () => Get.to(() => DriverLanguages()),
                  splashColor: kBlackColor.withOpacity(0.05),
                  highlightColor: kBlackColor.withOpacity(0.05),
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
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 15,
                            text: 'Language',
                            size: 15,
                            color: kBlackColor.withOpacity(0.80),
                          ),
                        ),
                        MyText(
                          paddingRight: 10,
                          text: 'English',
                          size: 15,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                        Image.asset(
                          Assets.imagesNextLight,
                          height: 19,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => SetAvailability()),
                  splashColor: kBlackColor.withOpacity(0.05),
                  highlightColor: kBlackColor.withOpacity(0.05),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesOpenStatus,
                          height: 18,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 15,
                            text: 'Set availability',
                            size: 15,
                            color: kBlackColor.withOpacity(0.80),
                          ),
                        ),
                        MyText(
                          paddingRight: 10,
                          text: 'Available',
                          size: 15,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                        Image.asset(
                          Assets.imagesNextLight,
                          height: 19,
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
                  paddingLeft: 30,
                  text: 'Finances',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 10,
                ),
                DriverAppProfileTiles(
                  onTap: () => Get.to(() => Finances()),
                  icon: Assets.imagesCreditCard,
                  title: 'Finances',
                ),
                DriverAppProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesCoins,
                  iconSize: 17.0,
                  title: 'Stats',
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
                  paddingLeft: 30,
                  text: 'Account',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 10,
                ),
                DriverAppProfileTiles(
                  onTap: () => Get.to(() => DProfile()),
                  icon: Assets.imagesFile,
                  title: 'Profile',
                ),
                DriverAppProfileTiles(
                  onTap: () => Get.to(
                    () => Support(
                      title: 'Support',
                    ),
                  ),
                  icon: Assets.imagesSupport,
                  title: 'Support',
                ),
                DriverAppProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesHistory,
                  title: 'Benefits and insurance',
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
                  title: 'Vehicle',
                  iconSize: 14.25,
                  titleColor: kBlackColor.withOpacity(0.45),
                ),
                DriverAppProfileTiles(
                  onTap: () => Get.to(() => DFeedback()),
                  icon: Assets.imagesFeedback,
                  title: 'Feedback',
                  titleColor: kBlackColor.withOpacity(0.45),
                ),
                DriverAppProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesSignOut,
                  title: 'Sign Out',
                  titleColor: kBlackColor.withOpacity(0.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
    'Bike',
    'Motorcycle',
    'Car',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                color: Color(0xffF1F1F1),
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
                          text: vehicles[index],
                          size: 18,
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
    return InkWell(
      onTap: onTap,
      splashColor: kBlackColor.withOpacity(0.05),
      highlightColor: kBlackColor.withOpacity(0.05),
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
            ),
            Expanded(
              child: MyText(
                paddingLeft: 15,
                text: title,
                size: 15,
                color: titleColor ?? kBlackColor.withOpacity(0.80),
              ),
            ),
            Image.asset(
              Assets.imagesNextLight,
              height: 19,
            ),
          ],
        ),
      ),
    );
  }
}
