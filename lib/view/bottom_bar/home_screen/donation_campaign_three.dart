import 'package:flutter/material.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';
import '../../../res/global/media_quary.dart';
import '../../../utils/routes/routes_name.dart';

class DonationCampaignThree extends StatefulWidget {
  const DonationCampaignThree({super.key});

  @override
  State<DonationCampaignThree> createState() => _DonationCampaignThreeState();
}

class _DonationCampaignThreeState extends State<DonationCampaignThree> {
  @override
  Widget build(BuildContext context) {
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
          AppStrings.donationCampaigns,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: height(context) / 80),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.review,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width(context) / 1.41,
                      height: height(context) / 100,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          color: AppColors.dividerColor,
                          backgroundColor: Color(0xffF0F0F2),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width(context) / 40,
                    ),
                    const Text(
                      "Step 1/3",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: height(context) / 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.reviewYourResponse,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: height(context) / 80,
                ),
                Container(
                  height: height(context) / 1.90,
                  decoration: BoxDecoration(
                    color: AppColors.textFillColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          AppStrings.campaignDetails,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: height(context) / 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  AppStrings.refNumber,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.campaignName,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.campaignDate,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                              ],
                            ),
                            SizedBox(height: height(context) / 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  AppStrings.refNo,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.donateBloodSaveLife,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.campaignDt,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height(context) / 40),
                        const Divider(
                          thickness: 1,
                          color: AppColors.dividerGray,
                        ),
                        SizedBox(height: height(context) / 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  AppStrings.donorName,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.gender,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.age,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.weight,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.bloodGroup,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.lastDonatedOn,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.currentMedication,
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Saroj Shah",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  "Male",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  "23 years",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  "65 Kg",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  "B+",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  AppStrings.campaignDt,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                SizedBox(height: height(context) / 80),
                                const Text(
                                  "No",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height(context) / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        AppStrings.back,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.textColor),
                      ),
                    ),
                    AppButton(
                      borderRadius: BorderRadius.circular(8),
                      foregroundColor: AppColors.white,
                      side: const BorderSide(style: BorderStyle.none),
                      backgroundColor: AppColors.materialColor,
                      fixedSize: Size(width(context) / 4, height(context) / 50),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.donationCampaignFour);
                      },
                      buttonText: AppStrings.submit,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
