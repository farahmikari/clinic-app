import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWithSearchWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithSearchWidget({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(35.0.wp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      toolbarHeight: 20.0.wp,

      title: Text(
        title,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.0.wp),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.mp,
            left: AppDimensions.mp,
            right: AppDimensions.mp,
          ),
          child: Expanded(
            child: Container(
              height: 15.0.wp,
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
              decoration: BoxDecoration(
                color: AppColors.widgetBackgroundColor,
                borderRadius: BorderRadius.circular(AppDimensions.lbr),
                boxShadow: AppShadow.boxShadow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppDimensions.mp,
                children: [
                  SvgPicture.asset(
                    AppIcons.search,
                    height: AppDimensions.sis,
                    width: AppDimensions.mis,
                    color: AppColors.darkGreyColor,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: AppColors.mainTextColor,
                        fontSize: AppDimensions.mfs,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Doctor, Symptom, Facility, Specialty...",
                        hintStyle: TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: AppDimensions.mfs,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(0.0),
                      ),
                      cursorColor: AppColors.mainTextColor,
                      autocorrect: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
