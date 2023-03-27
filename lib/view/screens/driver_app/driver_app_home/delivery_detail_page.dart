import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/custom_track_shape.dart';
import 'package:elias_weam_food2/view/widget/drop_off.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
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
              bottom: 25,
              right: 25,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: isEnglish
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 125,
                        child: MyButton(
                          height: 28,
                          radius: 8.0,
                          buttonText: 'restaurant_details'.tr,
                          textSize: 12,
                          textColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return RestaurantDetailDialog();
                              },
                            );
                          },
                        ),
                      ),
                      CommonImageView(
                        height: 45,
                        width: 45,
                        radius: 12.0,
                        imagePath: isDark
                            ? Assets.imagesDarkModeLoc
                            : Assets.imagesCurrentLoc,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: 'started'.tr,
                              size: 13,
                              weight: FontWeight.w500,
                              color: isDark ? kPrimaryColor : kBlackColor2,
                            ),
                            MyText(
                              text: 'food_pickup'.tr,
                              size: 13,
                              weight: FontWeight.w500,
                              color: isDark ? kPrimaryColor : kBlackColor2,
                            ),
                            MyText(
                              text: 'delivered'.tr,
                              size: 13,
                              weight: FontWeight.w500,
                              color: isDark ? kPrimaryColor : kBlackColor2,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 4.0,
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent,
                            disabledActiveTickMarkColor: Colors.transparent,
                            disabledInactiveTickMarkColor: Colors.transparent,
                            thumbColor: kSecondaryColor,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 9.0,
                              elevation: 0,
                            ),
                            trackShape: CustomTrackShape(),
                            activeTrackColor: kSecondaryColor,
                            inactiveTrackColor:
                                kSecondaryColor.withOpacity(0.10),
                          ),
                          child: Slider(
                            value: 50.0,
                            min: 0,
                            max: 100,
                            divisions: 2,
                            onChanged: (value) {},
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: '3:01 PM',
                              size: 13,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.40)
                                  : kBlackColor.withOpacity(0.40),
                            ),
                            MyText(
                              paddingRight: 60,
                              text: '3:12 PM',
                              size: 13,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.40)
                                  : kBlackColor.withOpacity(0.40),
                            ),
                            MyText(
                              text: '',
                              size: 13,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.40)
                                  : kBlackColor.withOpacity(0.40),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        MyButton(
                          radius: 13.0,
                          textSize: 13,
                          buttonText: 'complete_pickup'.tr,
                          textColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
                          onTap: () {},
                        ),
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
                  Assets.imagesDummyPollyLine,
                  height: 202,
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropOff(
                    address: '731 S. High Point Street',
                    time: '4 ${'min'.tr}',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 146,
                        child: MyButton(
                          height: 46,
                          textSize: 17,
                          radius: 8.0,
                          buttonText: 'order_ready'.tr,
                          textColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
                          onTap: () {},
                        ),
                      ),
                    ],
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

class RestaurantDetailDialog extends StatelessWidget {
  const RestaurantDetailDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.7,
            child: Card(
              color: isDark ? kDarkInputBgColor : kPrimaryColor,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: isEnglish
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesX,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'restaurant_details'.tr,
                      size: 23,
                      weight: FontWeight.w700,
                      align: TextAlign.center,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    MyText(
                      text: '302 Manor St. Brooklyn',
                      size: 12,
                      color: kSecondaryColor,
                      align: TextAlign.center,
                      paddingBottom: 8,
                      paddingTop: 8,
                    ),
                    MyText(
                      text: 'Italia Trattoria  -  ${'order'.tr} #701',
                      size: 14,
                      weight: FontWeight.w500,
                      align: TextAlign.center,
                      paddingBottom: 40,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    MyText(
                      text: 'notes_from_the_restaurant'.tr,
                      size: 14,
                      weight: FontWeight.w500,
                      paddingBottom: 13,
                      paddingLeft: 3,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    Container(
                      height: 113,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: isDark ? kDarkPrimaryColor : kSeoulColor1,
                      ),
                      child: MyText(
                        text:
                            'Please don’t enter the resturant, wait next to the entrance door.',
                        size: 14,
                        color: kGreyColor9,
                      ),
                    ),
                    Spacer(),
                    MyButton(
                      radius: 13.0,
                      textSize: 13,
                      buttonText: 'contact_support'.tr,
                      onTap: () {
                        Get.back();
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AddressDetailsDialog();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class AddressDetailsDialog extends StatelessWidget {
  const AddressDetailsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.7,
            child: Card(
              color: isDark ? kDarkInputBgColor : kPrimaryColor,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: isEnglish
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesX,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'address_details'.tr,
                      size: 23,
                      weight: FontWeight.w700,
                      align: TextAlign.center,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    MyText(
                      text: '731 S. High Point Street',
                      size: 14,
                      weight: FontWeight.w700,
                      color: kSecondaryColor,
                      align: TextAlign.center,
                      paddingTop: 8,
                      paddingBottom: 35.0,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: 'private_house'.tr,
                          size: 14,
                          weight: FontWeight.w700,
                          paddingRight: isEnglish ? 10 : 0,
                          paddingLeft: isEnglish ? 0 : 10,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        Image.asset(
                          Assets.imagesCheckRounded,
                          height: 20,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 35,
                      text: 'notes_from_the_restaurant'.tr,
                      size: 14,
                      weight: FontWeight.w500,
                      paddingBottom: 13,
                      paddingLeft: 3,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    Container(
                      height: 113,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: isDark ? kDarkPrimaryColor : kSeoulColor1,
                      ),
                      child: MyText(
                        text:
                            'Please don\'t call, leave the order at the door.',
                        size: 14,
                        color: kGreyColor9,
                      ),
                    ),
                    Spacer(),
                    MyButton(
                      radius: 13.0,
                      textSize: 13,
                      buttonText: 'contact_support'.tr,
                      onTap: () {
                        Get.back();
                        showDialog(
                          context: context,
                          builder: (_) {
                            return CustomerDetailsDialog();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class CustomerDetailsDialog extends StatelessWidget {
  const CustomerDetailsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.7,
            child: Card(
              color: isDark ? kDarkInputBgColor : kPrimaryColor,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: isEnglish
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesX,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'customer_details'.tr,
                      size: 23,
                      weight: FontWeight.w700,
                      align: TextAlign.center,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    MyText(
                      text: 'Alex S.',
                      size: 14,
                      weight: FontWeight.w700,
                      color: kSecondaryColor,
                      align: TextAlign.center,
                      paddingTop: 8,
                      paddingBottom: 35.0,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: 'phone_number'.tr,
                              color: isDark ? kPrimaryColor : kBlackColor,
                            ),
                            MyText(
                              text: '0501234567',
                              color: isDark ? kPrimaryColor : kBlackColor,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: 'order_number'.tr,
                              color: isDark ? kPrimaryColor : kBlackColor,
                            ),
                            MyText(
                              text: '#701',
                              color: isDark ? kPrimaryColor : kBlackColor,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      height: 113,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: isDark ? kDarkPrimaryColor : kSeoulColor1,
                      ),
                      child: MyText(
                        text:
                            'Please don\'t call, leave the order at the door.',
                        size: 14,
                        color: kGreyColor9,
                      ),
                    ),
                    Spacer(),
                    MyButton(
                      radius: 13.0,
                      textSize: 13,
                      buttonText: 'call_customer'.tr,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyButton(
                      radius: 13.0,
                      textSize: 13,
                      buttonText: 'contact_support'.tr,
                      onTap: () {
                        Get.back();
                        showDialog(
                          context: context,
                          builder: (_) {
                            return OnlyOneMinuteLeftDialog();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class OnlyOneMinuteLeftDialog extends StatelessWidget {
  const OnlyOneMinuteLeftDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.7,
            child: Card(
              color: isDark ? kDarkInputBgColor : kPrimaryColor,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: isEnglish
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesX,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.imagesTimer,
                      height: 184,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          letterSpacing: 0.3,
                          fontSize: 17,
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        children: [
                          TextSpan(
                            text: 'there_are'.tr,
                          ),
                          TextSpan(
                            text: ' 1 ${'minute'.tr} ',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'left_to_deliver_the_order'.tr,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          letterSpacing: 0.3,
                          fontSize: 14,
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: isDark
                              ? kPrimaryColor.withOpacity(0.80)
                              : kDarkGreyColor4.withOpacity(0.80),
                        ),
                        children: [
                          TextSpan(
                            text: 'try_to_deliver_the_order_in_time_to_be'.tr,
                          ),
                          TextSpan(
                            text: ' ${'well_rated'.tr} ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '${'by_the_customer'.tr}',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        radius: 13.0,
                        textSize: 13,
                        buttonText: 'understood'.tr,
                        onTap: () {
                          Get.back();
                          showDialog(
                            context: context,
                            builder: (_) {
                              return CongratulationDialog();
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class CongratulationDialog extends StatelessWidget {
  const CongratulationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.7,
            child: Card(
              color: isDark ? kDarkInputBgColor : kPrimaryColor,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: isEnglish
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesX,
                            height: 18,
                            color: isDark ? kPrimaryColor : null,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.imagesCongratsEarning,
                      height: 192,
                    ),
                    MyText(
                      text: 'congratulations'.tr,
                      size: 17,
                      weight: FontWeight.w700,
                      align: TextAlign.center,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          letterSpacing: 0.3,
                          fontSize: 14,
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: isDark
                              ? kPrimaryColor.withOpacity(0.80)
                              : kDarkGreyColor4.withOpacity(0.80),
                        ),
                        children: [
                          TextSpan(
                            text: 'you_ve_completed_your'.tr,
                          ),
                          TextSpan(
                            text: ' 123th ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'course_and_earned'.tr,
                          ),
                          TextSpan(
                            text: ' 11.48€',
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyButton(
                        radius: 13.0,
                        textSize: 13,
                        buttonText: 'continue'.tr,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
