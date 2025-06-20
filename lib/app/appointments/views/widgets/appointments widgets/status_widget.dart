import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.sp,
            vertical: 1.0.wp,
          ),
          decoration: BoxDecoration(
            color:
                status == "Upcoming"
                    ? AppColors.transparentGreen
                    : AppColors.transparentYellow,
            borderRadius: BorderRadius.circular(AppDimensions.mbr),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: AppColors.widgetBackgroundColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
