import 'package:clinic_app/app/appointment%20details/views/widgets/medications%20widgets/medication_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class MedicationsWidget extends StatelessWidget {
  const MedicationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0.hp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return MedicationWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.mm);
        },
        itemCount: 7,
      ),
    );
  }
}
