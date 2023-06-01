import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  const AppCircleAvatar({Key? key, this.backgroundColor, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 25, backgroundColor: backgroundColor!, foregroundColor: Colors.white, child: child!);
  }
}
