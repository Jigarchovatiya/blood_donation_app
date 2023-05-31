import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Align(
            heightFactor: 0.8,
            child: Image.asset(
              AppAssets.pageOne,
              height: 400,
            ),
          ),
          SizedBox(
            height: height / 18,
          ),
          Text(
            AppStrings.welCome,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
          ),
          SizedBox(
            height: height / 30,
          ),
          Text(
            textAlign: TextAlign.center,
            AppStrings.pageOneDisc,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}
