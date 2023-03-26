import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/payment_method/add_new_card.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  final List<String> paymentMethods = [
    Assets.imagesVisaPay,
    Assets.imagesPayApple,
    Assets.imagesPayMaster,
    Assets.imagesPayPaypal,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'payment_methods'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'select_your_preferred_payment_method'.tr,
                align: TextAlign.center,
                size: 14,
                weight: FontWeight.w500,
                color: kGreyColor7,
                paddingBottom: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  paymentMethods.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              elevation: 0,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) {
                                return AddNewCard();
                              },
                            );
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                fit: BoxFit.cover,
                                paymentMethods[index],
                                color: index == 0 || index == 1
                                    ? isDark
                                        ? kPrimaryColor
                                        : null
                                    : null,
                                width: index == 3 ? 100 : 120,
                                height: index == 3
                                    ? 100
                                    : index == 2
                                        ? 80
                                        : 88,
                              ),
                              index == 0
                                  ? Positioned(
                                      right: 5,
                                      top: -5,
                                      child: Image.asset(
                                        Assets.imagesRoundedCheckBorder,
                                        height: 36,
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
