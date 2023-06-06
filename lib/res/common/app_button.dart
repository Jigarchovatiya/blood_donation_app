import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final Size? fixedSize;
  final BorderSide? side;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  const AppButton({
    Key? key,
    this.buttonText,
    this.onPressed,
    this.fixedSize,
    this.side,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          side: side!,
          borderRadius: borderRadius!,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText!,
      ),
    );
  }
}
