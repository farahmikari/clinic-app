import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostRatedDoctorImageAndSpecialtyWidget extends StatelessWidget {
  const MostRatedDoctorImageAndSpecialtyWidget({
    super.key,
    required this.id,
    required this.image,
    required this.specialty,
  });

  final int id;
  final String image;
  final String specialty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      onTap: () {
        Get.to(() => DoctorProfileScreen(id: id));
      },
      child: Container(
        height: 20.0.hp,
        padding: EdgeInsets.only(top: AppDimensions.sp),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            //-----------------Image-----------------------------------------------------------------------------------------------------------------
            Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage(image)),
            ),
            //-----------------Specialty-----------------------------------------------------------------------------------------------------------------
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 5.0.hp,
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppDimensions.mbr),
                  ),
                ),
                child: Text(
                  specialty,
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
    );
  }
}
