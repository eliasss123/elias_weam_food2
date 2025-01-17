import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/your_name.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';

class SignupWithEmail extends StatefulWidget {

  @override
  State<SignupWithEmail> createState() => _SignupWithEmailState();
}

class _SignupWithEmailState extends State<SignupWithEmail> {
  bool isActive = false;
  TextEditingController emailCon = TextEditingController();
  void login(String email,String password) async {
    try{
      String j="https://10.0.2.2:7264/api/Clients"+"/"+email;
      Response respone= await get(
          Uri.parse(j),
          headers: {
            'Accept': 'application/json',
            'Content-Type':'application/json'
          }


      );
      if(respone.statusCode==200){

        Get.to(
                () => YourName(email: email));
      }else{
        print("no");
      }
    }catch(e){
      print(e.toString());
    }

  }
  void onChanged() {
    if (emailCon.text.isNotEmpty) {
      setState(() {
        isActive = true;
      });
    } else {
      setState(() {
        isActive = false;
      });
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
            authHeading('enter_your_email'.tr),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SimpleTextField(
                    controller: emailCon,
                    onChanged: (value) => onChanged(),
                    hintText: 'email'.tr,
                    marginBottom: 25,
                  ),
                  MyButton(
                    isActive: isActive,
                    buttonText: 'next'.tr,
                    onTap: () => Get.to(
                      () => YourName(email: emailCon.text,),
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
