import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/map_tooltip.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetLocationForFirstTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Location',
      ),
      body: Stack(
        children: [
          CommonImageView(
            imagePath: Assets.imagesPickUpMap,
            height: 236,
            width: Get.width,
            radius: 20.0,
          ),
          Positioned(
            top: 40,
            right: 40,
            child: mapToolTip('City Center Hotel Jerusalem'),
          ),
        ],
      ),
    );
  }
}
