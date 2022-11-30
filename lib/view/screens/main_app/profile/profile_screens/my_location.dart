import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/pin_location.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'My Location',
        titleWeight: FontWeight.w700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Image.asset(
                  Assets.imagesLocationEmptyState,
                  height: 200,
                ),
              ),
              MyText(
                paddingTop: 40,
                text: 'Set your address to start exploring.',
                size: 14,
                weight: FontWeight.w500,
                color: kGreyColor12,
                align: TextAlign.center,
                paddingBottom: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MyButton(
                  buttonText: 'Set Your Address',
                  onTap: () => Get.to(
                    () => PinLocation(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
