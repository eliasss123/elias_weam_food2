import 'package:elias_weam_food2/view/widget/address_toggle_buttons.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class SaveAddressAs extends StatelessWidget {
  const SaveAddressAs({
    Key? key,
    required this.addressOp,
  }) : super(key: key);

  final List<String> addressOp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          text: 'Save Address As',
          size: 15,
          weight: FontWeight.w700,
          paddingBottom: 15,
        ),
        Wrap(
          spacing: 10.0,
          children: List.generate(
            addressOp.length,
                (index) {
              return AddressToggleButton(
                onTap: () {},
                text: addressOp[index],
                isSelected: index == 0 ? true : false,
              );
            },
          ),
        ),
      ],
    );
  }
}