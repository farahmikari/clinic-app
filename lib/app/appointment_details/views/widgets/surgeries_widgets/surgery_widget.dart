import 'package:clinic_app/app/appointment_details/views/widgets/main_info_widget.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_icons.dart';
import 'package:flutter/material.dart';

class SurgeryWidget extends StatelessWidget {
  const SurgeryWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.wp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: MainInfoWidget(title: title, icon: AppIcons.surgeries),
    );
  }
}
