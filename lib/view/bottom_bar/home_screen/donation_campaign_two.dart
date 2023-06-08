import 'package:flutter/material.dart';

import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class DonationCampaignTwo extends StatefulWidget {
  const DonationCampaignTwo({super.key});

  @override
  State<DonationCampaignTwo> createState() => _DonationCampaignTwoState();
}

class _DonationCampaignTwoState extends State<DonationCampaignTwo> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelectedList = [false, false, false, false, false];
    List timeList = ["10:00 am", "11:30 am", "1:00 pm", "2:30 pm", "4:00 pm"];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? selectedTime = "";
    return Scaffold(
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
                    const SizedBox(
                      width: 290,
                      height: 8,
                      child: ClipRRect(
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
                  spacing: 10,
                  children: List.generate(
                    timeList.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(
                          timeList[index],
                        ),
                        disabledColor: AppColors.textColor,
                        selected: isSelectedList[index],
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedTime = timeList[index];
                            } else {
                              selectedTime = null;
                            }
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
