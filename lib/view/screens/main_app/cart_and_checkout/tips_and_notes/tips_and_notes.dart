import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/tips_and_notes/custom_amount.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipsAndNotes extends StatefulWidget {
  @override
  State<TipsAndNotes> createState() => _TipsAndNotesState();
}

class _TipsAndNotesState extends State<TipsAndNotes> {
  int priceRangeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: kBlackColor2,
              size: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              text: 'Tips and Notes',
              size: 24,
              weight: FontWeight.w700,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  MyText(
                    paddingTop: 60,
                    align: TextAlign.center,
                    text: 'Add Notes',
                    color: kBlackColor4,
                    size: 15,
                    weight: FontWeight.w500,
                    paddingBottom: 10,
                  ),
                  TextFormField(
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 14,
                      color: kBlackColor2,
                    ),
                    decoration: InputDecoration(
                      fillColor: kSeoulColor1,
                      filled: true,
                      counterText: '',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 21,
                        vertical: 16.5,
                      ),
                      hintText: 'Type here',
                      hintStyle: TextStyle(
                        fontSize: 13.5,
                        color: kGreyColor8,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  MyText(
                    paddingTop: 38,
                    weight: FontWeight.w500,
                    size: 18,
                    text: 'Courier tip',
                    color: kBlackColor4,
                    paddingBottom: 35,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 15,
                    children: List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            priceRangeIndex = index;
                          }),
                          child: Container(
                            height: 49,
                            width: 49,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: priceRangeIndex == index
                                    ? kSecondaryColor
                                    : Color(0xff8392A5),
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                text: index == 0
                                    ? '\$5'
                                    : index == 1
                                        ? '\$10'
                                        : '\$15',
                                size: 16,
                                color: priceRangeIndex == index
                                    ? kSecondaryColor
                                    : Color(0xff8392A5),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MyText(
                    onTap: () => Get.to(
                      () => CustomAmount(),
                    ),
                    paddingTop: 25,
                    weight: FontWeight.w500,
                    size: 13.33,
                    text: 'Custom amount',
                    color: kSecondaryColor,
                    align: TextAlign.center,
                    decoration: TextDecoration.underline,
                    paddingBottom: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kSeoulColor3,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesMasterCard,
                          height: 24,
                        ),
                        Expanded(
                          child: MyText(
                            text: '****386 4342',
                            size: 13.33,
                            weight: FontWeight.w500,
                            color: kBlackColor4,
                          ),
                        ),
                        MyText(
                          text: 'Change',
                          size: 13.33,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: MyButton(
                buttonText: 'Done',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
