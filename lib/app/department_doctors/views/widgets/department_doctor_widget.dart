import 'package:clinic_app/app/department_doctors/models/department_doctor_model.dart';
import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/doctor_image_with_frame_widget.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:clinic_app/core/widgets/horizontal_info_with_title_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DepartmentDoctorWidget extends StatelessWidget {
  const DepartmentDoctorWidget({super.key, required this.departmentDoctor});
  final DepartmentDoctorModel departmentDoctor;

  Color specifyShiftColor() {
    return departmentDoctor.shift == "Morning"
        ? AppColors.transparentGreen
        : AppColors.transparentYellow;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DoctorProfileScreen(id: 1), transition: Transition.zoom);
      },
      child: Container(
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
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FilterBadgeWidget(
                          badge: departmentDoctor.shift,
                          color: specifyShiftColor(),
                        ),
                        InfoWithIconWidget(
                          icon: "assets/icons/rate.svg",
                          info: departmentDoctor.rate.toString(),
                          infoSize: AppDimensions.sfs,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DoctorNameWidget(
                        name: departmentDoctor.name,
                        size: AppDimensions.lfs,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: HorizontalInfoWithTitleWidget(
                      title: "Treatments",
                      info: "${departmentDoctor.treatments} treatment",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: HorizontalInfoWithTitleWidget(
                      title: "Experience",
                      info: "${departmentDoctor.experience}  Years",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: DoctorImageWithFrameWidget(image: departmentDoctor.image),
            ),
          ],
        ),
      ),
    );
  }
}
