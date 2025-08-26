import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class MedicationNoteWidget extends StatelessWidget {
  const MedicationNoteWidget({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.sm),
      padding: EdgeInsets.all(AppDimensions.sp),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
      child: Text(
        note,
        style: TextStyle(
          color: Theme.of(context).primaryTextColor,
          fontSize: AppDimensions.sfs,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
