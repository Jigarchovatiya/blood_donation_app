import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/common/app_text_field.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../../data/model/campaign_one_model.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class DonationCampaignOne extends StatefulWidget {
  const DonationCampaignOne({Key? key}) : super(key: key);

  @override
  State<DonationCampaignOne> createState() => _DonationCampaignOneState();
}

class _DonationCampaignOneState extends State<DonationCampaignOne> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController additionalInformation = TextEditingController();
  String bloodGroupData = "group 1";
  String answerData = "answer 1";
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.personalInfo,
                    style: TextStyle(fontSize: 18),
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
              SizedBox(height: height / 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      controller: name,
                      hintText: AppStrings.fullName,
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        const Text(
                          AppStrings.age,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width / 2.60),
                        const Text(
                          AppStrings.bloodGroup,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                          keyboardType: TextInputType.phone,
                          controller: age,
                          width: width / 2.4,
                          hintText: "20",
                        ),
                        AppTextField(
                          width: width / 2.4,
                          hintText: AppStrings.fullName,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              style: const TextStyle(fontSize: 20, color: AppColors.textColor),
                              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                              value: bloodGroupData,
                              isExpanded: true,
                              items: bloodGroupList
                                  .map((value) => DropdownMenuItem(
                                        value: value['value'],
                                        child: Text(value['data']),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                debugPrint(value.toString());
                                bloodGroupData = value.toString();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        const Text(
                          AppStrings.weight,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width / 4),
                        const Text(
                          AppStrings.lastDonatedOn,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                          keyboardType: TextInputType.phone,
                          controller: weight,
                          width: width / 2.4,
                          hintText: "60",
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: AppTextField(
                              width: width / 2.4,
                              readOnly: true,
                              hintText: AppStrings.campaignDt,
                              controller: TextEditingController(
                                text: selectedDate != null ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}' : '',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.anyCurrentMedication,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppStrings.emailExample,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          style: const TextStyle(fontSize: 20, color: AppColors.textColor),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                          value: answerData,
                          isExpanded: true,
                          items: answerList
                              .map((value) => DropdownMenuItem(
                                    value: value['value'],
                                    child: Text(value['data']),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            debugPrint(value.toString());
                            answerData = value.toString();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height / 50),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.additionalInformation,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      controller: additionalInformation,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.yourAnswer,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        AppStrings.clearForm,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.textColor),
                      ),
                      onPressed: () {
                        name.clear();
                        age.clear();
                        weight.clear();
                        additionalInformation.clear();
                      },
                    ),
                    AppButton(
                      borderRadius: BorderRadius.circular(8),
                      foregroundColor: AppColors.white,
                      side: const BorderSide(style: BorderStyle.none),
                      backgroundColor: AppColors.materialColor,
                      fixedSize: Size(width / 5, height / 50),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.donationCampaignTwo);
                      },
                      buttonText: AppStrings.next,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
