import 'dart:convert';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:elias_weam_food2/config/routes/routes.dart';
import 'package:elias_weam_food2/config/theme/dark_theme.dart';
import 'package:elias_weam_food2/config/theme/light_theme.dart';
import 'package:elias_weam_food2/config/theme/theme_controller.dart';
import 'package:elias_weam_food2/controller/language_controller/language_controller.dart';
import 'package:elias_weam_food2/controller/main_app_controller/browse_controller/browse_controller.dart';
import 'package:elias_weam_food2/controller/main_app_controller/cart_and_checkout_controller/cart_and_checkout_controller.dart';
import 'package:elias_weam_food2/controller/main_app_controller/home_controller/home_controller.dart';
import 'package:elias_weam_food2/controller/merchant_app_controller/edit_merchant_app_controller/edit_merchant_app_controller.dart';
import 'package:elias_weam_food2/controller/merchant_app_controller/merchant_home_controller/merchant_home_controller.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/restaurant_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'api/ClientSession.dart';
import 'view/screens/launch/main_app/choose_language.dart';


void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LanguageController());
  Get.put(ThemeController());
  Get.put(HomeController());
  Get.put(BrowseController());
  Get.put(CartCheckOutController());
  Get.put(MerchantHomeController());
  Get.put(EditMerchantAppController());
  await UserSimplePreferences.init();
  runApp(
    ChangeNotifierProvider<ClientSession>(
      create: (_) => ClientSession(),
      child: MyApp(),
    ),
  );
}

//DO NOT REMOVE Unless you find their usage.
String dummyImg =
    'https://www.amateurphotographer.co.uk/wp-content/uploads/2020/10/Rossella_Vanon-SHOT-5-820x547.jpg';
String dummyImg1 =
    'https://images.unsplash.com/photo-1530785602389-07594beb8b73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';
String dummyImg2 =
    'https://images.unsplash.com/photo-1535579710123-3c0f261c474e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';
String dummyImg3 =
    'https://images.unsplash.com/photo-1629747490241-624f07d70e1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80';
String dummyImg4 =
    'https://images.unsplash.com/photo-1558507652-2d9626c4e67a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }



}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      locale: Localization.currentLocale,
      translations: Localization(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Elias Weam Food 2',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppLinks.login,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fade,
    );
  }
}
