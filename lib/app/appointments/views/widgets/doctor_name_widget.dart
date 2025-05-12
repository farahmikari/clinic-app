import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class DoctorNameWidget extends StatelessWidget {
  const DoctorNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Sara Eid",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
