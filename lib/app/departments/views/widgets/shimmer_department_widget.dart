import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class ShimmerDepartmentWidget extends StatelessWidget {
  const ShimmerDepartmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
    );
  }
}
