import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.info,
    required this.relatedImages,
  }) : super(key: key);

  final String info;
  final List<String> relatedImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          text: 'Information\'s',
          size: 16,
          weight: FontWeight.w700,
          paddingTop: 35,
          paddingLeft: 20,
          paddingBottom: 20,
        ),
        MyText(
          text: info,
          color: kBlackColor.withOpacity(0.5),
          height: 1.8,
          paddingRight: 20,
          paddingLeft: 20,
          paddingBottom: 25,
        ),
        SizedBox(
          height: 92,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 13,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: relatedImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                child: CommonImageView(
                  height: 92,
                  width: 92,
                  imagePath: relatedImages[index],
                  radius: 12.0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}