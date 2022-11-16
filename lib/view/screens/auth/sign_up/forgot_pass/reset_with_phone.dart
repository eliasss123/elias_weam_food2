import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verification_code_for_phone.dart';
import 'package:elias_weam_food2/view/widget/FilledTextField.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetWithPhone extends StatefulWidget {
  @override
  State<ResetWithPhone> createState() => _ResetWithPhoneState();
}

class _ResetWithPhoneState extends State<ResetWithPhone> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [
          authHeading('Reset Password'),
          SizedBox(
            height: 8,
          ),
          authSubHeading(
              'Please enter your phone number, we will send a verification code to your phone number.'),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledTextField(
                  havePrefix: true,
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesPhone,
                        height: 17.08,
                      ),
                    ],
                  ),
                  labelText: 'Phone Number',
                  hintText: '(+1) 234 567 890',
                  onChanged: (value) {
                    setState(() {
                      value.isNotEmpty ? isActive = true : isActive = false;
                    });
                  },
                  marginBottom: 25.0,
                ),
                MyButton(
                  isActive: isActive,
                  buttonText: 'Continue',
                  onTap: () => Get.to(() => VerifyCodeForPhone()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
