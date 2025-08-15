import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostRatedDoctorWidget extends StatelessWidget {
  const MostRatedDoctorWidget({super.key, required this.mostRatedDoctor});

  final MostRatedDoctorModel mostRatedDoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DoctorProfileScreen(id: mostRatedDoctor.id));
      },
      child: SizedBox(
        width: 45.0.wp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45.0.wp,
              padding: EdgeInsets.only(top: AppDimensions.mp),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
                boxShadow: AppShadow.boxShadow,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage(mostRatedDoctor.image)),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.mp,
                        vertical: AppDimensions.sp,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppDimensions.mbr),
                        ),
                      ),
                      child: Text(
                        mostRatedDoctor.specialty,
                        style: TextStyle(
                          color: AppColors.widgetBackgroundColor,
                          fontSize: AppDimensions.sfs,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.mp),
            DoctorNameWidget(
              name: mostRatedDoctor.name,
              size: AppDimensions.mfs,
            ),
            SizedBox(height: AppDimensions.mp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoWithIconWidget(
                  icon: AppIcons.rate,
                  info: mostRatedDoctor.rate.toString(),
                  infoSize: AppDimensions.mfs,
                ),
                Text(
                  "(${mostRatedDoctor.treatments} Treatments)",
                  style: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
