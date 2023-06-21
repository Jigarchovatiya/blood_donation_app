import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../data/model/profile_model.dart';
import '../../../res/global/media_query.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      // appBar: AppBar(
      //   foregroundColor: AppColors.white,
      //   backgroundColor: AppColors.materialColor,
      //   title: const Text(
      //     AppStrings.profile,
      //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.materialColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(300, 100),
                  bottomLeft: Radius.elliptical(300, 100),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height(context) / 20,
                ),
                const Text(
                  AppStrings.profile,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white),
                ),
                SizedBox(
                  height: height(context) / 10,
                ),
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.profileImage,
                      height: width(context) / 3.5,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.materialColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height(context) / 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Aasma Shrestha",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    SizedBox(
                      width: width(context) / 80,
                    ),
                    Icon(
                      Icons.verified,
                      color: AppColors.materialColor,
                    )
                  ],
                ),
                const Text(
                  "aasma@gmail.com",
                  style: TextStyle(color: AppColors.textColor),
                ),
                SizedBox(height: height(context) / 40),
                SizedBox(
                  height: height(context) / 18,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "20",
                          ),
                          Text(
                            "Donation",
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: AppColors.dividerGray,
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            "B+",
                          ),
                          Text(
                            "Blood Group",
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: AppColors.dividerGray,
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            "5",
                          ),
                          Text(
                            "Campaigns",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: profileList[index]["icon"],
                            title: profileList[index]["title"],
                            titleTextStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: index == 6 ? AppColors.red : AppColors.textColor,
                            ),
                          ),
                          index == 6
                              ? const SizedBox()
                              : const Divider(
                                  height: 1,
                                  thickness: 1,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                        ],
                      );
                    },
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
