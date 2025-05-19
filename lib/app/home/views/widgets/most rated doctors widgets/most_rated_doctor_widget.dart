import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:clinic_app/app/home/views/widgets/most%20rated%20doctors%20widgets/most_rated_doctor_image_and_specialty_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most%20rated%20doctors%20widgets/most_rated_doctor_name_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most%20rated%20doctors%20widgets/most_rated_doctor_rate_and_treatments_widget.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class MostRatedDoctorWidget extends StatelessWidget {
  const MostRatedDoctorWidget({super.key, required this.mostRatedDoctor});

  final MostRatedDoctorModel mostRatedDoctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0.wp,
      color: Colors.transparent,
      child: Column(
        children: [
          //----------------Image & Specialty Widget-------------------------------------------------------------------------------------------------------------------------------------------------
          MostRatedDoctorImageAndSpecialtyWidget(
            id: mostRatedDoctor.id,
            image: mostRatedDoctor.image,
            specialty: mostRatedDoctor.specialty,
          ),
          //----------------------Name Widget---------------------------------------------------------------------------------------------------------------------------------------------------------
          MostRatedDoctorNameWidget(name: mostRatedDoctor.name),
          //----------------Rate & Treatments Widget--------------------------------------------------------------------------------------------------------------------------------------------------
          MostRatedDoctorRateAndTreatmentsWidget(
            rate: mostRatedDoctor.rate,
            treatments: mostRatedDoctor.treatments,
          ),
        ],
      ),
    );
  }
}
