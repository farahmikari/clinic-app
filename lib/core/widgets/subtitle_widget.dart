import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: AppDimensions.lfs,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
