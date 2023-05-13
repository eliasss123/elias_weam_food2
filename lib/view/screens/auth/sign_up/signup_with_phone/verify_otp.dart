import 'dart:convert';

import 'package:elias_weam_food2/api/requests.dart';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/name.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

import '../../../../../api/ClientSession.dart';
import '../../../../../api/api.dart';
import 'package:get/get.dart' hide Response;

import '../../../main_app/home/home.dart';
class VerifyOtp extends StatelessWidget {

  const VerifyOtp({Key? key, required this.phonenum}) : super(key: key);
  final  String   phonenum;
  void clientexsist(BuildContext context) async {
    try{
      String j="https://10.0.2.2:7264/api/Clients/0542500657";
      final respone= await post(
          Uri.parse(j),
          headers: {
            'Accept': 'application/json',
            'Content-Type':'application/json'
          },



      );
      if(respone.statusCode==200){
        String k=jsonDecode(respone.body);
        ClientSession clientSession = Provider.of<ClientSession>(context, listen: false);
        clientSession.accessToken=k;
        List<HomeCat> homeca= await HomeCatApi().getHomeCats();
        List<HomeCat> restca= await RestcatApi().getHomeCats();
        List<Restaurant> rests= await RestaurantApi().getRestaurants();
        Get.to(

              ()  =>Home(homecats:homeca, resturants: rests, resturantcats:restca,),


        );
      }else{
        print("no");
      }
    }catch(e){
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    const String accountSid = "AC652d57c2a9fb7b2187365296ec5e6f53";
    const String authToken = "4c3af4a4ec9fc596656fedf622df495c";
    const String verifySid = "VA3fa269272e1446f630b11901ac072305";
     String verifiedNumber = "+972"+this.phonenum;
    Future<bool> checkVerification( String otpCode) async {
      final String url = "https://verify.twilio.com/v2/Services/$verifySid/VerificationCheck";
      final response = await post(
        Uri.parse(url),
        headers: {
          "Authorization": "Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "To": verifiedNumber,
          "Code": otpCode,
        },
      );

      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'approved') {
        return true;
      } else {
        return false;
      }

    }
    Future<String> sendVerification() async {

      final String url = "https://verify.twilio.com/v2/Services/$verifySid/Verifications";
      final response = await post(
        Uri.parse(url),
        headers: {
          "Authorization": "Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "To": "+972"+phonenum,
          "Channel": "sms",
        },
      );

      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return jsonResponse["status"];
    }
    Future<bool> loginphone( ) async {

        String j="https://10.0.2.2:7264/api/Clients/0542500657";
        final respone= await get(
            Uri.parse(j),
            headers: {
              'Accept': 'text/plain',

            },




        );
        if(respone.statusCode==200){

          String k=respone.body;

          ClientSession clientSession = Provider.of<ClientSession>(context, listen: false);
          clientSession.accessToken=k;

          return true;
        }else{
          return false;
        }


    }
    sendVerification();
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      var defaultPinTheme = PinTheme(
        width: 47,
        height: 50,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: isDark ? kPrimaryColor : kBlackColor2,
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
        decoration: BoxDecoration(
          color: isDark ? kDarkInputBgColor : Colors.transparent,
          border: Border.all(
            color: isDark ? kDarkInputBgColor : kBorderColor2,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      );
      return Scaffold(
        appBar: simpleAppBar(isDark: isDark),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            authHeading('verify_your_phone_number'.tr),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  fontFamily: GoogleFonts.dmSans().fontFamily,
                  color: kTertiaryColor,
                ),
                children: [
                  TextSpan(
                    text: 'enter_the_4_digit_code_sent_to_you_at'.tr,
                  ),
                  TextSpan(
                    style: TextStyle(
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    text: this.phonenum,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Pinput(
              length: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(
                  color: kSecondaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration?.copyWith(
                  border: Border.all(
                    color: kSecondaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                print(value);
              },
              onCompleted: (pin) async {

                if( await checkVerification(pin)){

                   if(await  loginphone()){
                     List<HomeCat> homeca= await HomeCatApi().getHomeCats();
                     List<HomeCat> restca= await RestcatApi().getHomeCats();
                     List<Restaurant> rests= await RestaurantApi().getRestaurants();
                     Get.to(()=>Home(homecats: homeca, resturants: rests, resturantcats: restca));
                   }else{
                     Get.to(Name(phonenum: phonenum));
                   }


                }else{
                  int i=0;
                }
              },
              separator: SizedBox(
                width: 12,
              ),
            ),
            MyText(
              paddingTop: 27,
              decoration: TextDecoration.underline,
              text: 'resend_code_via_sms'.tr,
              size: 14,
              weight: FontWeight.w700,
              color:
                  isDark ? kDarkModeGreyColor : kBlackColor2.withOpacity(0.50),
              align: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
