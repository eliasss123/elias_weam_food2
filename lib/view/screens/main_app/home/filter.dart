import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/constant/sizes_constant.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<Map<String, dynamic>> sortList = [
    {
      'icon': Assets.imagesChecked,
      'title': 'Picked for you',
    },
    {
      'icon': Assets.imagesFire,
      'title': 'Most popular',
    },
    {
      'icon': Assets.imagesStarGreen,
      'title': 'Rating',
    },
    {
      'icon': Assets.imagesTime,
      'title': 'Delivery time',
    },
  ];

  List<String> maxDeliveryFee = [
    '5',
    '10',
    '15',
    '+20',
  ];

  int currentSortIndex = 0;
  int maxFeeIndex = 0;
  int priceRangeIndex = 0;
  bool isDealsOn = false;
  bool isTheBestOn = false;
  bool showClearAll = false;

  void reset() {
    setState(() {
      currentSortIndex = 0;
      maxFeeIndex = 0;
      priceRangeIndex = 0;
      isDealsOn = false;
      isTheBestOn = false;
      showClearAll = false;
    });
  }

  List<String> sortListTr = [
    'picked_for_you',
    'most_popular',
    'rating',
    'delivery_time',
  ];

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
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
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                ),
              ),
            ],
          ),
          title: MyText(
            text: 'sort_and_filter'.tr,
            size: 21,
            weight: FontWeight.w500,
            color: isDark ? kPrimaryColor : kBlackColor2,
          ),
          actions: [
            showClearAll
                ? Center(
                    child: MyText(
                      onTap: () => reset(),
                      paddingRight: 15,
                      paddingLeft: isEnglish ? 0 : 15,
                      text: 'clear_all'.tr,
                      size: 12,
                      weight: FontWeight.w500,
                      color: kSecondaryColor,
                    ),
                  )
                : SizedBox(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                physics: BouncingScrollPhysics(),
                children: [
                  filterHeading('sort'.tr),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                      sortList.length,
                      (index) {
                        var data = sortList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: FilterTiles(
                            icon: data['icon'],
                            title: sortListTr[index].tr,
                            onTap: () {
                              setState(() {
                                currentSortIndex = index;
                                showClearAll = true;
                              });
                            },
                            isSelected: currentSortIndex == index,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  filterHeading('from_vai'.tr),
                  SizedBox(
                    height: 20,
                  ),
                  FilterTiles(
                    icon: Assets.imagesDeal,
                    title: 'deals'.tr,
                    iconSize: 32,
                    onTap: () {},
                    isSelected: false,
                    haveCustomTrailing: true,
                    customTrailing: SizedBox(
                      width: 37.89,
                      height: 22,
                      child: FlutterSwitch(
                        value: isDealsOn,
                        onToggle: (value) {
                          setState(() {
                            isDealsOn = !isDealsOn;
                            showClearAll = true;
                          });
                        },
                        activeColor: kSecondaryColor,
                        inactiveColor: kInActiveSwitchColor,
                        borderRadius: 50.0,
                        toggleSize: 19.0,
                        padding: 1.2,
                        showOnOff: false,
                        toggleColor: kPrimaryColor,
                        inactiveToggleColor: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FilterTiles(
                    icon: Assets.imagesPrize,
                    title: 'the_best'.tr,
                    onTap: () {},
                    isSelected: false,
                    haveCustomTrailing: true,
                    customTrailing: SizedBox(
                      width: 37.89,
                      height: 22,
                      child: FlutterSwitch(
                        value: isTheBestOn,
                        onToggle: (value) {
                          setState(() {
                            isTheBestOn = !isTheBestOn;
                            showClearAll = true;
                          });
                        },
                        activeColor: kSecondaryColor,
                        inactiveColor: kInActiveSwitchColor,
                        borderRadius: 50.0,
                        toggleSize: 19.0,
                        padding: 1.2,
                        showOnOff: false,
                        toggleColor: kPrimaryColor,
                        inactiveToggleColor: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  filterHeading('max_delivery_fee'.tr),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 15,
                    children: List.generate(
                      maxDeliveryFee.length,
                      (index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            maxFeeIndex = index;
                            showClearAll = true;
                          }),
                          child: Container(
                            height: 46,
                            width: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: maxFeeIndex == index
                                    ? kSecondaryColor
                                    : isDark
                                        ? kPrimaryColor.withOpacity(0.45)
                                        : kBlackColor.withOpacity(0.35),
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                text: '${maxDeliveryFee[index]}₪',
                                size: 18,
                                color: maxFeeIndex == index
                                    ? kSecondaryColor
                                    : isDark
                                        ? kPrimaryColor.withOpacity(0.45)
                                        : kBlackColor.withOpacity(0.40),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  filterHeading('price_range'.tr),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 15,
                    children: List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            priceRangeIndex = index;
                            showClearAll = true;
                          }),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: priceRangeIndex == index
                                    ? kSecondaryColor
                                    : isDark
                                        ? kPrimaryColor.withOpacity(0.45)
                                        : kBlackColor.withOpacity(0.35),
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                text: index == 0
                                    ? '₪'
                                    : index == 1
                                        ? '₪₪'
                                        : '₪₪₪',
                                size: 16,
                                color: priceRangeIndex == index
                                    ? kSecondaryColor
                                    : isDark
                                        ? kPrimaryColor.withOpacity(0.45)
                                        : kBlackColor.withOpacity(0.40),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                platform == TargetPlatform.iOS ? IOS_BUTTON_PADDING : 20.0,
              ),
             child: MyButton(
                 height: 52,
                buttonText: 'apply'.tr,
                onTap: () {},
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget filterHeading(String heading) {
    return Obx(() {
      return MyText(
        text: heading,
        size: 22,
        weight: FontWeight.w500,
        color: themeController.isDarkTheme.value ? kPrimaryColor : kBlackColor2,
      );
    });
  }
}

// ignore: must_be_immutable
class FilterTiles extends StatelessWidget {
  FilterTiles({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.haveCustomTrailing = false,
    this.customTrailing,
    this.iconSize,
  }) : super(key: key);
  final String icon, title;

  bool? isSelected, haveCustomTrailing;
  final VoidCallback onTap;
  Widget? customTrailing;
  double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              icon,
              height: iconSize ?? 24,
              width: 24,
            ),
            Expanded(
              child: Obx(() {
                return MyText(
                  paddingLeft: 10,
                  paddingRight: isEnglish ? 0 : 10,
                  text: title,
                  color: themeController.isDarkTheme.value
                      ? kPrimaryColor
                      : kBlackColor2,
                );
              }),
            ),
            haveCustomTrailing!
                ? customTrailing!
                : isSelected!
                    ? Image.asset(
                        Assets.imagesCheckGreen,
                        height: 12.2,
                      )
                    : SizedBox(),
          ],
        ),
      );
    });
  }
}
