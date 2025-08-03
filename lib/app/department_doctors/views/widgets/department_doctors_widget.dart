import 'package:clinic_app/app/department_doctors/models/department_doctor_model.dart';
import 'package:clinic_app/app/department_doctors/views/widgets/department_doctor_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DepartmentDoctorsWidget extends StatelessWidget {
  const DepartmentDoctorsWidget({super.key, required this.departmentDoctors});
  final List<DepartmentDoctorModel> departmentDoctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return DepartmentDoctorWidget(
          departmentDoctor: departmentDoctors[index],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.sp);
      },
      itemCount: departmentDoctors.length,
    );
  }
}
