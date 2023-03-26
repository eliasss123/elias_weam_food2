import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/m_settings_screens/add_schedule.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/m_settings_screens/schedule_detail.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class RestaurantsStatus extends StatefulWidget {
  @override
  State<RestaurantsStatus> createState() => _RestaurantsStatusState();
}

class _RestaurantsStatusState extends State<RestaurantsStatus> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: kSeoulColor6,
        appBar: simpleAppBar(
          bgColor: kSeoulColor6,
          title: 'restaurant_status'.tr,
          titleWeight: FontWeight.w700,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            Container(
              height: 51,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'open'.tr,
                      size: 22,
                      color: kBlackColor,
                    ),
                  ),
                  FlutterSwitch(
                    width: 46.01,
                    height: 26.71,
                    value: isOpen,
                    onToggle: (value) {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    activeColor: kSecondaryColor,
                    inactiveColor: kInActiveSwitchColor,
                    borderRadius: 50.0,
                    toggleSize: 22.0,
                    padding: 2.2,
                    showOnOff: false,
                    toggleColor: kPrimaryColor,
                    inactiveToggleColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 60,
              text: 'open_automatically'.tr,
              size: 20,
              weight: FontWeight.w500,
              color: kBlackColor.withOpacity(0.60),
              paddingBottom: 10,
            ),
            Column(
              children: List.generate(
                3,
                (index) {
                  return ScheduleCard(
                    onTap: () => Get.to(() => ScheduleDetails()),
                    isEveryDay: index == 0 ? true : false,
                    isOn: index == 0 ? true : false,
                    timeFrom: '10:00',
                    timeTo: '23:00',
                    weekDays: index == 0
                        ? []
                        : [
                            'every_sunday'.tr,
                            'tue'.tr,
                            'wed'.tr,
                          ],
                  );
                },
              ),
            ),
            addSchedule(
              onTap: () => Get.to(() => AddSchedule()),
            ),
          ],
        ),
      );
    });
  }

  Widget addSchedule({
    VoidCallback? onTap,
  }) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Container(
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: kBlackColor.withOpacity(0.01),
            highlightColor: kBlackColor.withOpacity(0.01),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imagesAddSchedule,
                    height: 32,
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: isEnglish ? 15 : 0,
                      paddingRight: isEnglish ? 0 : 15,
                      text: 'add_schedule'.tr,
                      size: 19,
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.timeFrom,
    required this.timeTo,
    required this.isEveryDay,
    required this.isOn,
    required this.onTap,
    required this.weekDays,
  }) : super(key: key);

  final String timeFrom, timeTo;
  final bool isEveryDay, isOn;
  final VoidCallback onTap;
  final List<String> weekDays;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Container(
        margin: EdgeInsets.only(
          bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: kBlackColor.withOpacity(0.01),
            highlightColor: kBlackColor.withOpacity(0.01),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imagesClockGreen,
                    height: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: '$timeFrom - $timeTo',
                          size: 19,
                          color: kBlackColor,
                        ),
                        isEveryDay
                            ? MyText(
                                paddingTop: 2,
                                text: 'every_day'.tr,
                                size: 16,
                                color: kBlackColor.withOpacity(0.60),
                              )
                            : Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 5,
                                children: List.generate(
                                  weekDays.length,
                                  (index) => MyText(
                                    paddingTop: 2,
                                    text: '${weekDays[index]},',
                                    size: 16,
                                    color: kBlackColor.withOpacity(0.60),
                                    maxLines: 1,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  MyText(
                    paddingLeft: isEnglish ? 15 : 10,
                    paddingRight: isEnglish ? 10 : 15,
                    text: isOn ? 'on'.tr : 'off'.tr,
                    size: 18,
                    color: kBlackColor.withOpacity(0.50),
                  ),
                  RotatedBox(
                    quarterTurns: isEnglish ? 0 : 2,
                    child: Image.asset(
                      Assets.imagesNextLight,
                      height: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
