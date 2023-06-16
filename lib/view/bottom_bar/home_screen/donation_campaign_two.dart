import 'package:flutter/material.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';
import '../../../utils/routes/routes_name.dart';

class DonationCampaignTwo extends StatefulWidget {
  const DonationCampaignTwo({super.key});

  @override
  State<DonationCampaignTwo> createState() => _DonationCampaignTwoState();
}

class _DonationCampaignTwoState extends State<DonationCampaignTwo> {
  List<bool> isSelectedList = [false, false, false, false, false];
  List timeList = ["10:00 am", "11:30 am", "1:00 pm", "2:30 pm", "4:00 pm"];

  String? selectedTime = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                SizedBox(height: height / 80),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.timeSlot,
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
                      width: width / 1.41,
                      height: 8,
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
                      width: width / 40,
                    ),
                    const Text(
                      "Step 1/3",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: height / 80),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.selectASuitableTimeSlot,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Wrap(
                  spacing: 20,
                  children: List<Widget>.generate(timeList.length, (int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedTime == timeList[index]) {
                            selectedTime = null; // Deselect the chip if it's already selected
                          } else {
                            selectedTime = timeList[index]; // Select the chip
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedTime == timeList[index] ? AppColors.dividerColor : AppColors.buttonBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            timeList[index],
                            style: const TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: height / 2.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        AppStrings.back,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.textColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    AppButton(
                      borderRadius: BorderRadius.circular(8),
                      foregroundColor: AppColors.white,
                      side: const BorderSide(style: BorderStyle.none),
                      backgroundColor: AppColors.materialColor,
                      fixedSize: const Size(80, 40),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.donationCampaignThree);
                      },
                      buttonText: AppStrings.next,
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
