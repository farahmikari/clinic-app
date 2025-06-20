import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorImageWidget extends StatelessWidget {
  const DoctorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.sm,
        left: AppDimensions.sm,
        right: AppDimensions.sm,
      ),
      padding: EdgeInsets.only(top: AppDimensions.sp),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.sbr),
          topRight: Radius.circular(AppDimensions.sbr),
        ),
      ),
      child: Image(
        image: NetworkImage("https://pngimg.com/d/doctor_PNG16002.png"),
      ),
    );
  }
}
