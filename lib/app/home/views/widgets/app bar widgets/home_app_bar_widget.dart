import 'package:clinic_app/app/home/views/widgets/app%20bar%20widgets/action_button.dart';
import 'package:clinic_app/app/home/views/widgets/app%20bar%20widgets/patient_image_widget.dart';
import 'package:clinic_app/app/home/views/widgets/app%20bar%20widgets/patient_location_widget.dart';
import 'package:clinic_app/app/home/views/widgets/app%20bar%20widgets/patient_name_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/extentions/responsive_text_extention.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(19.0.hp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      toolbarHeight: 12.0.hp,
      leadingWidth: 12.0.hp,
      titleSpacing: 0.0.sp,
      actionsPadding: EdgeInsets.symmetric(vertical: AppDimensions.sp),
      //--------------------|Patient Image|-----------------------------------------------------------------------------------------------------------------------------------------------------
      leading: PatientImageWidget(),
      //---------------------|Patient Name|------------------------------------------------------------------------------------------------------------------------------------------------
      title: PatientNameWidget(),
      actions: [
        //----------------|Notifications Button|-------------------------------------------------------------------------------------------------------------------------------------------------
        ActionButton(icon: AppIcons.notifications, onPressed: () {}),
        //--------------------|Cart Button|-------------------------------------------------------------------------------------------------------------------------------------------
        ActionButton(icon: AppIcons.cart, onPressed: () {}),
      ],
      //--------------------|Patient Location|----------------------------------------------------------------------------------------------------------------------------------------------
      bottom: PatientLocationWidget(),
    );
  }
}
