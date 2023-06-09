import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/constants/app_colors.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.materialColor,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: AppColors.black,
                ),
              ),
              title: const Text(
                "Create a new contact",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline,
                  color: AppColors.black,
                ),
              ),
              title: const Text(
                "Add to a contact",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/chat.svg",
                  color: AppColors.black,
                ),
              ),
              title: const Text(
                "Send message",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
