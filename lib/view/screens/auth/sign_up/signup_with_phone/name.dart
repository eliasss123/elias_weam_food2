import 'dart:convert';

import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/widget/congrats.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';

import '../../../../../api/api.dart';
import '../../../main_app/home/home.dart';
import '../../login.dart';

class Name extends StatefulWidget {
  Name({Key? key, required this.phonenum});
  final  String   phonenum;
  @override
  State<Name> createState() => _NameState(phonenum: phonenum);
}

class _NameState extends State<Name> {
  void getresturant( ) async {
    try{
      String j="https://10.0.2.2:7264/api/homecats";
      Response respone= await get(
        Uri.parse(j),
      );

      if(respone.statusCode==200){

        Iterable l = json.decode(respone.body);
        List<HomeCat> homecats = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));
        String j="https://10.0.2.2:7264/api/homecats";
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
            List<Restaurant> resturants = List<Restaurant>.from(l.map((model)=> HomeCat.fromJson(model)));
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
   _NameState({Key? key, required this.phonenum});
  final  String   phonenum;
  bool isActive = false;
  TextEditingController fNameCon = TextEditingController();
  TextEditingController lNameCon = TextEditingController();

  void onChanged() {
    if (fNameCon.text.isNotEmpty && lNameCon.text.isNotEmpty) {
      setState(() {
        isActive = true;
      });
    } else {
      setState(() {
        isActive = false;
      });
    }
  }
   void register() async {
     try{
       String j="https://10.0.2.2:7264/api/Clients";
       Response respone= await post(
           Uri.parse(j),
           headers: {
             'Accept': 'application/json',
             'Content-Type':'application/json'
           },
         body: jsonEncode({
           'firstname':this.fNameCon.text,'phonenumber':this.phonenum
           ,'lastName':this.lNameCon.text

         })



       );
       if(respone.statusCode==201){
         var k=jsonDecode(respone.body);
         Get.to(
               () => Congrats(
             heading: 'congratulations'.tr,
             congratsMsg: 'your_account_is_complete'.tr,
             onContinue: () => Get.offAll(() =>Login()),
             buttonText: 'done'.tr,
           ),
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
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          isDark: isDark,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            authHeading('enter_your_name'.tr),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SimpleTextField(
                    controller: fNameCon,
                    onChanged: (value) => onChanged(),
                    hintText: 'first_name'.tr,
                  ),
                  SimpleTextField(
                    controller: lNameCon,
                    onChanged: (value) => onChanged(),
                    hintText: 'last_name'.tr,
                    marginBottom: 45,
                  ),
                  MyButton(
                    isActive: isActive,
                    buttonText: 'next'.tr,
                    onTap: () => (
                      register()
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
