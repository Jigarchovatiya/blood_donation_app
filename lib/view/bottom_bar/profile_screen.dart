import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.materialColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(400, 100),
                  bottomLeft: Radius.elliptical(400, 100),
                ),
              ),
            ),
            Column(
              children: [
                Text(AppStrings.skip),
              ],
            )
          ],
        ),
      ),
    );
  }
}
