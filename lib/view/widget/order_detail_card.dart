import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderDetailCard extends StatelessWidget {
  OrderDetailCard({
    Key? key,
    required this.orderCount,
    required this.orderedItem,
    this.specialNote,
    required this.onTap,
  }) : super(key: key);

  final String orderCount, orderedItem;
  String? specialNote;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: specialNote!.isEmpty ? 13 : 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kSeoulColor6,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: MyText(
                    text: orderCount,
                    size: 14,
                    weight: FontWeight.w700,
                    color: kSecondaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: orderedItem,
                      size: 14,
                      weight: FontWeight.w500,
                      color: kBlackColor.withOpacity(0.70),
                    ),
                    specialNote!.isEmpty
                        ? SizedBox()
                        : MyText(
                            paddingTop: 6,
                            text: specialNote,
                            size: 13,
                            color: kBlackColor.withOpacity(0.50),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
