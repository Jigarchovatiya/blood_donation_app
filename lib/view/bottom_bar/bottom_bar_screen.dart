import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/view/bottom_bar/campaign/campaigns_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/donnors/donors_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/history/history_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/home_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/constants/app_colors.dart';

int selectedIndex = 0;

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 0;

  List screenList = [];

  onScreenChange(String? value) {
    debugPrint(value);
     if (value == "Donor") {
      selectedIndex = 1;
    } else if (value == "Campaign") {
      selectedIndex = 2;
    }
    setState(() {});
  }

  @override
  void initState() {
    screenList = [
      HomeScreen(onTab: onScreenChange),
      DonorScreen(onTab: onScreenChange),
      CampaignsScreen(onTab: onScreenChange),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.textFillColor,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.home),
            activeIcon: SvgPicture.asset(AppAssets.homeFill),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.donors),
            activeIcon: SvgPicture.asset(AppAssets.donorsFill),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.campaigns),
            activeIcon: SvgPicture.asset(AppAssets.campaignsFill),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.history),
            activeIcon: SvgPicture.asset(AppAssets.historyFill),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.profile),
            activeIcon: SvgPicture.asset(AppAssets.profileFill),
            label: "",
          ),
        ],
      ),
    );
  }
}
