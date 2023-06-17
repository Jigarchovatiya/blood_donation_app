import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../res/common/app_button.dart';
import '../../res/constants/app_assets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex = 0;
  List<Map<String, dynamic>> onBoardingList = [
    {
      "image": AppAssets.pageOne,
      "text": AppStrings.welCome,
      "subText": AppStrings.pageOneDisc,
    },
    {
      "image": AppAssets.pageTwo,
      "text": AppStrings.connectingDonors,
      "subText": AppStrings.pageTwoDisc,
    },
    {
      "image": AppAssets.pageThree,
      "text": AppStrings.joinUsToday,
      "subText": AppStrings.pageThreeDisc,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, size: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, RoutesName.logInScreen, (route) => false);
                        },
                        child: const Text(
                          AppStrings.skip,
                          style: TextStyle(decoration: TextDecoration.underline, color: AppColors.textColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.homeBg,
                  height: height / 1.45,
                  child: PageView(
                    onPageChanged: (value) {
                      selectedIndex = value;
                      setState(() {});
                    },
                    controller: pageController,
                    children: onBoardingList.map((value) {
                      return Column(
                        children: [
                          Align(
                            heightFactor: 1.00,
                            child: Image.asset(
                              value["image"],
                              height: height / 2.45,
                            ),
                          ),
                          SizedBox(
                            height: height / 18,
                          ),
                          Text(
                            value["text"],
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
                          ),
                          SizedBox(
                            height: height / 90,
                          ),
                          Text(
                            value["subText"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height / 35,
                      ),
                      AppButton(
                        borderRadius: BorderRadius.circular(30),
                        backgroundColor: AppColors.materialColor,
                        foregroundColor: AppColors.white,
                        side: const BorderSide(style: BorderStyle.none),
                        fixedSize: Size(width / 1.14, height / 15),
                        onPressed: () {
                          if (selectedIndex == 2) {
                            Navigator.pushNamed(context, RoutesName.logInScreen);
                          } else {
                            pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                          }
                        },
                        buttonText: selectedIndex == 2 ? AppStrings.letsBegin : AppStrings.continueButton,
                      ),
                      SizedBox(
                        height: height / 25,
                      ),
                      Center(
                        child: SmoothPageIndicator(
                            controller: pageController, // PageController
                            count: 3,
                            effect: SwapEffect(activeDotColor: AppColors.materialColor, dotHeight: 10, dotWidth: 10), // your preferred effect
                            onDotClicked: (index) {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
