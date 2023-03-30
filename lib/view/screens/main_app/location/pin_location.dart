import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/address_details.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;

      return Scaffold(
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            // APP BAR
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesMap,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesArrowBack,
                              height: 24,
                              color: isDark ? kGreyColor : null,
                            ),
                          ),
                        ),
                        MyText(
                          text: 'pin_location'.tr,
                          size: 21,
                          weight: FontWeight.w700,
                          color: isDark ? kGreyColor : null,
                        ),
                        Container(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CommonImageView(
                      height: 45,
                      width: 45,
                      radius: 12.0,
                      imagePath: isDark
                          ? Assets.imagesDarkModeSearch
                          : Assets.imagesMapSearch,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CommonImageView(
                      height: 45,
                      width: 45,
                      radius: 12.0,
                      imagePath: isDark
                          ? Assets.imagesDarkModeLoc
                          : Assets.imagesCurrentLoc,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? kDarkInputBgColor : kPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -4),
                        blurRadius: 32,
                        color: kBlackColor.withOpacity(0.06),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: AddressDetails(
                    isDark: isDark,
                  ),
                ),
              ],
            ),
            // LOCATION
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  Assets.imagesDestination,
                  height: 92,
                ),
              ),
            ),
            //  MY LOCATION
            Positioned(
              top: 150,
              right: 80,
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor:
                          isDark ? kDarkPrimaryColor : kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      builder: (_) {
                        return AddressDetails(
                          isDark: isDark,
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    Assets.imagesMyLocation,
                    height: 59,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
