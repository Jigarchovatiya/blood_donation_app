import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/common/app_button.dart';
import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';

class CampaignsScreen extends StatefulWidget {
  final Function(String)? onTap;

  const CampaignsScreen({Key? key, this.onTap}) : super(key: key);

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        backgroundColor: AppColors.materialColor,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(AppStrings.campaigns),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.donorsNearYou,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: height / 5,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.donateAndSaveLife, height: height / 6),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppStrings.donateAndSaveLife,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.map),
                              SizedBox(width: width / 50),
                              const Text(
                                AppStrings.map,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.calender),
                              SizedBox(width: width / 50),
                              const Text(
                                AppStrings.calender,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.clock),
                              SizedBox(width: width / 50),
                              const Text(
                                AppStrings.clock,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          AppButton(
                            borderRadius: BorderRadius.circular(30),
                            backgroundColor: AppColors.materialColor,
                            foregroundColor: AppColors.white,
                            fixedSize: Size(width / 2, height / 100),
                            buttonText: AppStrings.donate,
                            side: const BorderSide(style: BorderStyle.none),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
