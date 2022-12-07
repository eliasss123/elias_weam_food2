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
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_get_started.dart';
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_splash_screen.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/on_boarding.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_get_started.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_splash_screen.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/splash_screen.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/screens/main_app/browse/browse.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/delivery_options/delivery_options.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/confirm_order.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/my_cart.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/edit_payment_method_details.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/payment_methods.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/selected_payment_method_details.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/recent_orders/recent_orders.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/tips_and_notes/custom_amount.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/tips_and_notes/tips_and_notes.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/notifications.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/promotions.dart';
import 'package:elias_weam_food2/view/screens/main_app/order_status/delivery_order_status.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
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
    GetPage(
      name: AppLinks.browse,
      page: () => Browse(),
    ),
    GetPage(
      name: AppLinks.myCart,
      page: () => MyCart(),
    ),
    GetPage(
      name: AppLinks.confirmOrder,
      page: () => ConfirmOrder(
        isPickUp: false,
      ),
    ),
    GetPage(
      name: AppLinks.customAmount,
      page: () => CustomAmount(),
    ),
    GetPage(
      name: AppLinks.tipsAndNotes,
      page: () => TipsAndNotes(),
    ),
    GetPage(
      name: AppLinks.deliveryOptions,
      page: () => DeliveryOptions(),
    ),
    GetPage(
      name: AppLinks.paymentMethods,
      page: () => PaymentMethods(),
    ),
    GetPage(
      name: AppLinks.editPaymentMethodDetails,
      page: () => EditPaymentMethodDetails(),
    ),
    GetPage(
      name: AppLinks.selectedPaymentMethodDetails,
      page: () => SelectedPaymentMethodDetails(),
    ),
    GetPage(
      name: AppLinks.recentOrders,
      page: () => RecentOrders(),
    ),
    GetPage(
      name: AppLinks.notifications,
      page: () => Notifications(),
    ),
    GetPage(
      name: AppLinks.promotions,
      page: () => Promotions(),
    ),
    GetPage(
      name: AppLinks.deliveryOrderStatus,
      page: () => TrackOrder(),
    ),
    GetPage(
      name: AppLinks.pickUpOrderStatus,
      page: () => Profile(),
    ),
    GetPage(
      name: AppLinks.support,
      page: () => Support(),
    ),
    //  MAIN APP

    //  Merchant APP
    GetPage(
      name: AppLinks.merchant_splash_screen,
      page: () => MerchantSplashScreen(),
    ),
    GetPage(
      name: AppLinks.merchant_get_started,
      page: () => MerchantGetStarted(),
    ),
    //  Merchant APP

    //  Driver APP
    GetPage(
      name: AppLinks.driver_splash_screen,
      page: () => DriverSplashScreen(),
    ),
    GetPage(
      name: AppLinks.driver_get_started,
      page: () => DriverGetStarted(),
    ),
    //  Driver APP
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
  static const browse = '/browse';
  static const myCart = '/my_cart';
  static const confirmOrder = '/confirm_order';
  static const customAmount = '/custom_amount';
  static const tipsAndNotes = '/tips_and_notes';
  static const deliveryOptions = '/delivery_options';
  static const paymentMethods = '/payment_methods';
  static const addPaymentMethod = '/add_payment_method';
  static const editPaymentMethodDetails = '/edit_payment_method_details';
  static const selectedPaymentMethodDetails =
      '/selected_payment_method_details';
  static const recentOrders = '/recent_orders';
  static const orderDetails = '/order_details';
  static const notifications = '/notifications';
  static const promotions = '/promotions';
  static const deliveryOrderStatus = '/delivery_order_status';
  static const pickUpOrderStatus = '/pick_up_order_status';
  static const profile = '/profile';
  static const support = '/support';

//  MAIN APP

//Merchant APP
  static const merchant_splash_screen = '/merchant_splash_screen';
  static const merchant_get_started = '/merchant_get_started';
  static const merchant_login = '/merchant_login';
  static const merchant_bottom_nav = '/merchant_bottom_nav';
  static const merchant_home = '/merchant_home';
  static const edit_merchant_app = '/edit_merchant_app';
  static const merchant_app_settings = '/merchant_app_settings';
  static const add_schedule = '/add_schedule';
  static const m_languages = '/m_languages';
  static const merchant_app_stats = '/merchant_app_stats';
  static const resutaurants_status = '/resutaurants_status';
  static const schedule_detail = '/schedule_detail';

//Merchant APP

//DRIVER APP
  static const driver_splash_screen = '/driver_splash_screen';
  static const driver_get_started = '/driver_get_started';
//DRIVER APP
}
