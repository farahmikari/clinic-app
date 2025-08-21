import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class ContainerSettingWidget extends StatelessWidget {
  const ContainerSettingWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 100.0.wp,
        height: 20.0.hp,
        decoration: BoxDecoration(
          color: AppColors.transparentGreen,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: child,
      ),
    );
  }
}