import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xC2FFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.splashLogoTwo, height: 250),
              Image.asset(AppAssets.splashLogo, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
