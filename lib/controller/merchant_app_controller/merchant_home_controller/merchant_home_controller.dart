import 'package:elias_weam_food2/view/screens/merchant_app/merchant_home/m_home_tabs/incoming_orders.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_home/m_home_tabs/out_going_orders.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_home/m_home_tabs/ready_orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MerchantHomeController extends GetxController {
  static final MerchantHomeController instance =
      Get.find<MerchantHomeController>();
  RxInt currentTab = 0.obs;

  final List<String> tabs = [
    'Incoming · 3',
    'Outgoing · 0',
    'Ready · 0',
  ];
  final List<Widget> tabsData = [
    IncomingOrders(),
    OutGoingOrders(),
    ReadyOrders(),
  ];

  selectTab(int index) {
    currentTab.value = index;
  }
}
