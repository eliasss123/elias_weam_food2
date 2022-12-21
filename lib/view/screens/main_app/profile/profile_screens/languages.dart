import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  final List<String> languagesList = [
    'English',
    'Hebrew',
    'Arabic',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Language',
        titleWeight: FontWeight.w700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSeoulColor3,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: languagesList[index],
                              size: 18,
                            ),
                            Container(
                              height: 22.5,
                              width: 22.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? kSecondaryColor
                                    : Colors.transparent,
                                border: Border.all(
                                  width: 1.5,
                                  color: currentIndex == index
                                      ? kSecondaryColor
                                      : kBorderColor4,
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 15,
                                color: currentIndex == index
                                    ? kPrimaryColor
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 45,
              right: 45,
              top: 20,
              bottom: isIos ? 23:20,
            ),
            child: MyButton(
              buttonText: 'Next',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
