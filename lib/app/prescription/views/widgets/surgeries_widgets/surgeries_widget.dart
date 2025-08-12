import 'package:clinic_app/app/prescription/models/surgery_model.dart';
import 'package:clinic_app/app/prescription/views/widgets/surgeries_widgets/surgery_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class SurgeriesWidget extends StatelessWidget {
  const SurgeriesWidget({super.key, required this.surgeries});
  final List<SurgeryModel> surgeries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.0.hp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return SurgeryWidget(title: surgeries[index].name);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.sm);
        },
        itemCount: surgeries.length,
      ),
    );
  }
}
