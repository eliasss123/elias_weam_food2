import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/order_detail_card.dart';
import 'package:flutter/material.dart';

class ReadyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 30),
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          paddingLeft: 30,
          text: 'Orders Ready',
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
              return ReadyOrderButton(
                onTap: () {},
                isSelected: index == 0 ? true : false,
                cusName: 'Nic L',
                orderNo: '172',
                pickupIn: '2',
              );
            },
          ),
        ),
        MyText(
          paddingLeft: 30,
          paddingTop: 40,
          text: 'Order Status',
          size: 15,
          weight: FontWeight.w700,
          paddingBottom: 15,
        ),
        Column(
          children: List.generate(
            2,
            (index) {
              return OrderStatusCard(
                isCompleted: index == 0 ? true : false,
                statusMsg:
                    index == 0 ? 'Completed 2 min ago' : 'Pickup in 1 min',
                time: '13:00',
              );
            },
          ),
        ),
        MyText(
          paddingLeft: 30,
          paddingTop: 25,
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
                  specialNote: index == 2 ? '' : 'Extra fromage · no butter',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    Key? key,
    required this.statusMsg,
    required this.time,
    required this.isCompleted,
  }) : super(key: key);

  final String statusMsg, time;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
        left: 30,
        right: 30,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kSeoulColor6,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            isCompleted
                ? Image.asset(
                    Assets.imagesOrderCompleted,
                    height: 37,
                  )
                : Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.imagesCar,
                        height: 18,
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
                    text: statusMsg,
                    size: 14,
                    weight: FontWeight.w500,
                    color: kBlackColor.withOpacity(0.70),
                  ),
                  MyText(
                    paddingTop: 6,
                    text: time,
                    size: 13,
                    color: kBlackColor.withOpacity(0.50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadyOrderButton extends StatelessWidget {
  const ReadyOrderButton({
    Key? key,
    required this.cusName,
    required this.orderNo,
    required this.pickupIn,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String cusName, orderNo, pickupIn;
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
        width: 112,
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
              text: 'pickup in $pickupIn\m',
              size: 13,
              color: isSelected ? kPrimaryColor : kLightGreyColor3,
            ),
          ],
        ),
      ),
    );
  }
}
