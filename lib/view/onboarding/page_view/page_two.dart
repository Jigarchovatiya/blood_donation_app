import 'package:flutter/material.dart';

import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Align(
            heightFactor: 1.2,
            child: Image.asset(
              AppAssets.pageTwo,
              height: 308,
            ),
          ),
          SizedBox(
            height: height / 20,
          ),
          Text(
            AppStrings.connectingDonors,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
          ),
          SizedBox(
            height: height / 30,
          ),
          Text(
            textAlign: TextAlign.center,
            AppStrings.pageTwoDisc,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}
