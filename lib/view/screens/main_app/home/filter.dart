import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(
                Assets.imagesArrowBack,
                height: 24,
              ),
            ),
          ],
        ),
        title: MyText(
          text: 'Sort and Filter',
          size: 21,
          weight: FontWeight.w500,
        ),
        actions: [
          showClearAll
              ? Center(
                  child: MyText(
                    onTap: () => reset(),
                    paddingRight: 15,
                    text: 'Clear All',
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
                filterHeading('Sort'),
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
                          title: data['title'],
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
                filterHeading('From vai '),
                SizedBox(
                  height: 20,
                ),
                FilterTiles(
                  icon: Assets.imagesDeal,
                  title: 'Deals',
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
                  title: 'The best ',
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
                filterHeading('Max Delivery Fee'),
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
                                  : kBlackColor.withOpacity(0.35),
                            ),
                          ),
                          child: Center(
                            child: MyText(
                              text: '${maxDeliveryFee[index]}₪',
                              size: 18,
                              color: maxFeeIndex == index
                                  ? kSecondaryColor
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
                filterHeading('Price range'),
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
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
              height: 52,
              buttonText: 'Apply',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  MyText filterHeading(String heading) {
    return MyText(
      text: heading,
      size: 22,
      weight: FontWeight.w500,
    );
  }
}

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
            child: MyText(
              paddingLeft: 10,
              text: title,
            ),
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
  }
}
