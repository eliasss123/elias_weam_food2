import 'dart:developer';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final HomeController instance = Get.find<HomeController>();

  RxInt currentInstantFilterIndex = 0.obs;
  final List<Map<String, dynamic>> instantFilterList = [
    {
      'img': Assets.imagesAllPlaces,
      'title': 'All\nPlaces',
    },
    {
      'img': Assets.imagesGrocery,
      'title': 'Grocery\nShop',
    },
    {
      'img': Assets.imagesFastFood,
      'title': 'Fast\nFood',
    },
  ];

  void getSelectedInstantFilerIndex(int index, String instantFilter) {
    currentInstantFilterIndex.value = index;
    log(instantFilter.toString());
  }
}
