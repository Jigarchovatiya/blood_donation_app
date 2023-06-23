import 'package:blood_donation_app/data/model/donation_campaign_model.dart';
import 'package:blood_donation_app/data/model/donor_model.dart';
import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_strings.dart';
import '../../../res/global/media_query.dart';

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
              decoration: const BoxDecoration(color: AppColors.homeBg),
              height: height(context) / 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
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
                        GestureDetector(
                          onTap: () {
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
                  ),
                  SizedBox(
                    height: height(context) / 5.55,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(campaignList[index]["image"], height: height(context) / 7),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      campaignList[index]["title"],
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppAssets.map),
                                        SizedBox(width: width(context) / 50),
                                        Text(
                                          campaignList[index]["location"],
                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppAssets.calender),
                                        SizedBox(width: width(context) / 50),
                                        Text(
                                          campaignList[index]["date"],
                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppAssets.clock),
                                        SizedBox(width: width(context) / 50),
                                        Text(
                                          campaignList[index]["time"],
                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                      },
                      itemCount: campaignList.length,
                      onPageChanged: (value) {
                        selectedIndex = value;
                        setState(() {});
                      },
                      controller: pageController,
                    ),
                  ),
                  SizedBox(
                    height: height(context) / 40,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                        controller: pageController, // PageController
                        count: campaignList.length,
                        effect: ScrollingDotsEffect(
                          spacing: 10,
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
              padding: const EdgeInsets.all(20),
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
                  GestureDetector(
                    onTap: () {
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
                itemCount: donorList.length,
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
                              donorList[index]["name"],
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
                                Text(
                                  donorList[index]["location"],
                                  style: const TextStyle(
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
                                Text(
                                  donorList[index]["phone"],
                                  style: const TextStyle(
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
                              donorList[index]["group"],
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
