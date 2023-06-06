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
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
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
                          // Navigator.pushNamed(context, RoutesName.)
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
                  color: AppColors.scaffoldBg,
                  height: height / 1.55,
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
                            heightFactor: 0.95,
                            child: Image.asset(
                              value["image"],
                              height: 350,
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
                            height: height / 30,
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
                        height: height / 20,
                      ),
                      AppButton(
                        borderRadius: BorderRadius.circular(30),
                        backgroundColor: AppColors.materialColor,
                        foregroundColor: AppColors.white,
                        fixedSize: Size(345, 54),
                        onPressed: () {
                          if (selectedIndex == 2) {
                            Navigator.pushNamed(context, RoutesName.onBoarding);
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
