import 'package:blood_donation_app/res/common/app_button.dart';
import 'package:blood_donation_app/res/common/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  addUser() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email.text, password: password.text);
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

  User? person;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String bloodGroupData = "group 1";
  List bloodGroupList = [
    {
      "value": "group 1",
      "data": "O+",
    },
    {
      "value": "group 2",
      "data": "O-",
    },
    {
      "value": "group 3",
      "data": "A+",
    },
    {
      "value": "group 4",
      "data": "A-",
    },
    {
      "value": "group 5",
      "data": "B+",
    },
    {
      "value": "group 6",
      "data": "B-",
    },
    {
      "value": "group 7",
      "data": "AB+",
    },
    {
      "value": "group 8",
      "data": "AB-",
    },
  ];
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
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        const Text(
                          AppStrings.age,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width / 2.45),
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
                          width: 164,
                          hintText: "20",
                        ),
                        AppTextField(
                          width: 164,
                          hintText: AppStrings.fullName,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              style: TextStyle(fontSize: 20, color: AppColors.textColor),
                              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 30),
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
                          AppStrings.gender,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: width / 3),
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
                          width: 164,
                          hintText: AppStrings.fullName,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              style: TextStyle(fontSize: 20, color: AppColors.textColor),
                              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 30),
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
                          width: 164,
                          hintText: "60",
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
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
                    SizedBox(height: height / 50),
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
