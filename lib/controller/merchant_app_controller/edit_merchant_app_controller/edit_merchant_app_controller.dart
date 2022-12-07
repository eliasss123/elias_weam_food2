import 'package:elias_weam_food2/generated/assets.dart';
import 'package:get/get.dart';

class EditMerchantAppController extends GetxController {
  static final EditMerchantAppController instance =
      Get.find<EditMerchantAppController>();

  RxBool isEditMode = false.obs;
  RxInt menuItemsIndex = 0.obs;

  final List<String> menuItems = [
    'Popular Items',
    'Pizza & Pasta',
    'Salads',
    'Drinks',
    'Add and Save',
  ];

  void getMenuItemIndex(int index, String selectedValue) {
    menuItemsIndex.value = index;
  }

  void activateEditMode() {
    isEditMode.value = !isEditMode.value;
  }
}
