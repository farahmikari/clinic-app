import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class NameWidget extends StatelessWidget {
  final String name;
  const NameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
