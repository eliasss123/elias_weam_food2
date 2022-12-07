import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/can_you_make_it.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/order_detail_card.dart';
import 'package:flutter/material.dart';

class IncomingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 30),
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                paddingLeft: 30,
                text: 'Incoming Orders',
                size: 17,
                weight: FontWeight.w700,
                paddingBottom: 15,
              ),
              SizedBox(
                height: 103,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return IncomingOrderButton(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return CanYouMakeIt();
                          },
                        );
                      },
                      isSelected: index == 0 ? true : false,
                      cusName: 'Nic L',
                      orderNo: '172',
                      time: '14:30',
                    );
                  },
                ),
              ),
              MyText(
                paddingLeft: 30,
                paddingTop: 40,
                text: 'Order Detail',
                size: 15,
                weight: FontWeight.w700,
                paddingBottom: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    3,
                    (index) {
                      return OrderDetailCard(
                        onTap: () {},
                        orderCount: '${index + 1}',
                        orderedItem: 'Americana Pizza',
                        specialNote:
                            index == 2 ? '' : 'Extra fromage · no butter',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              width: 211,
              child: MyButton(
                textSize: 14,
                radius: 14.0,
                height: 50,
                buttonText: 'Next',
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IncomingOrderButton extends StatelessWidget {
  const IncomingOrderButton({
    Key? key,
    required this.cusName,
    required this.orderNo,
    required this.time,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String cusName, orderNo, time;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 8,
        ),
        height: 103,
        width: 97,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? kSecondaryColor : kPrimaryColor,
          border: Border.all(
            width: 1.0,
            color: isSelected ? kSecondaryColor : kBorderColor6,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyText(
              text: cusName,
              size: 14,
              weight: FontWeight.w500,
              color: isSelected ? kPrimaryColor : kDarkGreyColor4,
              maxLines: 1,
              overFlow: TextOverflow.ellipsis,
            ),
            MyText(
              text: '#$orderNo',
              size: 15,
              weight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? kPrimaryColor : kSecondaryColor,
            ),
            MyText(
              text: time,
              size: 13,
              color: isSelected ? kPrimaryColor : kLightGreyColor3,
            ),
          ],
        ),
      ),
    );
  }
}
