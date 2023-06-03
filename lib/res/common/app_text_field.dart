import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final bool enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final int maxLines;
  final EdgeInsetsGeometry margin;
  final bool autofocus;

  const AppTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.label,
    this.inputFormatters,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.enableInteractiveSelection = true,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.maxLines = 1,
    this.margin = const EdgeInsets.only(top: 8, bottom: 8, right: 20),
    this.autofocus = false,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.textInputAction,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: AppColors.textFillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFillColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          isDense: true,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF8C8A87),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
