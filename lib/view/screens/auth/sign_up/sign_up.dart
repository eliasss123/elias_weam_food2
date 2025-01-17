import 'dart:convert';

import 'package:elias_weam_food2/config/routes/routes.dart';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/login.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/signup_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/prefix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:elias_weam_food2/api/connect.dart';
import '../../../../api/api.dart';
import '../../main_app/home/home.dart';
import '../../main_app/home/restaurant_details.dart';



class Signup extends StatelessWidget {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> _handleSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // final GoogleSignInAuthentication googleAuth =
      //     await googleUser!.authentication;

      // Use googleAuth.idToken and googleAuth.accessToken to authenticate with your backend
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignInWithFacebook() async {
    try {
      final LoginResult result = await _facebookAuth.login();

      if (result.status == LoginStatus.success) {
        // Use result.accessToken!.token to authenticate with your backend
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignInWithApple() async {
    try {
      // final credential = await SignInWithApple.getAppleIDCredential(
      //   scopes: [
      //     AppleIDAuthorizationScopes.email,
      //     AppleIDAuthorizationScopes.fullName,
      //   ],
      // );

      // Use credential.authorizationCode to authenticate with your backend
    } catch (error) {
      print(error);
    }
  }
  void gethome() async {
    try{
      String j="https://10.0.2.2:7264/api/homecats";
      Response respone= await get(
        Uri.parse(j),
      );

      if(respone.statusCode==200){

        Iterable l = json.decode(respone.body);
        List<HomeCat> homecats = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));
        String j="https://10.0.2.2:7264/api/restcats";
        Response respone1= await get(
          Uri.parse(j),
        );
        if (respone1.statusCode==200){
          String j="https://10.0.2.2:7264/api/restcats";
          Response respone1= await get(
            Uri.parse(j),
          );
          Iterable l = json.decode(respone1.body);
          List<HomeCat> restcat = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));
          String j1="https://10.0.2.2:7264/api/resturants";
          Response respone2= await get(
            Uri.parse(j1),
          );
          if(respone2.statusCode==200){
            Iterable l = json.decode(respone2.body);
            List<Restaurant> resturants = List<Restaurant>.from(l.map((model)=> Restaurant.fromJson(model)));
            int i=0;
            Get.to(()=>Home(homecats: homecats , resturants: resturants, resturantcats:restcat,));



          }
        }



      }else{
        print("no");
      }
    }catch(e){
      print(e.toString());
    }



  }
  TextEditingController phoneCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesHeaderBg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesSignUpBg,
                  height: 219,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  MyText(
                    onTap: () => Get.offAll(() => BottomNavBar()),
                    paddingTop: 20,
                    align: TextAlign.end,
                    text: 'skip'.tr,
                    weight: FontWeight.w500,
                    color: kGreyColor,
                  ),
                  MyText(
                    text: 'sign_up1'.tr,
                    size: 23,
                    weight: FontWeight.w700,
                    paddingBottom: 8,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  MyText(
                    text: 'order_to_your_location_in_one_click'.tr,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.71)
                        : kBlackColor2.withOpacity(0.71),
                    paddingBottom: 30,
                  ),
                  PrefixTextField(
                    controller:phoneCon ,
                    hintText: 'your_phone_number'.tr,
                    prefixIcon: Assets.imagesPhone,
                    prefixIconSize: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: isDark
                                ? kPrimaryColor.withOpacity(0.16)
                                : kDisableColor,
                          ),
                        ),
                        MyText(
                          paddingLeft: 10,
                          paddingRight: 10,
                          text: 'or'.tr,
                          size: 14,
                          color: isDark ? kPrimaryColor : kDarkGreyColor2,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: isDark
                                ? kPrimaryColor.withOpacity(0.16)
                                : kDisableColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLogin(
                        isDark: isDark,
                        icon: Assets.imagesApple,
                        iconSize: 25,
                        onTap: _handleSignInWithApple,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      SocialLogin(
                        isDark: isDark,
                        icon: Assets.imagesGoogle,
                        iconSize: 22,
                        onTap: _handleSignInWithGoogle,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      SocialLogin(
                        isDark: isDark,
                        icon: Assets.imagesFacebook,
                        iconSize: 25,
                        onTap: _handleSignInWithFacebook,
                      ),
                    ],
                  ),
                  MyText(
                    onTap: () => Get.to(() => SignupWithEmail()),
                    paddingTop: isEnglish ? 20 : 15,
                    text: 'i_don\'t_have_social_media'.tr,
                    weight: FontWeight.w500,
                    color: kSecondaryColor,
                    align: TextAlign.end,
                    paddingBottom: isEnglish ? 50 : 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: 213,
                      child: MyButton(
                        height: 52,
                        buttonText: 'sign_up'.tr,
                        onTap: (() =>Get.to(()=>
                        VerifyOtp(phonenum: this.phoneCon.text))
                          //() => VerifyOtp( phonenum: this.phoneCon.text,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MyText(
                  text: 'already_have_an_account'.tr,
                  color: isDark
                      ? kPrimaryColor.withOpacity(0.71)
                      : kBlackColor2.withOpacity(0.71),
                ),
                MyText(
                  onTap: () => Get.to(
                    () => Login(),
                  ),
                  text: ' ${'sign_in'.tr}',
                  weight: FontWeight.w500,
                  color: kSecondaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      );
    });
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.iconSize,
    required this.isDark,
  }) : super(key: key);

  final VoidCallback onTap;
  final String icon;
  final double iconSize;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              color: isDark
                  ? kDarkBorderColor.withOpacity(0.30)
                  : kBlackColor.withOpacity(0.10),
            ),
          ),
          child: Center(
            child: Image.asset(
              icon,
              height: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

