import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:blood_donation_app/view/onboarding/page_view/page_one.dart';
import 'package:blood_donation_app/view/onboarding/page_view/page_three.dart';
import 'package:blood_donation_app/view/onboarding/page_view/page_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../res/common/app_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  color: AppColors.black,
                  height: height / 1.5,
                  child: PageView(
                    onPageChanged: (value) {
                      selectedIndex = value;
                      setState(() {});
                    },
                    controller: pageController,
                    children: const [
                      PageOne(),
                      PageTwo(),
                      PageThree(),
                    ],
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
                        onPressed: () {
                          selectedIndex == 2 ? Navigator.pushNamed(context, RoutesName.splashScreen) : null;
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
