import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class CoreSpecialtyWidget extends StatelessWidget {
  final String specialty;
  const CoreSpecialtyWidget({super.key, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        specialty,
        style: TextStyle(
          color: AppColors.darkGreyColor,
          fontSize: 10.0.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
