import '../../res/constants/app_assets.dart';
import '../../res/constants/app_strings.dart';

class DonorModel {
  final String title;
  final String image;
  final String subText;

  DonorModel(this.title, this.image, this.subText);
}

List<Map<String, dynamic>> onBoardingList = [
  {
    "image": AppAssets.pageOne,
    "text": AppStrings.welCome,
    "subText": AppStrings.pageOneDisc,
  },
  {
    "image": AppAssets.pageTwo,
    "text": AppStrings.connectingDonors,
    "subText": AppStrings.pageTwoDisc,
  },
  {
    "image": AppAssets.pageThree,
    "text": AppStrings.joinUsToday,
    "subText": AppStrings.pageThreeDisc,
  },
];

List profileImageList = [
  AppAssets.profileOne,
  AppAssets.profileTwo,
  AppAssets.profileThree,
  AppAssets.profileFour,
  AppAssets.profileFive,
  AppAssets.profileSix,
  AppAssets.profileSeven,
  AppAssets.profileFive,
];

List donorsNameList = [
  AppStrings.donorOne,
  AppStrings.donorTwo,
  AppStrings.donorThree,
  AppStrings.donorFour,
  AppStrings.donorFive,
  AppStrings.donorSix,
  AppStrings.donorSeven,
];

List bloodGroupList = [
  "All",
  "A+",
  "A-",
  "AB+",
  "AB-",
  "O+",
  "O-",
  "B+",
  "B-",
];
