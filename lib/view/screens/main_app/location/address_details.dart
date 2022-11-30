import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/save_address.dart';
import 'package:elias_weam_food2/view/widget/address_toggle_buttons.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/save_address_as.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressDetails extends StatelessWidget {
  AddressDetails({
    Key? key,
  }) : super(key: key);

  final List<String> addressOp = [
    'Home',
    'Work',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: 'Address’s Details',
            size: 18,
            weight: FontWeight.w500,
            paddingBottom: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonImageView(
                    height: 65,
                    width: 65,
                    radius: 8.0,
                    url: dummyImg1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'John’s apartment',
                          size: 16,
                          weight: FontWeight.w700,
                          paddingBottom: 7,
                        ),
                        MyText(
                          text: '27H8+RC Mi’ilya, bornad street, Israel',
                          size: 14,
                          weight: FontWeight.w500,
                          color: kGreyColor5,
                          paddingBottom: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: kBorderColor3,
              ),
            ],
          ),
          SaveAddressAs(addressOp: addressOp),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: MyButton(
              buttonText: 'Continue',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  builder: (_) {
                    return SaveAddress();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


