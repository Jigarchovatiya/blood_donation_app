import 'package:flutter/material.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class DonationCampaignFour extends StatefulWidget {
  final Function(String)? onTab;

  const DonationCampaignFour({Key? key, this.onTab}) : super(key: key);

  @override
  State<DonationCampaignFour> createState() => _DonationCampaignFourState();
}

class _DonationCampaignFourState extends State<DonationCampaignFour> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  height: height / 1.80,
                  width: width / 1.10,
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
                          height: height / 6,
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                        const Text(
                          AppStrings.registeredSuccessfully,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            widget.onTab!("Home");
                          },
                          child: const Text(
                            AppStrings.goToHomePage,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),
                          ),
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
                  side: BorderSide(width: width / 300, color: AppColors.materialColor),
                  fixedSize: Size(width / 1.1, height / 15),
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
