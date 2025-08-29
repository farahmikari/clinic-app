import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class MedicationNameWidget extends StatelessWidget {
  const MedicationNameWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(AppDimensions.sp),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.mbr),
            bottomRight: Radius.circular(AppDimensions.mbr),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Theme.of(context).foregroundColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
