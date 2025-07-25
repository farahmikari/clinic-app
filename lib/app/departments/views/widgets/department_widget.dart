import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/department_doctors/views/screens/department_doctors_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentWidget extends StatelessWidget {
  const DepartmentWidget({super.key, required this.department});
  final DepartmentModel department;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DepartmentDoctorsScreen(), transition: Transition.zoom);
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          department.name,
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
