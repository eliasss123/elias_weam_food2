import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/profile_filled_text_field.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: ContainerDec.profileBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            simpleAppBar(
              bgColor: Colors.transparent,
              title: 'My Account',
              titleWeight: FontWeight.w700,
            ),
            Center(
              child: CommonImageView(
                height: 100,
                width: 100,
                url: dummyImg1,
                radius: 100.0,
              ),
            ),
            MyText(
              paddingTop: 3,
              text: 'Change Picture',
              size: 16,
              weight: FontWeight.w700,
              align: TextAlign.center,
              paddingBottom: 50,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 30),
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  ProfileFilledTextField(
                    labelText: 'Name',
                    hintText: 'Test',
                  ),
                  ProfileFilledTextField(
                    labelText: 'Email',
                    hintText: '',
                  ),
                  ProfileFilledTextField(
                    labelText: 'Phone Number',
                    havePrefix: true,
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesPhone,
                          height: 17,
                        ),
                      ],
                    ),
                    hintText: '',
                  ),
                  ProfileFilledTextField(
                    isObSecure: true,
                    labelText: 'Password',
                    hintText: '',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 15,
              ),
              child: MyButton(
                buttonText: 'Save Changes',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Material profileTiles({
    String? icon,
    String? title,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: [
              Image.asset(
                icon!,
                height: 40,
              ),
              Expanded(
                child: MyText(
                  paddingLeft: 15,
                  text: title,
                  size: 16,
                  weight: FontWeight.w500,
                ),
              ),
              Image.asset(
                Assets.imagesArrowRight,
                height: 24,
                color: kGreyColor12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
