import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final Size? fixedSize;
  const AppButton({Key? key, this.buttonText, this.onPressed, this.fixedSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize,
        backgroundColor: AppColors.materialColor,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText!),
    );
  }
}
