import 'package:clinic_app/app/appointment%20details/views/widgets/lab%20tests%20or%20surgeries%20widgets/lab_test_or_surgery_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class LabTestsOrSurgeriesWidget extends StatelessWidget {
  const LabTestsOrSurgeriesWidget({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.0.hp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return LabTestOrSurgeryWidget(title: "Knee Replacement", icon: icon);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.sm);
        },
        itemCount: 7,
      ),
    );
  }
}
