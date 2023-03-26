import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePickupTime extends StatelessWidget {
  final List<Map<String, dynamic>> timeSlots = [
    {
      'time': '60',
      'isMinutes': false,
      'borderColor': kBlackColor.withOpacity(0.12),
      'filledColor': Colors.transparent,
      'textColor': kBlackColor.withOpacity(0.60),
    },
    {
      'time': '2',
      'isMinutes': true,
      'borderColor': kBlackColor.withOpacity(0.12),
      'filledColor': Colors.transparent,
      'textColor': kBlackColor.withOpacity(0.60),
    },
    {
      'time': '3',
      'isMinutes': true,
      'borderColor': kBlackColor.withOpacity(0.12),
      'filledColor': Colors.transparent,
      'textColor': kBlackColor.withOpacity(0.60),
    },
    {
      'time': '5',
      'isMinutes': true,
      'borderColor': kBlackColor.withOpacity(0.12),
      'filledColor': Colors.transparent,
      'textColor': kBlackColor.withOpacity(0.60),
    },
    {
      'time': '7',
      'isMinutes': true,
      'borderColor': kLightGreenColor2,
      'filledColor': kLightGreenColor2,
      'textColor': kSecondaryColor,
    },
    {
      'time': '10',
      'isMinutes': true,
      'borderColor': kLightGreenColor2,
      'filledColor': kLightGreenColor2,
      'textColor': kSecondaryColor,
    },
    {
      'time': '15',
      'isMinutes': true,
      'borderColor': kLightGreenColor2,
      'filledColor': kLightGreenColor2,
      'textColor': kSecondaryColor,
    },
    {
      'time': '20',
      'isMinutes': true,
      'borderColor': Colors.transparent,
      'filledColor': kOrangeColor.withOpacity(0.17),
      'textColor': kOrangeColor,
    },
    {
      'time': '30',
      'isMinutes': true,
      'borderColor': Colors.transparent,
      'filledColor': kOrangeColor.withOpacity(0.17),
      'textColor': kOrangeColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
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
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: RotatedBox(
                      quarterTurns: isEnglish ? 0 : 2,
                      child: Image.asset(
                        Assets.imagesArrowBack,
                        height: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyText(
                      align: TextAlign.center,
                      paddingRight: 15,
                      text: 'change_pickup_time'.tr,
                      size: 22,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 18,
              height: 1.7,
              text: 'how_long_will_you_take_to_finish_this_order'.tr,
              align: TextAlign.center,
              size: 14,
              color: Color(0xff959595),
              paddingBottom: 45,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 85,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  var data = timeSlots[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: data['filledColor'],
                      border: Border.all(
                        width: 1.0,
                        color: data['borderColor'],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(9),
                        splashColor: data['textColor'].withOpacity(0.1),
                        highlightColor: data['textColor'].withOpacity(0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              text: data['time'],
                              size: 20,
                              weight: FontWeight.w700,
                              color: data['textColor'],
                            ),
                            MyText(
                              paddingTop: 6,
                              text: data['isMinutes'] ? 'mins'.tr : 'secs'.tr,
                              size: 12,
                              letterSpacing: 0.0,
                              color: data['textColor'],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                width: 211,
                child: Column(
                  children: [
                    Container(
                      height: 49,
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
                          onTap: () {},
                          splashColor: kSecondaryColor.withOpacity(0.05),
                          highlightColor: kSecondaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: MyText(
                              text: 'custom_time'.tr,
                              size: 14,
                              weight: FontWeight.w700,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      buttonText: 'next'.tr,
                      onTap: () {},
                      height: 50,
                      radius: 10.0,
                      textSize: 14,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );
    });
  }
}
