import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/constants/app_assets.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_strings.dart';

class DonnerScreen extends StatefulWidget {
  const DonnerScreen({Key? key}) : super(key: key);

  @override
  State<DonnerScreen> createState() => _DonnerScreenState();
}

class _DonnerScreenState extends State<DonnerScreen> {
  bool isSelected = false;
  List<Map<String, dynamic>> donationCampaignsList = [
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
  List profileImageList = [
    AppAssets.profileOne,
    AppAssets.profileTwo,
    AppAssets.profileThree,
    AppAssets.profileFour,
    AppAssets.profileFive,
    AppAssets.profileSix,
    AppAssets.profileSeven,
    AppAssets.profileFive,
  ];
  List donorsNameList = [
    AppStrings.donorOne,
    AppStrings.donorTwo,
    AppStrings.donorThree,
    AppStrings.donorFour,
    AppStrings.donorFive,
    AppStrings.donorSix,
    AppStrings.donorSeven,
  ];
  List bloodGroupList = [
    "All",
    "A+",
    "A-",
    "AB+",
    "AB-",
    "O+",
    "O-",
    "B+",
    "B-",
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.materialColor,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppStrings.donors),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                AppStrings.donorsNearYou,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profileImageList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected == true ? AppColors.materialColor : AppColors.buttonBg,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Center(
                          child: Text(
                            bloodGroupList[index],
                            style: TextStyle(color: isSelected == true ? AppColors.white : AppColors.textColor, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.textFillColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Image.asset(profileImageList[index], height: 78),
                          SizedBox(width: width / 30),
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
                              SizedBox(height: height / 80),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.mapGray),
                                  SizedBox(width: width / 50),
                                  const Text(
                                    "Kadaghari, Kathmandu",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height / 80),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.call),
                                  SizedBox(width: width / 50),
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
                              SizedBox(height: height / 50),
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
      ),
    );
  }
}
