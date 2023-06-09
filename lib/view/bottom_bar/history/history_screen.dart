import 'package:blood_donation_app/res/common/app_circle_avatar.dart';
import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        title: const Text(
          AppStrings.history,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(height: height / 70),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    // margin: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: height / 100, vertical: width / 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: height / 80),
                              const AppCircleAvatar(
                                child: Icon(Icons.restore),
                                radius: 24,
                                foregroundColor: AppColors.black,
                                backgroundColor: AppColors.dividerColor,
                              ),
                            ],
                          ),
                          SizedBox(width: width / 80),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Puran Gurung",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height / 100),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.calenderGray),
                                  SizedBox(width: width / 50),
                                  const Text("2023/05/02"),
                                ],
                              ),
                              SizedBox(width: width / 50),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.mapGray),
                                  SizedBox(width: width / 50),
                                  Text("Pokhara-16, Lamachaur, "),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 80,
                              ),
                              Container(
                                height: 28,
                                width: 82,
                                decoration: BoxDecoration(
                                  color: AppColors.buttonRed,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    "Donate",
                                    style: TextStyle(
                                      color: AppColors.materialColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height / 70),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Erlier",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(height: height / 70),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: height / 50),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 100, horizontal: width / 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: height / 80),
                              const AppCircleAvatar(
                                child: Icon(Icons.restore),
                                radius: 24,
                                foregroundColor: AppColors.black,
                                backgroundColor: AppColors.dividerColor,
                              ),
                            ],
                          ),
                          SizedBox(width: width / 80),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Puran Gurung",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height / 200),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.calenderGray),
                                  SizedBox(width: width / 50),
                                  const Text("2023/05/02"),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.mapGray),
                                  SizedBox(width: width / 50),
                                  Text("Pokhara-16, Lamachaur, "),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 80,
                              ),
                              Container(
                                height: 28,
                                width: 82,
                                decoration: BoxDecoration(
                                  color: index == 0 ? AppColors.buttonGreen : AppColors.buttonRed,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    "Donate",
                                    style: TextStyle(
                                      color: index == 0 ? AppColors.textGreen : AppColors.materialColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
