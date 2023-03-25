import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_home/delivery_detail_page.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class DriverAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        body: Stack(
          children: [
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
            ),
            Positioned(
              bottom: 20,
              right: 30,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CommonImageView(
                      height: 45,
                      width: 45,
                      radius: 12.0,
                      imagePath: Assets.imagesWaze,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CommonImageView(
                      height: 45,
                      width: 45,
                      radius: 12.0,
                      imagePath: Assets.imagesCurrentLoc,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: isDark ? kDarkPrimaryColor : kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: kBlackColor.withOpacity(0.03),
                          offset: Offset(10, 10),
                          blurRadius: 30,
                          spreadRadius: 14,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CommonImageView(
                              height: 44,
                              width: 44,
                              radius: 100.0,
                              url: dummyImg2,
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'Leo Smith',
                                    size: 14,
                                    weight: FontWeight.w700,
                                    paddingBottom: 8,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                  MyText(
                                    text: '12 courses',
                                    size: 13,
                                    color: isDark
                                        ? kPrimaryColor.withOpacity(0.40)
                                        : kBlackColor.withOpacity(0.40),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyText(
                                  text: 'Balance',
                                  size: 12,
                                  color: isDark
                                      ? kPrimaryColor.withOpacity(0.40)
                                      : kBlackColor.withOpacity(0.40),
                                  paddingBottom: 8,
                                ),
                                MyText(
                                  text: '120.62€',
                                  size: 13,
                                  weight: FontWeight.w500,
                                  color: kSecondaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ProfileCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  Assets.imagesDeliveryCar,
                  height: 59,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                30,
                isIos ? 65 : 50,
                30,
                20,
              ),
              child: Container(
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
                        text: 'Online',
                        size: 15,
                        weight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                    FlutterSwitch(
                      width: 39,
                      height: 24,
                      value: true,
                      onToggle: (value) {},
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
            ),
            Positioned(
              top: 200,
              left: 50,
              child: Stack(
                children: [
                  Image.asset(
                    Assets.imagesRestaurantPin,
                    height: 60,
                  ),
                  Positioned(
                    top: 6.3,
                    left: 6.3,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return OrderAcceptDialog();
                          },
                        );
                      },
                      child: CommonImageView(
                        height: 27,
                        width: 27,
                        radius: 100.0,
                        url: dummyImg2,
                      ),
                    ),
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

class OrderAcceptDialog extends StatelessWidget {
  OrderAcceptDialog({
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> refundSteps = [
    {
      'title': 'Pickup Point  -  16:32',
      'subTitle': '302 Manor St. Brooklyn',
    },
    {
      'title': 'Drop off point  -  16:41',
      'subTitle': '710 S. High Point Street, New York',
    },
  ];

  int currentRefundStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 391,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.03),
                offset: Offset(10, 10),
                blurRadius: 30,
                spreadRadius: 14,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Would you like to\naccept this order?',
                size: 17,
                weight: FontWeight.w700,
                align: TextAlign.center,
              ),
              Container(
                height: 65,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: kSeoulColor6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonImageView(
                      height: 39,
                      width: 39,
                      radius: 100.0,
                      url: dummyImg2,
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
                            text: 'Italia Trattoria',
                            size: 13,
                            weight: FontWeight.w500,
                            paddingBottom: 8,
                          ),
                          MyText(
                            text: '2.3 km',
                            size: 12,
                            color: kBlackColor.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      text: '\$11.45',
                      size: 13,
                      weight: FontWeight.w700,
                      color: kSecondaryColor,
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: EnhanceStepper(
                  type: StepperType.vertical,
                  stepIconSize: 16,
                  currentStep: 0,
                  physics: BouncingScrollPhysics(),
                  steps: List.generate(
                    refundSteps.length,
                    (index) {
                      var data = refundSteps[index];
                      return EnhanceStep(
                        state: index == 0
                            ? StepState.complete
                            : StepState.disabled,
                        title: MyText(
                          size: 12,
                          color: kBlackColor.withOpacity(0.40),
                          text: data['title'],
                        ),
                        subtitle: MyText(
                          size: 12,
                          text: data['subTitle'],
                        ),
                        isActive: false,
                        icon: Image.asset(
                          index == 0
                              ? Assets.imagesPickUpOrder
                              : Assets.imagesDropOffOrder,
                          height: 16,
                        ),
                        content: Row(
                          children: [
                            SizedBox(),
                          ],
                        ),
                      );
                    },
                  ),
                  onStepCancel: () {},
                  onStepContinue: () {},
                  onStepTapped: (index) {},
                  controlsBuilder: (
                    BuildContext context,
                    ControlsDetails details,
                  ) {
                    return SizedBox();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: kSecondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          splashColor: kSecondaryColor.withOpacity(0.1),
                          highlightColor: kSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Center(
                            child: MyText(
                              text: 'Support',
                              size: 15,
                              weight: FontWeight.w500,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: MyButton(
                      height: 45,
                      textSize: 14,
                      buttonText: 'Accept',
                      radius: 10.0,
                      onTap: () => Get.to(
                        () => DeliveryDetailPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        height: 71,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: isDark ? kDarkInputBgColor : kSeoulColor5,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.03),
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 14,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: 'Accepted',
                  size: 12,
                  color: isDark
                      ? kPrimaryColor.withOpacity(0.44)
                      : kBlackColor.withOpacity(0.44),
                  paddingBottom: 10,
                ),
                MyText(
                  text: '87%',
                  size: 15,
                  color: isDark ? kPrimaryColor : kBlackColor,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              width: 1,
              color: Color(0xffEDEDED),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: 'Rating',
                  size: 12,
                  color: isDark
                      ? kPrimaryColor.withOpacity(0.44)
                      : kBlackColor.withOpacity(0.44),
                  paddingBottom: 10,
                ),
                MyText(
                  text: '4.3',
                  size: 15,
                  color: isDark ? kPrimaryColor : kBlackColor,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              width: 1,
              color: Color(0xffEDEDED),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: 'Tip',
                  size: 12,
                  color: isDark
                      ? kPrimaryColor.withOpacity(0.44)
                      : kBlackColor.withOpacity(0.44),
                  paddingBottom: 10,
                ),
                MyText(
                  text: '15€',
                  size: 15,
                  color: isDark ? kPrimaryColor : kBlackColor,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
