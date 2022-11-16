import 'package:elias_weam_food2/view/widget/congrats.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Name extends StatefulWidget {
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  bool isActive = false;
  TextEditingController fNameCon = TextEditingController();
  TextEditingController lNameCon = TextEditingController();

  void onChanged() {
    if (fNameCon.text.isNotEmpty && lNameCon.text.isNotEmpty) {
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
          authHeading('Enter your name'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SimpleTextField(
                  controller: fNameCon,
                  onChanged: (value) => onChanged(),
                  hintText: 'First name',
                ),
                SimpleTextField(
                  controller: lNameCon,
                  onChanged: (value) => onChanged(),
                  hintText: 'Last Name',
                  marginBottom: 45,
                ),
                MyButton(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
