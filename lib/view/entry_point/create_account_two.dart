import 'package:flutter/material.dart';

import '../../res/constants/app_colors.dart';
import '../../res/constants/app_strings.dart';

class CreateAccountTwo extends StatefulWidget {
  const CreateAccountTwo({Key? key}) : super(key: key);

  @override
  State<CreateAccountTwo> createState() => _CreateAccountTwoState();
}

class _CreateAccountTwoState extends State<CreateAccountTwo> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text(
          AppStrings.appBarTitle,
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
    );
  }
}
