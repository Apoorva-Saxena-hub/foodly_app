import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyBoardType,
    this.controller,
    this.onEditingComplete,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.prefixIcon, this.hintText, // default false
  });

  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final VoidCallback? onEditingComplete;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: kGray, width: 0.4),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyBoardType,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText,
        cursorHeight: 20.h,
        style: appStyle(11, kDark, FontWeight.normal),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: appStyle(11, kDark, FontWeight.normal),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
