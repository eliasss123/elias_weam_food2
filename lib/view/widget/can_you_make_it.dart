import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_home/change_pickup_time.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CanYouMakeIt extends StatelessWidget {
  const CanYouMakeIt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            height: 244,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  paddingTop: 20,
                  text: '${'pickup_in'.tr} 5 ${'min_can_you_make_it'.tr}',
                  size: 17,
                  weight: FontWeight.w700,
                  height: 1.7,
                  align: TextAlign.center,
                ),
                MyText(
                  text: 'we_also_send_this_update_to_the_customer'.tr,
                  height: 1.7,
                  color: kDarkGreyColor4.withOpacity(0.60),
                  align: TextAlign.center,
                  paddingBottom: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.0,
                              color: kSecondaryColor,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Get.to(() => ChangePickupTime()),
                              splashColor: kSecondaryColor.withOpacity(0.05),
                              highlightColor: kSecondaryColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: MyText(
                                  text: 'change_estimate'.tr,
                                  size: 14,
                                  weight: FontWeight.w700,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Obx(() {
                        bool isEnglish = languageController.isEnglish.value;
                        return Expanded(
                          flex: isEnglish ? 4 : 5,
                          child: MyButton(
                            buttonText: 'lets_do_it'.tr,
                            onTap: () {},
                            height: 45,
                            radius: 10.0,
                            textSize: 14,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
