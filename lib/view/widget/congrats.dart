import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class Congrats extends StatelessWidget {
  Congrats({
    required this.heading,
    required this.congratsMsg,
    required this.onContinue,
    this.buttonText,
  });

  String? heading,congratsMsg,buttonText;
  VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesCongrats,
              height: 181,
            ),
            MyText(
              paddingTop: 45,
              text: heading,
              size: 24,
              weight: FontWeight.w700,
              align: TextAlign.center,
            ),
            MyText(
              paddingTop: 10,
              paddingBottom: 40,
              text: congratsMsg,
              size: 16,
              color: kTertiaryColor,
              weight: FontWeight.w400,
              align: TextAlign.center,
            ),
            MyButton(
              onTap: onContinue,
              buttonText: buttonText ?? 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
