import 'package:clinic_app/app/prescription/models/lab_test_model.dart';
import 'package:clinic_app/app/prescription/views/widgets/lab_tests_widgets/lab_test_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class LabTestsWidget extends StatelessWidget {
  const LabTestsWidget({super.key, required this.labTests});
  final List<LabTestModel> labTests;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.0.hp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return LabTestWidget(title: labTests[index].name);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.sm);
        },
        itemCount: labTests.length,
      ),
    );
  }
}
