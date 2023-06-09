import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class DonorsDetailScreen extends StatefulWidget {
  const DonorsDetailScreen({super.key});

  @override
  State<DonorsDetailScreen> createState() => _DonorsDetailScreenState();
}

class _DonorsDetailScreenState extends State<DonorsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        elevation: 0,
        toolbarHeight: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.white),
        ),
        title: const Text(
          AppStrings.donorDetails,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height / 50),
            Image.asset(AppAssets.profileImage, height: 128),
            SizedBox(height: height / 80),
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Location: ",
                              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            TextSpan(
                              text: " Kadaghari, Kathmandu, 44600",
                              style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 70,
                      ),
                      const Divider(
                        thickness: 1,
                        endIndent: 30,
                        indent: 30,
                      ),
                      SizedBox(
                        height: height / 70,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            AppButton(
              borderRadius: BorderRadius.circular(30),
              backgroundColor: AppColors.materialColor,
              foregroundColor: AppColors.white,
              side: BorderSide.none,
              fixedSize: const Size(345, 54),
              onPressed: () {},
              buttonText: AppStrings.call,
            ),
          ],
        ),
      ),
    );
  }
}
