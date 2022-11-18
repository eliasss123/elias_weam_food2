import 'dart:developer';

import 'package:get/get.dart';

class BrowseController extends GetxController {
  static final BrowseController instance = Get.find<BrowseController>();

  RxInt currentCategoryIndex = 0.obs;
  final List<String> categories = [
    'All categories',
    'Top categories',
    'Popular now',
  ];

  void getSelectedCategoryIndex(int index, String selectedValue) {
    currentCategoryIndex.value = index;
    log(selectedValue.toString());
  }
}
