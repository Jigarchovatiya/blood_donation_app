import 'package:flutter/material.dart';

import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Align(
            heightFactor: 1,
            child: Image.asset(
              AppAssets.pageThree,
              height: 370,
            ),
          ),
          SizedBox(
            height: height / 20,
          ),
          Text(
            AppStrings.joinUsToday,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
          ),
          SizedBox(
            height: height / 30,
          ),
          Text(
            textAlign: TextAlign.center,
            AppStrings.pageThreeDisc,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}
