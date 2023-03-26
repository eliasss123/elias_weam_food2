import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/week_day_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class AddSchedule extends StatefulWidget {
  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final List<Map<String, dynamic>> weekdays = [
    {
      'day': 'sun',
      'isSelected': false,
    },
    {
      'day': 'mon',
      'isSelected': false,
    },
    {
      'day': 'tue',
      'isSelected': false,
    },
    {
      'day': 'wed',
      'isSelected': false,
    },
    {
      'day': 'thu',
      'isSelected': false,
    },
    {
      'day': 'fri',
      'isSelected': false,
    },
    {
      'day': 'sat',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: kSeoulColor6,
        appBar: AppBar(
          backgroundColor: kSeoulColor6,
          centerTitle: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
          title: MyText(
            text: 'time'.tr,
            size: 21,
            weight: FontWeight.w700,
          ),
          actions: [
            Center(
              child: MyText(
                text: 'done'.tr,
                size: 17,
                color: kSecondaryColor,
                paddingRight: isEnglish ? 30 : 0,
                paddingLeft: isEnglish ? 0 : 30,
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            MyText(
              text: 'time'.tr.toUpperCase(),
              size: 14,
              weight: FontWeight.w500,
              color: kBlackColor.withOpacity(0.60),
              paddingBottom: 10,
            ),
            Container(
              height: 112,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'from'.tr,
                        size: 20,
                        color: kBlackColor,
                      ),
                      Container(
                        height: 32,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kUnselectedColor.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: MyText(
                            text: '23:00',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kBlackColor.withOpacity(0.80),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: kDividerColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'to'.tr,
                        size: 20,
                        color: kBlackColor,
                      ),
                      Container(
                        height: 32,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kUnselectedColor.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: MyText(
                            text: '23:00',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kBlackColor.withOpacity(0.80),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 40,
              text: 'repeat'.tr.toUpperCase(),
              size: 14,
              weight: FontWeight.w500,
              color: kBlackColor.withOpacity(0.60),
              paddingBottom: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kPrimaryColor,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(
                  weekdays.length,
                  (index) {
                    var data = weekdays[index];
                    return WeekDayToggleButton(
                      onTap: () {
                        setState(() {
                          data['isSelected'] = !data['isSelected'];
                        });
                      },
                      isSelected: data['isSelected'],
                      weekDay: data['day'].toString().tr,
                    );
                  },
                ),
              ),
            ),
            MyText(
              paddingTop: 10,
              text: 'every_day'.tr,
              size: 14,
              weight: FontWeight.w500,
              color: kBlackColor.withOpacity(0.60),
              paddingBottom: 40,
            ),
          ],
        ),
      );
    });
  }
}
