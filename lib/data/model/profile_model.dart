import 'package:flutter/material.dart';

import '../../res/constants/app_colors.dart';

List<Map<String, Widget>> profileList = [
  {"icon": const Icon(Icons.person_outline), "title": const Text("Edit Profile")},
  {"icon": const Icon(Icons.notifications_none), "title": const Text("Notification")},
  {"icon": const Icon(Icons.settings), "title": const Text("Settings")},
  {"icon": const Icon(Icons.privacy_tip_outlined), "title": const Text("Privacy Policy")},
  {"icon": const Icon(Icons.sticky_note_2_outlined), "title": const Text("Terms & Condition")},
  {"icon": const Icon(Icons.help_outline), "title": const Text("Help")},
  {"icon": const Icon(Icons.logout, color: AppColors.red), "title": const Text("Log Out")},
];
