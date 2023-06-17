import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/view/entry_point/create_account_one.dart';
import 'package:blood_donation_app/view/entry_point/log_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../res/common/app_circle_avatar.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_strings.dart';
import '../../utils/routes/routes_name.dart';

class OtpLogInScreen extends StatefulWidget {
  const OtpLogInScreen({Key? key}) : super(key: key);

  @override
  State<OtpLogInScreen> createState() => _OtpLogInScreenState();
}

class _OtpLogInScreenState extends State<OtpLogInScreen> {
  TextEditingController mobile = TextEditingController();
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
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, size: 20),
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(height: height / 90),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 100,
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
                            width: MediaQuery.of(context).size.width / 200,
                          ),
                          const Text(
                            AppStrings.finish,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 200,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 50),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: AppStrings.enterOtp,
                        style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      TextSpan(
                        text: mobile.text,
                        style: const TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      TextSpan(
                        text: AppStrings.editNumber,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.materialColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 50),
                OTPTextField(
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: AppColors.black,
                    focusBorderColor: AppColors.materialColor,
                  ),
                  margin: const EdgeInsets.only(top: 30),
                  length: 6,
                  isDense: true,
                  width: 350,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 5,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.materialColor,
                  ),
                ),
                SizedBox(height: height / 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: AppStrings.dintReceive,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInScreen(),
                                ),
                              ),
                        text: AppStrings.resendOtp,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.materialColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 20),
                AppButton(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: AppColors.materialColor,
                  foregroundColor: AppColors.white,
                  fixedSize: Size(width / 1.14, height / 15),
                  side: const BorderSide(style: BorderStyle.none),
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.createAccountOne);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountOne(),
                      ),
                    );
                  },
                  buttonText: AppStrings.continueButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
