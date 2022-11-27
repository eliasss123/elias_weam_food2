import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/model/recent_order_model/recent_order_model.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/recent_orders/order_details.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Orders',
        titleWeight: FontWeight.w700,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        children: [
          MyText(
            text: 'Last 7 days',
            size: 18,
            weight: FontWeight.w500,
            paddingBottom: 15,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return RecentOrderTiles(
                imgUrl: dummyImg3,
                title: 'Papa Pizza',
                totalItems: '1',
                isDelivered: index == 0 ? true : false,
              );
            },
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RecentOrderTiles extends StatelessWidget {
  RecentOrderTiles({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.totalItems,
    this.isDelivered = false,
  }) : super(key: key);

  final String imgUrl, title, totalItems;
  bool? isDelivered;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 13,
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: 79,
      decoration: BoxDecoration(
        border: Border.all(
          color: kGreyColor10,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          CommonImageView(
            height: 56,
            width: 56,
            radius: 13.0,
            url: imgUrl,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  text: title,
                  size: 15,
                  weight: FontWeight.w500,
                  paddingBottom: 8,
                ),
                Row(
                  children: [
                    MyText(
                      text: isDelivered! ? 'Delivered' : 'Picked up',
                      size: 14,
                      color: kSecondaryColor,
                      weight: FontWeight.w500,
                    ),
                    MyText(
                      text: '•',
                      color: kGreyColor11,
                      paddingLeft: 8,
                      paddingRight: 8,
                    ),
                    MyText(
                      text: '$totalItems items',
                      size: 14,
                      color: kGreyColor5,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                elevation: 0,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return SimpleBottomSheet(
                    height: 210,
                    content: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return OrderDetails(
                                    orderNo: '701',
                                    restaurantName: 'Pie pizza restaurant',
                                    subTotal: '87.10',
                                    items: [
                                      OrderDetailsModel(
                                        itemQuantity: '1',
                                        itemName: 'Squid Sweet and Sour Salad',
                                        itemPrice: '19.99',
                                        subItems: [],
                                      ),
                                      OrderDetailsModel(
                                        itemQuantity: '1',
                                        itemName: 'Japan Hainanese Sashimi',
                                        itemPrice: '37.99',
                                        subItems: [
                                          OrderDetailsSubItemsModel(
                                            itemName: 'Teriyaki Sause',
                                            itemPrice: '0',
                                          ),
                                          OrderDetailsSubItemsModel(
                                            itemName: 'Omelet',
                                            itemPrice: '2',
                                          ),
                                        ],
                                      ),
                                      OrderDetailsModel(
                                        itemQuantity: '1',
                                        itemName: 'Black Pepper Beef Lumpia',
                                        itemPrice: '27.12',
                                        subItems: [],
                                      ),
                                    ],
                                    deliveryFee: '1.5',
                                    total: '88.6',
                                    orderDate: '28/10/2021',
                                    orderDeliveryTime: '16:55',
                                  );
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: kSeoulColor4,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: MyText(
                                  text: 'Order details',
                                  size: 16,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: kSeoulColor4,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: MyText(
                                text: 'Make same order',
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Image.asset(
              Assets.imagesIconsMoreVert,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}