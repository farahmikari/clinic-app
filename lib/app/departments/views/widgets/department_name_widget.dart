import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DepartmentNameWidget extends StatelessWidget {
  const DepartmentNameWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: AppDimensions.mfs,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
