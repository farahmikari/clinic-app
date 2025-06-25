import 'package:clinic_app/app/doctor/views/widgets/doctor_info_with_title_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DoctorExperienceAndTreatmentsWidget extends StatelessWidget {
  const DoctorExperienceAndTreatmentsWidget({
    super.key,
    required this.experience,
    required this.treatments,
  });

  final int experience;
  final int treatments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        child: Row(
          children: [
            //----------------------|Doctor Experience|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            DoctorInfoWithTitleWidget(
              title: "Experience : ",
              info: "$experience Years",
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            //----------------------|Doctor Treatments|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            DoctorInfoWithTitleWidget(
              title: "Treatments : ",
              info: "$treatments Patient",
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
