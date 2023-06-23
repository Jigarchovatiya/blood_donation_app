import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/model/donation_campaign_model.dart';
import '../../../res/common/app_button.dart';
import '../../../res/constants/app_assets.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_strings.dart';
import '../../../res/global/media_query.dart';
import '../../../utils/routes/routes_name.dart';

class CampaignsScreen extends StatefulWidget {
  final Function(String)? onTab;

  const CampaignsScreen({Key? key, this.onTab}) : super(key: key);

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        backgroundColor: AppColors.materialColor,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(AppStrings.campaigns),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ListView.builder(
              itemCount: campaignList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: height(context) / 5,
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
                      Image.asset(AppAssets.donateAndSaveLife, height: height(context) / 6),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            campaignList[index]["title"],
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.map),
                              SizedBox(width: width(context) / 50),
                              Text(
                                campaignList[index]["location"],
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.calender),
                              SizedBox(width: width(context) / 50),
                              Text(
                                campaignList[index]["date"],
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.clock),
                              SizedBox(width: width(context) / 50),
                              Text(
                                campaignList[index]["time"],
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          AppButton(
                            borderRadius: BorderRadius.circular(30),
                            backgroundColor: AppColors.materialColor,
                            foregroundColor: AppColors.white,
                            fixedSize: Size(width(context) / 2.2, height(context) / 100),
                            buttonText: AppStrings.donate,
                            side: const BorderSide(style: BorderStyle.none),
                            onPressed: () {
                              Navigator.pushNamed(context, RoutesName.donationCampaignOne);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
