import 'package:elias_weam_food2/view/widget/congrats.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/password_field.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePass extends StatefulWidget {
  @override
  State<CreatePass> createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  bool isActive = false;
  TextEditingController passCon = TextEditingController();
  TextEditingController cPassCon = TextEditingController();

  void onChanged() {
    if (passCon.text == cPassCon.text) {
      setState(() {
        isActive = true;
      });
    } else {
      setState(() {
        isActive = false;
      });
    }
  }

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
          authHeading('Create password'),
          SizedBox(
            height: 8,
          ),
          authSubHeading('Your password must be at least 8 characters , and contains at least one letter and one digit.',),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PasswordField(
                  labelText: 'Enter password',
                  hintText: 'Password',
                  controller: passCon,
                  onChanged: (value) => onChanged(),
                  marginBottom: 18,
                ),
                PasswordField(
                  labelText: 'Confirm password',
                  hintText: 'Password',
                  controller: cPassCon,
                  onChanged: (value) => onChanged(),
                  marginBottom: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MyButton(
                    isActive: isActive,
                    buttonText: 'Next',
                    onTap: () => Get.to(
                          () => Congrats(
                        heading: 'Congratulations!',
                        congratsMsg:
                        'Your account is complete, please enjoy the best menu from us.',
                        onContinue: () {},
                        buttonText: 'Done',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

