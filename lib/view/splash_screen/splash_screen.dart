import 'dart:async';

import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../res/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.onBoarding, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.splashLogoTwo, height: height / 4),
              Image.asset(AppAssets.splashLogo, height: height / 6),
            ],
          ),
        ),
      ),
    );
  }
}
