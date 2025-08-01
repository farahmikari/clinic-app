import 'package:clinic_app/core/widgets/search_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class DepartmentsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DepartmentsAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(17.0.hp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      title: Text(
        "Departments",
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0.hp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.mm),
          child: SearchWidget(),
        ),
      ),
    );
  }
}
