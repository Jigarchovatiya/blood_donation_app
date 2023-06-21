import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/common/app_text_field.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/model/campaign_one_model.dart';
import '../../res/common/app_circle_avatar.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_strings.dart';
import '../../res/global/media_quary.dart';

class CreateAccountOne extends StatefulWidget {
  final Function(String)? onTab;
  const CreateAccountOne({Key? key, this.onTab}) : super(key: key);

  @override
  State<CreateAccountOne> createState() => _CreateAccountOneState();
}

class _CreateAccountOneState extends State<CreateAccountOne> {
  User? person;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  addUser() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) {
        debugPrint("Value--> ${value.user}");
        person = value.user;
        person!.sendEmailVerification();
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        debugPrint("your password is too weak");
      } else if (e.code == "e-mail is used once") {
        debugPrint("this email has already an account logged in ");
      }
    } catch (e) {
      debugPrint("error $e");
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String bloodGroupData = "group 1";

  String genderData = "gender 1";
  List genderList = [
    {
      "value": "gender 1",
      "data": "Male",
    },
    {
      "value": "gender 2",
      "data": "Female",
    },
    {
      "value": "gender 3",
      "data": "others",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.bottomNavBar);
            },
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
                          backgroundColor: Color(0xffE6E6E6),
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
              SizedBox(height: height(context) / 50),
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
                    const AppTextField(
                      hintText: AppStrings.fullName,
                    ),
                    SizedBox(height: height(context) / 50),
                    Row(
                      children: [
                        const Text(
                          AppStrings.age,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width(context) / 2.45),
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
                          width: width(context) / 2.4,
                          hintText: "20",
                        ),
                        AppTextField(
                          width: width(context) / 2.4,
                          hintText: AppStrings.fullName,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              style: const TextStyle(fontSize: 20, color: AppColors.textColor),
                              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                              value: bloodGroupData,
                              isExpanded: true,
                              items: bloodGroupList
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value['value'],
                                      child: Text(
                                        value['data'],
                                      ),
                                    ),
                                  )
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
                    SizedBox(height: height(context) / 50),
                    Row(
                      children: [
                        const Text(
                          AppStrings.gender,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width(context) / 3),
                        const Text(
                          AppStrings.weight,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                          width: width(context) / 2.4,
                          hintText: AppStrings.fullName,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              style: const TextStyle(fontSize: 20, color: AppColors.textColor),
                              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                              value: genderData,
                              isExpanded: true,
                              items: genderList
                                  .map((value) => DropdownMenuItem(
                                        value: value['value'],
                                        child: Text(value['data']),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                debugPrint(value.toString());
                                genderData = value.toString();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        AppTextField(
                          width: width(context) / 2.4,
                          hintText: "60",
                        ),
                      ],
                    ),
                    SizedBox(height: height(context) / 50),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.email,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppStrings.emailExample,
                    ),
                    SizedBox(height: height(context) / 50),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.password,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    AppTextField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.enterPassword,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height(context) / 20),
              AppButton(
                borderRadius: BorderRadius.circular(30),
                backgroundColor: AppColors.materialColor,
                foregroundColor: AppColors.white,
                fixedSize: Size(width(context) / 1.14, height(context) / 15),
                buttonText: AppStrings.continueButton,
                side: const BorderSide(style: BorderStyle.none),
                onPressed: () {
                  addUser();
                  Navigator.pushNamed(context, RoutesName.createAccountTwo);
                  debugPrint("user --> $person");
                },
              ),
              SizedBox(height: height(context) / 20),
            ],
          ),
        ),
      ),
    );
  }
}
