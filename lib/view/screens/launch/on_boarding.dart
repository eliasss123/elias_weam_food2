import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/sign_up.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pageController = PageController();
  int currentIndex = 0;

  void setCurrentPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  paddingTop: 35,
                  paddingRight: 15,
                  align: TextAlign.end,
                  text: 'Skip',
                  weight: FontWeight.w500,
                  color: kGreyColor,
                  paddingBottom: 10,
                ),
                Center(
                  child: Image.asset(
                    Assets.imagesLogoHoriz,
                    height: 53,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (index) => setCurrentPage(index),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          Assets.imagesUnderOnTheWay,
                          height: 131,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            MyText(
                              text: 'Delivery at your ',
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                            MyText(
                              text: 'doorstep',
                              size: 20,
                              weight: FontWeight.w700,
                              color: kSecondaryColor,
                            ),
                          ],
                        ),
                        MyText(
                          paddingTop: 13,
                          paddingRight: 30,
                          paddingLeft: 30,
                          text:
                              'Your order will be delivered as soon as possible by our courier.',
                          color: kBlackColor2.withOpacity(0.48),
                          height: 1.6,
                          size: 16,
                          align: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    radius: 100.0,
                    dotColor: kLightGreyColor,
                    activeDotColor: kSecondaryColor,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 213,
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kSecondaryColor,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.to(
                      () => Signup(),
                    ),
                    splashColor: kPrimaryColor.withOpacity(0.1),
                    highlightColor: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: 'Next',
                          weight: FontWeight.w700,
                          color: kPrimaryColor,
                          paddingRight: 8,
                        ),
                        Image.asset(
                          Assets.imagesArrowForward,
                          height: 13,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
