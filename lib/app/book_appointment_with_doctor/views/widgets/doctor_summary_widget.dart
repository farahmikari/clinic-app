import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/doctor_image_with_frame_widget.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:clinic_app/core/widgets/horizontal_info_with_title_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';

class DoctorSummaryWidget extends StatelessWidget {
  const DoctorSummaryWidget({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0.wp,
      width: 92.0.wp,
      padding: EdgeInsets.all(AppDimensions.mp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.mp,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FilterBadgeWidget(
                        badge: doctor.shift,
                        color: AppColors.transparentGreen,
                      ),
                      InfoWithIconWidget(
                        icon: "assets/icons/rate.svg",
                        info: doctor.rate.toString(),
                        infoSize: AppDimensions.sfs,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DoctorNameWidget(
                      name: doctor.name,
                      size: AppDimensions.lfs,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HorizontalInfoWithTitleWidget(
                    title: "Specialty",
                    info: doctor.specialty,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: DoctorImageWithFrameWidget(
              image: "assets/images/doctor4.png",
            ),
          ),
        ],
      ),
    );
  }
}
