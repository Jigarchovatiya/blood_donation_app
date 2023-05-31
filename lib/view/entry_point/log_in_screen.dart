import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/res/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: null,
        title: const Text(
          AppStrings.appBarText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              AppStrings.skip,
              style: TextStyle(color: AppColors.textColor, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFFFFA500),
                          foregroundColor: Colors.white,
                          child: Text("1"),
                        ),
                        Text(
                          AppStrings.account,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        indent: 5,
                        endIndent: 5,
                        color: Color(0xFFD3D3D3),
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFFD3D3D3),
                          foregroundColor: Colors.white,
                          child: Text("2"),
                        ),
                        Text(
                          AppStrings.profile,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        indent: 5,
                        endIndent: 5,
                        color: Color(0xFFD3D3D3),
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFFD3D3D3),
                          foregroundColor: Colors.white,
                          child: Text("3"),
                        ),
                        Text(
                          AppStrings.finish,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
