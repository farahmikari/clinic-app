import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/responsive_text_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MostRatedDoctorRateAndTreatmentsWidget extends StatelessWidget {
  const MostRatedDoctorRateAndTreatmentsWidget({
    super.key,
    required this.rate,
    required this.treatments,
  });

  final num rate;
  final int treatments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          //------------------Rate Icon---------------------------------------------------------------------------------------------------------------------------------------------------
          Expanded(
            flex: 1,
            child: Center(
              child: SvgPicture.asset(
                AppIcons.rate,
                height: AppDimensions.sis,
                width: AppDimensions.sis,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          //---------------------Rate---------------------------------------------------------------------------------------------------------------------------------------------------
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                rate.toString(),
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: AppDimensions.lfs,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //-------------------Treatments------------------------------------------------------------------------------------------------------------------------------------------------
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                "($treatments treatment)",
                style: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: 8.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
