import 'package:blood_donation_app/data/model/donor_model.dart';
import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_strings.dart';
import '../../../res/global/media_quary.dart';

class HomeScreen extends StatefulWidget {
  final Function(String)? onTab;

  const HomeScreen({Key? key, this.onTab}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isSelected = false;
  String? bloodGroup = "";
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        title: const Text(
          AppStrings.bloodDonation,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(color: AppColors.white),
              height: height(context) / 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.donationCampaignsNearYou,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.onTab!("Campaign");
                        },
                        child: Text(
                          AppStrings.seeAll,
                          style: TextStyle(
                            color: AppColors.materialColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(context) / 4.70,
                    width: width(context) / 1,
                    child: PageView(
                      onPageChanged: (value) {
                        selectedIndex = value;
                        setState(() {});
                      },
                      controller: pageController,
                      children: onBoardingList.map((value) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(AppAssets.donateAndSaveLife, height: height(context) / 7),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      AppStrings.donateAndSaveLife,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppAssets.map),
                                        SizedBox(width: width(context) / 50),
                                        const Text(
                                          AppStrings.map,
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppAssets.calender),
                                        SizedBox(width: width(context) / 50),
                                        const Text(
                                          AppStrings.calender,
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppAssets.clock),
                                        SizedBox(width: width(context) / 50),
                                        const Text(
                                          AppStrings.clock,
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    AppButton(
                                      borderRadius: BorderRadius.circular(30),
                                      backgroundColor: AppColors.materialColor,
                                      foregroundColor: AppColors.white,
                                      fixedSize: Size(width(context) / 2.20, height(context) / 50),
                                      buttonText: AppStrings.donate,
                                      side: const BorderSide(style: BorderStyle.none),
                                      onPressed: () {
                                        Navigator.pushNamed(context, RoutesName.donationCampaignOne);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: height(context) / 40,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                        controller: pageController, // PageController
                        count: 3,
                        effect: ScrollingDotsEffect(
                          activeDotColor: AppColors.materialColor,
                          dotHeight: height(context) / 150,
                          dotWidth: width(context) / 15,
                        ), // your preferred effect
                        onDotClicked: (index) {}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.donorsNearYou,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onTab!("Donor");
                    },
                    child: Text(
                      AppStrings.seeAll,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: AppColors.materialColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profileImageList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (bloodGroup == bloodGroupList[index]) {
                        bloodGroup = null; // Deselect the chip if it's already selected
                      } else {
                        bloodGroup = bloodGroupList[index]; // Select the chip
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(context) / 60, vertical: height(context) / 200),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width(context) / 60, vertical: height(context) / 200),
                      decoration: BoxDecoration(
                        color: bloodGroup == bloodGroupList[index] ? AppColors.materialColor : AppColors.buttonBg,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Text(
                            bloodGroupList[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: bloodGroup == bloodGroupList[index] ? AppColors.white : AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(height(context) / 50),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: height(context) / 60),
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(height(context) / 55),
                    decoration: BoxDecoration(
                      color: AppColors.textFillColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(profileImageList[index], height: 78),
                        SizedBox(width: width(context) / 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donorsNameList[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: height(context) / 80),
                            Row(
                              children: [
                                SvgPicture.asset(AppAssets.mapGray),
                                SizedBox(width: width(context) / 50),
                                const Text(
                                  "Kadaghari, Kathmandu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height(context) / 80),
                            Row(
                              children: [
                                SvgPicture.asset(AppAssets.call),
                                SizedBox(width: width(context) / 50),
                                const Text(
                                  "+977 98654321987",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              bloodGroupList[index],
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.materialColor),
                            ),
                            SizedBox(height: height(context) / 50),
                            CircleAvatar(
                              radius: 18,
                              foregroundColor: Colors.white,
                              backgroundColor: AppColors.materialColor,
                              child: SvgPicture.asset(AppAssets.chat),
                            ),
                          ],
                        ),
                      ],
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
