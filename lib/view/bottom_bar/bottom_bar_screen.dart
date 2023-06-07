import 'package:blood_donation_app/res/constants/app_assets.dart';
import 'package:blood_donation_app/view/bottom_bar/campaign/campaigns_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/donnors/donnors_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/history/history_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/home_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  Widget build(BuildContext context) {
    final List screenList = [
      const HomeScreen(),
      const DonnerScreen(),
      const CampaignsScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    int selectedIndex = 0;
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xff999999),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
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
