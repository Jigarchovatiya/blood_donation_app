import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:blood_donation_app/view/onboarding/onboarding_screen.dart';
import 'package:blood_donation_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.splashScreen: (context) => const SplashScreen(),
  RoutesName.onBoarding: (context) => const OnBoardingScreen(),
  // RoutesName.pageOne: (context) => const PageOne(),
  // RoutesName.pageTwo: (context) => const PageTwo(),
  // RoutesName.pageThree: (context) => const PageThree(),
  // RoutesName.logInScreen: (context) => const LogInScreen(),
  // RoutesName.continueWithScreen: (context) => const ContinueWithScreen(),
  // RoutesName.otpLogInScreen: (context) => const OtpLogInScreen(),
  // RoutesName.personalizationScreen: (context) => const PersonalizationScreenOne(),
  // RoutesName.emptyCart: (context) => const EmptyCart(),
  // RoutesName.home: (context) => const Home(),
  // RoutesName.favStore: (context) => const FavStore(),
  // RoutesName.cart: (context) => const Cart(),
  // RoutesName.profile: (context) => const Profile(),
  // RoutesName.bottomBar: (context) => const BottomBar(),
  // RoutesName.section: (context) => const Section(),
};
