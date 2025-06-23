import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PatientLocationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PatientLocationWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: SvgPicture.asset(
        AppIcons.location,
        height: AppDimensions.mis,
        width: AppDimensions.mis,
         color:AppColors.darkGreyColor,
      ),
      title: Text(
        'Umayyad Mosque, Damascus, Syria',
        style: TextStyle(
          color: AppColors.darkGreyColor,
          fontSize: AppDimensions.mfs,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.primaryColor,
        size: AppDimensions.sis,
      ),
    );
  }
}
