import 'package:clinic_app/app/department_doctors/views/widgets/shimmer_department_doctor.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class ShimmerDepartmentDoctors extends StatelessWidget {
  const ShimmerDepartmentDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      itemBuilder: (context, index) {
        return ShimmerDepartmentDoctor();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.mp);
      },
      itemCount: 10,
    );
  }
}
