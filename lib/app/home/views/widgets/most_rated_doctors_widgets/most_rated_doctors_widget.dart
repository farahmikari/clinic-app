import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widgets/most_rated_doctor_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class MostRatedDoctorsWidget extends StatelessWidget {
  const MostRatedDoctorsWidget({super.key, required this.mostRatedDoctors});
  final List<MostRatedDoctorModel> mostRatedDoctors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0.hp,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        itemBuilder: (context, index) {
          return MostRatedDoctorWidget(
            mostRatedDoctor: mostRatedDoctors[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.sp);
        },
        itemCount: mostRatedDoctors.length,
      ),
    );
  }
}
