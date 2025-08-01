import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widgets/shimmer_most_rated_doctor_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class ShimmerMostRatedDoctorsWidget extends StatelessWidget {
  const ShimmerMostRatedDoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0.hp,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        itemBuilder: (context, index) {
          return ShimmerMostRatedDoctorWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.sp);
        },
        itemCount: 5,
      ),
    );
  }
}
