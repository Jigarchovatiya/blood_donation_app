import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class DonorScreen extends StatefulWidget {
  final Function(String)? onTap;

  const DonorScreen({Key? key, this.onTap}) : super(key: key);

  @override
  State<DonorScreen> createState() => _DonorScreenState();
}

class _DonorScreenState extends State<DonorScreen> {
  bool isSelected = false;
  String? bloodGroup = "";
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
        title: const Text(AppStrings.donors),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(height / 80),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.donorsNearYou,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                      padding: EdgeInsets.symmetric(horizontal: width / 60, vertical: height / 200),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width / 60, vertical: height / 200),
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.donorDetail);
                },
                child: Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
