import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:blood_donation_app/view/bottom_bar/bottom_bar_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/campaign/campaigns_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/history/history_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/donation_campaign_four.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/donation_campaign_one.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/donation_campaign_three.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/donation_campaign_two.dart';
import 'package:blood_donation_app/view/bottom_bar/home_screen/home_screen.dart';
import 'package:blood_donation_app/view/bottom_bar/profile/profile_screen.dart';
import 'package:blood_donation_app/view/entry_point/create_account_one.dart';
import 'package:blood_donation_app/view/entry_point/create_account_two.dart';
import 'package:blood_donation_app/view/entry_point/log_in_screen.dart';
import 'package:blood_donation_app/view/onboarding/onboarding_screen.dart';
import 'package:blood_donation_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../view/bottom_bar/donors/contact_screen.dart';
import '../../view/bottom_bar/donors/donors_detail_screen.dart';
import '../../view/bottom_bar/donors/donors_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.splashScreen: (context) => const SplashScreen(),
  RoutesName.onBoarding: (context) => const OnBoardingScreen(),
  RoutesName.logInScreen: (context) => const LogInScreen(),
  RoutesName.createAccountOne: (context) => const CreateAccountOne(),
  RoutesName.createAccountTwo: (context) => const CreateAccountTwo(),
  RoutesName.bottomNavBar: (context) => const BottomBarScreen(),
  RoutesName.home: (context) => const HomeScreen(),
  RoutesName.donationCampaignOne: (context) => const DonationCampaignOne(),
  RoutesName.donationCampaignTwo: (context) => const DonationCampaignTwo(),
  RoutesName.donationCampaignThree: (context) => const DonationCampaignThree(),
  RoutesName.donationCampaignFour: (context) => const DonationCampaignFour(),
  RoutesName.donor: (context) => const DonorScreen(),
  RoutesName.donorDetail: (context) => const DonorsDetailScreen(),
  RoutesName.contactScreen: (context) => const ContactScreen(),
  RoutesName.campaign: (context) => const CampaignsScreen(),
  RoutesName.history: (context) => const HistoryScreen(),
  RoutesName.profile: (context) => const ProfileScreen(),
};
