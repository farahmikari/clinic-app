import 'package:clinic_app/app/home/views/widgets/most%20rated%20doctors%20widgets/most_rated_doctor_widget.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:flutter/material.dart';

class MostRatedDoctorsWidget extends StatelessWidget {
  const MostRatedDoctorsWidget({super.key, required this.mostRatedDoctors});
  final List<MostRatedDoctorModel> mostRatedDoctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return MostRatedDoctorWidget(mostRatedDoctor: mostRatedDoctors[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: AppDimensions.sm);
      },
      itemCount: mostRatedDoctors.length,
    );
  }
}
