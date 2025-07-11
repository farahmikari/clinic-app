import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: TextFormField(
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.widgetBackgroundColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.lbr),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.lbr),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(AppDimensions.mp),
              child: SvgPicture.asset(
                AppIcons.search,
                color: AppColors.darkGreyColor,
              ),
            ),
            hintText: "Doctor, Date, Department...",
            hintStyle: TextStyle(
              color: AppColors.hintTextColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
          cursorColor: AppColors.mainTextColor,
          autocorrect: false,
        ),
      ),
    );
  }
}
