import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../res/common/app_circle_avatar.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_strings.dart';
import '../../res/global/media_query.dart';
import '../../utils/routes/routes_name.dart';

class CreateAccountTwo extends StatefulWidget {
  const CreateAccountTwo({Key? key}) : super(key: key);

  @override
  State<CreateAccountTwo> createState() => _CreateAccountTwoState();
}

class _CreateAccountTwoState extends State<CreateAccountTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.black),
        ),
        title: const Text(
          AppStrings.appBarTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) / 20, vertical: height(context) / 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavBar, (route) => false);
              },
              child: const Text(
                AppStrings.skip,
                style: TextStyle(color: AppColors.textColor, decoration: TextDecoration.underline, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height(context) / 50,
                    ),
                    const Row(
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
                            color: AppColors.dividerColor,
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
                            color: AppColors.dividerColor,
                            thickness: 2,
                          ),
                        ),
                        AppCircleAvatar(
                          backgroundColor: Color(0xffFCBA04),
                          child: Text(
                            "3",
                            style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height(context) / 90),
                    Row(
                      children: [
                        SizedBox(
                          width: width(context) / 100,
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
                          width: width(context) / 200,
                        ),
                        const Text(
                          AppStrings.finish,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                        SizedBox(
                          width: width(context) / 200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: height(context) / 2.1,
                width: width(context) / 1.2,
                decoration: BoxDecoration(
                  color: AppColors.textFillColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        AppAssets.verified,
                        height: 95,
                      ),
                      const Text(AppStrings.registeredSuccessfully, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height(context) / 12),
              AppButton(
                borderRadius: BorderRadius.circular(30),
                backgroundColor: AppColors.materialColor,
                foregroundColor: AppColors.white,
                fixedSize: Size(width(context) / 1.14, height(context) / 15),
                side: const BorderSide(style: BorderStyle.none),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.bottomNavBar);
                },
                buttonText: AppStrings.goToHomePage,
              ),
              SizedBox(height: height(context) / 20),
            ],
          ),
        ),
      ),
    );
  }
}
