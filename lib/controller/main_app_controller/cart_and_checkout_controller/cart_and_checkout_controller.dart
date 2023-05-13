import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/confirm_order.dart';
import 'package:elias_weam_food2/view/screens/main_app/order_status/pick_up_order_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCheckOutController extends GetxController {
  static final CartCheckOutController instance =
      Get.find<CartCheckOutController>();

  RxBool isOrderConfirm = false.obs;
  RxBool isEmptyCart = true.obs;
  RxBool isPickUp = false.obs;
  RxMap<String, int> quantities = <String, int>{}.obs;
  void confirmOrder(
    BuildContext context,
    bool isPickup,
  ) {
    isOrderConfirm.value = true;
    isPickup
        ? showDialog(
            context: context,
            builder: (_) {
              return PickupOrderCompletedDialog();
            },
          )
        : showDialog(
            context: context,
            builder: (_) {
              return OrderCompletedDialog();
            },
          );
  }

  void showCartItems() {
    isEmptyCart.value = false;
  }

  void changeDeliveryOption(bool value) {
    isPickUp.value = value;
    Get.back();
  }
}
