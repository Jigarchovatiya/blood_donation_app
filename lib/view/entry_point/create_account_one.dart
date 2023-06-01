import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/common/app_text_field.dart';
import 'package:flutter/material.dart';

import '../../res/common/app_circle_avatar.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_strings.dart';

class CreateAccountOne extends StatefulWidget {
  const CreateAccountOne({Key? key}) : super(key: key);

  @override
  State<CreateAccountOne> createState() => _CreateAccountOneState();
}

class _CreateAccountOneState extends State<CreateAccountOne> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text(
          AppStrings.appBarTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              AppStrings.skip,
              style: TextStyle(color: AppColors.textColor, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppCircleAvatar(
                          backgroundColor: Color(0xffFCBA04),
                          child: Text(
                            "1",
                            style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 5,
                            endIndent: 5,
                            color: AppColors.textColor,
                            thickness: 2,
                          ),
                        ),
                        AppCircleAvatar(
                          backgroundColor: Color(0xffFCBA04),
                          child: Text(
                            "2",
                            style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 5,
                            endIndent: 5,
                            color: AppColors.textColor,
                            thickness: 2,
                          ),
                        ),
                        AppCircleAvatar(
                          child: Text(
                            "3",
                            style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          backgroundColor: Color(0xffE6E6E6),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 90),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 100,
                        ),
                        const Text(
                          AppStrings.login,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                        const Spacer(),
                        const Text(
                          AppStrings.profile,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: width / 200,
                        ),
                        const Text(
                          AppStrings.finish,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                        SizedBox(
                          width: width / 200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 50),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.skip,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      hintText: AppStrings.fullName,
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        Text(
                          AppStrings.age,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width / 2.45),
                        Text(
                          AppStrings.bloodGroup,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                          width: 164,
                          hintText: "20",
                        ),
                        AppTextField(
                          width: 164,
                          hintText: AppStrings.fullName,
                          suffixIcon: Icon(Icons.keyboard_arrow_down, size: 30),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        Text(
                          AppStrings.gender,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width / 2.45),
                        Text(
                          AppStrings.weight,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                          width: 164,
                          hintText: AppStrings.fullName,
                          suffixIcon: Icon(Icons.keyboard_arrow_down, size: 30),
                        ),
                        AppTextField(
                          width: 164,
                          hintText: "60",
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.email,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      hintText: AppStrings.fullName,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 20),
              AppButton(
                buttonText: AppStrings.continueButton,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
