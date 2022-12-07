import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: ''),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  text: 'Feedback',
                  size: 22,
                  weight: FontWeight.w700,
                ),
                MyText(
                  text: 'Please rate us',
                  size: 16,
                  paddingLeft: 10,
                  weight: FontWeight.w500,
                  paddingTop: 10,
                  paddingBottom: 50,
                ),
                MyText(
                  text: 'Functionality',
                  size: 16,
                  align: TextAlign.center,
                  paddingBottom: 5,
                ),
                Center(
                  child: RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Image.asset(
                        Assets.imagesRated,
                        height: 38.04,
                      ),
                      half: Image.asset(
                        Assets.imagesRated,
                        height: 38.04,
                      ),
                      empty: Image.asset(
                        Assets.imagesUnRated,
                        height: 38.04,
                      ),
                    ),
                    itemSize: 38.04,
                    glow: false,
                    updateOnDrag: false,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(height: 50,),
                MyText(
                  text: 'Support services',
                  size: 16,
                  align: TextAlign.center,
                  paddingBottom: 5,
                ),
                Center(
                  child: RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Image.asset(
                        Assets.imagesRated,
                        height: 38.04,
                      ),
                      half: Image.asset(
                        Assets.imagesRated,
                        height: 38.04,
                      ),
                      empty: Image.asset(
                        Assets.imagesUnRated,
                        height: 38.04,
                      ),
                    ),
                    itemSize: 38.04,
                    glow: false,
                    updateOnDrag: false,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                MyText(
                  paddingTop: 50,
                  text: 'Our customers',
                  size: 16,
                  align: TextAlign.center,
                  paddingBottom: 5,
                ),
                Center(
                  child: RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Image.asset(
                        Assets.imagesRated,
                        height: 38.04,
                      ),
                      half: Image.asset(
                        Assets.imagesRated,
                        height: 38.04,
                      ),
                      empty: Image.asset(
                        Assets.imagesUnRated,
                        height: 38.04,
                      ),
                    ),
                    itemSize: 38.04,
                    glow: false,
                    updateOnDrag: false,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
            child: MyButton(
              buttonText: 'Contact Support',
              onTap: () => Get.to(
                () => Support(
                  title: 'Support',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
