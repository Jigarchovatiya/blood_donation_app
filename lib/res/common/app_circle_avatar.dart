import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const AppCircleAvatar({Key? key, this.backgroundColor, this.child, this.foregroundColor, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      child: child!,
    );
  }
}
