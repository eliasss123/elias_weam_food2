import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/selected_payment_method_details.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';

class AddPaymentMethod extends StatelessWidget {
  final List<String> paymentMethods = [
    Assets.imagesVisaPay,
    Assets.imagesPayApple,
    Assets.imagesPayMaster,
    Assets.imagesPayPaypal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Payment Methods',
        titleWeight: FontWeight.w700,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              text: 'Select your preferred payment method:',
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
                        onTap: index == 1 || index ==3 ? () {} :() {
                          showModalBottomSheet(
                            context: context,
                            elevation: 0,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) {
                              return SelectedPaymentMethodDetails();
                            },
                          );
                        },
                        child: Image.asset(
                          fit: BoxFit.cover,
                          paymentMethods[index],
                          width: index == 3 ? 100 : 120,
                          height: index == 3
                              ? 100
                              : index == 2
                                  ? 80
                                  : 88,
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
  }
}
