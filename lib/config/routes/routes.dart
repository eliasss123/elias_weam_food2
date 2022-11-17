import 'package:elias_weam_food2/view/screens/auth/login.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/create_new_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/forgot_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_phone.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verification_code_for_phone.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verify_code_for_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/create_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/signup_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/your_name.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/name.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/sign_up.dart';
import 'package:elias_weam_food2/view/screens/launch/on_boarding.dart';
import 'package:elias_weam_food2/view/screens/launch/splash_screen.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
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
      name: AppLinks.login,
      page: () => Login(),
    ),

    GetPage(
      name: AppLinks.verifyOtp,
      page: () => VerifyOtp(),
    ),
    GetPage(
      name: AppLinks.name,
      page: () => Name(),
    ),
    GetPage(
      name: AppLinks.yourName,
      page: () => YourName(),
    ),
    GetPage(
      name: AppLinks.signupWithEmail,
      page: () => SignupWithEmail(),
    ),
    GetPage(
      name: AppLinks.createPass,
      page: () => CreatePass(),
    ),
    GetPage(
      name: AppLinks.createNewPass,
      page: () => CreateNewPass(),
    ),
    GetPage(
      name: AppLinks.forgotPass,
      page: () => ForgotPass(),
    ),
    GetPage(
      name: AppLinks.resetWithEmail,
      page: () => ResetWithEmail(),
    ),
    GetPage(
      name: AppLinks.resetWithPhone,
      page: () => ResetWithPhone(),
    ),
    GetPage(
      name: AppLinks.verifyCodeForEmail,
      page: () => VerifyCodeForEmail(),
    ),
    GetPage(
      name: AppLinks.verifyCodeForPhone,
      page: () => VerifyCodeForPhone(),
    ),

    //  MAIN APP
    GetPage(
      name: AppLinks.bottomNavBar,
      page: () => BottomNavBar(),
    ),
    GetPage(
      name: AppLinks.home,
      page: () => Home(),
    ),
    //  MAIN APP
  ];
}

class AppLinks {
  static const splashScreen = '/splash_screen';
  static const onBoarding = '/on_boarding';
  static const signup = '/signup';
  static const login = '/login';

  static const verifyOtp = '/verify_otp';
  static const name = '/name';
  static const yourName = '/your_name';
  static const signupWithEmail = '/signup_with_email';
  static const createPass = '/create_pass';
  static const createNewPass = '/create_new_pass';
  static const forgotPass = '/forgot_pass';
  static const resetWithEmail = '/reset_with_email';
  static const resetWithPhone = '/reset_with_phone';
  static const verifyCodeForEmail = '/verify_code_for_email';
  static const verifyCodeForPhone = '/verification_code_for_phone';

//  MAIN APP
  static const bottomNavBar = '/bottom_nav_bar';
  static const home = '/home';
//  MAIN APP

}
