import 'dart:developer';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final HomeController instance = Get.find<HomeController>();

  RxInt currentInstantFilterIndex = 0.obs;
  RxInt popularIndex = 0.obs;
  RxInt homeDetailMenuIndex = 0.obs;
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
  final List<String> popularList = [
    'All',
    'Italian',
    'Vegetarian',
    'Healthy Food',
  ];

  final List<String> homeDetailMenu = [
    'Popular Items',
    'Pizza & Pasta',
    'Salads',
    'Drinks',
    'Add and Save',
  ];


  void getSelectedInstantFilerIndex(int index, String selectedValue) {
    currentInstantFilterIndex.value = index;
    log(selectedValue.toString());
  }

  void getPopularIndex(int index, String selectedValue) {
    popularIndex.value = index;
    log(selectedValue.toString());
  }

  void getHomeDetailMenuIndex(int index, String selectedValue) {
    homeDetailMenuIndex.value = index;
    log(selectedValue.toString());
  }
}
