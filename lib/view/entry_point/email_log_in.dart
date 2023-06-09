import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/common/app_circle_avatar.dart';
import 'package:blood_donation_app/res/common/app_text_field.dart';
import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:blood_donation_app/res/extension/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmailLogInScreen extends StatefulWidget {
  const EmailLogInScreen({Key? key}) : super(key: key);

  @override
  State<EmailLogInScreen> createState() => _EmailLogInScreenState();
}

class _EmailLogInScreenState extends State<EmailLogInScreen> {
  bool isChecked = false;

  User? person;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leading: null,
        title: const Text(
          AppStrings.appBarText,
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
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
                              color: AppColors.textColor,
                              thickness: 2,
                            ),
                          ),
                          AppCircleAvatar(
                            backgroundColor: Color(0xffE6E6E6),
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
                            backgroundColor: Color(0xffE6E6E6),
                            child: Text(
                              "3",
                              style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 90,
                      ),
                      Row(
                        children: [
                          const Text(
                            AppStrings.account,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                          ),
                          const Spacer(),
                          const Text(
                            AppStrings.profile,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 90,
                          ),
                          const Text(
                            AppStrings.finish,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 90,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 20),
                const Text(
                  AppStrings.textOne,
                  style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height / 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.email,
                    style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: height / 50),
                AppTextField(
                  validator: (value) => value!.isValidEmail() ? null : "Please Enter Correct E-mail",
                  controller: email,
                  hintText: "Enter Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height / 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: AppColors.white,
                      side: const BorderSide(width: 1.5, color: AppColors.textColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fillColor: MaterialStatePropertyAll(AppColors.materialColor),
                      value: isChecked,
                      onChanged: (value) {
                        isChecked = value!;
                        debugPrint("Taped -->");
                        setState(() {});
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: AppStrings.continuing,
                        style: const TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 16),
                        children: [
                          TextSpan(
                            text: AppStrings.terms,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.materialColor,
                            ),
                          ),
                          const TextSpan(
                            text: AppStrings.readOur,
                            style: TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          TextSpan(
                            text: AppStrings.privacyPolicy,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.materialColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 20),
                AppButton(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: AppColors.materialColor,
                  foregroundColor: AppColors.white,
                  fixedSize: const Size(345, 54),
                  side: const BorderSide(style: BorderStyle.none),
                  buttonText: AppStrings.continueButton,
                  onPressed: () {
                    // isChecked == true
                    //     ? Navigator.pushNamed(
                    //         context,
                    //         RoutesName.onBoarding,
                    //       )
                    //     : null;
                    // setState(() {});
                  },
                ),
                SizedBox(height: height / 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 10,
                        color: AppColors.dividerColor,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      AppStrings.orLogInWith,
                      style: TextStyle(color: AppColors.textColor, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 20,
                        color: AppColors.dividerColor,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        debugPrint("Facebook Taped -->");
                      },
                      child: AppCircleAvatar(
                        backgroundColor: AppColors.materialColor,
                        child: SvgPicture.asset(AppAssets.fb),
                      ),
                    ),
                    SizedBox(width: width / 30),
                    InkWell(
                      onTap: () {
                        debugPrint("Google Taped -->");
                      },
                      child: AppCircleAvatar(
                        backgroundColor: AppColors.materialColor,
                        child: SvgPicture.asset(AppAssets.google),
                      ),
                    ),
                    SizedBox(width: width / 30),
                    InkWell(
                      onTap: () {
                        debugPrint("Twitter Taped -->");
                      },
                      child: AppCircleAvatar(
                        backgroundColor: AppColors.materialColor,
                        child: SvgPicture.asset(AppAssets.twitter),
                      ),
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
