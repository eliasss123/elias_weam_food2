import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/sign_up.dart';
import 'package:elias_weam_food2/view/screens/launch/on_boarding.dart';
import 'package:elias_weam_food2/view/screens/launch/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppLinks.onBoarding,
      page: () => OnBoarding(),
    ),
    GetPage(
      name: AppLinks.signup,
      page: () => Signup(),
    ),
    GetPage(
      name: AppLinks.verifyOtp,
      page: () => VerifyOtp(),
    ),
  ];
}

class AppLinks {
  static const splashScreen = '/splash_screen';
  static const onBoarding = '/on_boarding';
  static const signup = '/signup';
  static const verifyOtp = '/verify_otp';
}
