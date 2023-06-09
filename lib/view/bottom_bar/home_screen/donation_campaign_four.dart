import 'package:flutter/material.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class DonationCampaignFour extends StatefulWidget {
  const DonationCampaignFour({super.key});

  @override
  State<DonationCampaignFour> createState() => _DonationCampaignFourState();
}

class _DonationCampaignFourState extends State<DonationCampaignFour> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        title: const Text(
          AppStrings.bloodDonation,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height / 10,
                ),
                Container(
                  height: 440,
                  width: 345,
                  decoration: BoxDecoration(
                    color: AppColors.textFillColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Spacer(),
                            CloseButton(
                              style: ButtonStyle(
                                iconSize: MaterialStatePropertyAll(30),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                        Image.asset(
                          AppAssets.verified,
                          height: 95,
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                        const Text(
                          AppStrings.registeredSuccessfully,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        const Text(
                          AppStrings.goToHomePage,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 10),
                AppButton(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.materialColor,
                  side: BorderSide(width: 1, color: AppColors.materialColor),
                  fixedSize: const Size(345, 54),
                  onPressed: () {},
                  buttonText: AppStrings.downloadPdf,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
