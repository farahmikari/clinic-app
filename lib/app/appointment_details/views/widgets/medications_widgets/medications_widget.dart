import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/medication_model.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/medications_widgets/medication_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class MedicationsWidget extends StatelessWidget {
  const MedicationsWidget({super.key, required this.medications});
  final List<MedicationModel> medications;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0.hp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        itemBuilder: (context, index) {
          return MedicationWidget(medication: medications[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.mp);
        },
        itemCount: medications.length,
      ),
    );
  }
}
