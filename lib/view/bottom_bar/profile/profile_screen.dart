import 'package:blood_donation_app/res/constants/app_assets.dart';
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
    List<Map<String, Widget>> profileList = [
      {"icon": const Icon(Icons.person_outline), "title": const Text("Edit Profile")},
      {"icon": const Icon(Icons.notifications_none), "title": const Text("Notification")},
      {"icon": const Icon(Icons.settings), "title": const Text("Settings")},
      {"icon": const Icon(Icons.privacy_tip_outlined), "title": const Text("Privacy Policy")},
      {"icon": const Icon(Icons.sticky_note_2_outlined), "title": const Text("Terms & Condition")},
      {"icon": const Icon(Icons.help_outline), "title": const Text("Help")},
      {"icon": const Icon(Icons.logout, color: AppColors.red), "title": const Text("Log Out")},
    ];
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        title: const Text(
          AppStrings.profile,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.materialColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(300, 100),
                  bottomLeft: Radius.elliptical(300, 100),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 30,
                ),
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.profileImage,
                      height: 128,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.materialColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Aasma Shrestha",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Icon(
                      Icons.verified,
                      color: AppColors.materialColor,
                    )
                  ],
                ),
                const Text(
                  "aasma@gmail.com",
                  style: TextStyle(color: AppColors.textColor),
                ),
                SizedBox(height: height / 40),
                const SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "20",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Text(
                            "Donation",
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: AppColors.dividerGray,
                        thickness: 1,
                        endIndent: 470,
                      ),
                      Column(
                        children: [
                          Text(
                            "B+",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Text(
                            "Blood Group",
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: AppColors.dividerGray,
                        thickness: 1,
                        endIndent: 470,
                      ),
                      Column(
                        children: [
                          Text(
                            "5",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Text(
                            "Campaigns",
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: profileList[index]["icon"],
                            title: profileList[index]["title"],
                            titleTextStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: index == 6 ? AppColors.red : AppColors.textColor,
                            ),
                          ),
                          index == 6
                              ? const SizedBox()
                              : const Divider(
                                  height: 1,
                                  thickness: 1,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
