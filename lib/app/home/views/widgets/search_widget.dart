import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      margin: EdgeInsets.only(bottom: 4.0.wp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: boxShadow,
      ),
      child: TextFormField(
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.widgetBackgroundColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.darkGreyColor,
            size: 20.0.sp,
          ),
          hintText: "Doctor, Symptom, Facility, Specialty...",
          hintStyle: TextStyle(
            color: AppColors.hintTextColor,
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        cursorColor: AppColors.mainTextColor,
        autocorrect: false,
      ),
    );
  }
}
