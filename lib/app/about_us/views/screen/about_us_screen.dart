import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.about_us)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.mp),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.transparentPrimaryColor,
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Expanded(child: Text(S.current.info_clinic)),
          ),
        ),
      ),
    );
  }
}
