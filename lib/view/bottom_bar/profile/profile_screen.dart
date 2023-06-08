import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        title: const Text(
          AppStrings.profile,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 100,
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
                  height: height / 30,
                ),
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.profileImage,
                      height: 128,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
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
                  height: height / 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Aasma Shrestha",
                    ),
                    Icon(
                      Icons.verified,
                      color: AppColors.materialColor,
                    )
                  ],
                ),
                const Text(
                  "aasma@gmail.com",
                ),
                SizedBox(height: height / 50),
                const Row(
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
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
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
                          "20",
                        ),
                        Text(
                          "Donation",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
