import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';

class PatientImageWidget extends StatelessWidget {
  const PatientImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.mm),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: const Image(
        image: AssetImage("assets/images/patient.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }
}
