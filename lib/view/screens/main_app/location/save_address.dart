import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveAddress extends StatelessWidget {
  final bool isDark;

  const SaveAddress({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.7,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                MyText(
                  text: 'address_details'.tr,
                  size: 18,
                  weight: FontWeight.w500,
                  paddingBottom: 25,
                  color: isDark ? kPrimaryColor : kBlackColor2,
                ),
                MyText(
                  text: 'please_provide_your_exact_location'.tr,
                  color: isDark ? kPrimaryColor : kBlackColor,
                  paddingBottom: 12,
                ),
                Container(
                  height: 270,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: kSeoulColor7.withOpacity(0.30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      addressTiles(
                        title: 'building_number'.tr,
                      ),
                      addressTiles(
                        title: 'entrance'.tr,
                      ),
                      addressTiles(
                        title: 'floor'.tr,
                      ),
                      addressTiles(
                        title: 'apartment'.tr,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: MyText(
                              text: 'private_house'.tr,
                              size: 14,
                              weight: FontWeight.w700,
                              color: isDark ? kPrimaryColor : kBlackColor,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Image.asset(
                              Assets.imagesCheckRounded,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: MyButton(
              buttonText: 'save_address'.tr,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget addressTiles({
    String? title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: MyText(
              text: title,
              size: 14,
              weight: FontWeight.w500,
              color: isDark ? kPrimaryColor : kBlackColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 26,
              width: 68,
              decoration: BoxDecoration(
                color: kSeoulColor8,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: MyText(
                  text: 'optional'.tr,
                  size: 11,
                  color: kGreyColor,
                ),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
