import 'package:get/get.dart';

class CartCheckOutController extends GetxController {
  static final CartCheckOutController instance =
      Get.find<CartCheckOutController>();

  RxBool isEmptyCart = true.obs;
  RxBool isPickUp = false.obs;

  void showCartItems() {
    isEmptyCart.value = false;
  }

  void changeDeliveryOption(bool value) {
    isPickUp.value = value;
  }
}
